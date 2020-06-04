from django.contrib import admin
from django.db.models import Count
from django.utils.html import format_html

from .models import *

# Register your models here.
from .. import settings


# TODO change the urls for the images shown (Equipments class, image_tag method)


class NumberOfMembersFilter(admin.SimpleListFilter):
    title = 'Number of Students'
    parameter_name = 'number_of_students'

    def lookups(self, request, model_admin):
        return (
            ('1', '1'),
            ('2', '2'),
            ('3', '3'),
            ('4', '4'),
            ('5', '5'),
            ('6', '6 or more'),
        )

    def queryset(self, request, queryset):
        value = self.value()
        if value:
            queryset = queryset.annotate(number=Count('students'))
            if value == "6":
                return queryset.filter(number__gt=int(value) - 1)
            else:
                return queryset.filter(number=value)
        else:
            return queryset


################################################################################
class StudentAdmin(admin.ModelAdmin):
    list_display = ("name", "mail", "nmec")


class ExitAdmin(admin.ModelAdmin):
    readonly_fields = ('timestamp',)


class RequestsAdmin(admin.ModelAdmin):

    def request(self, obj):
        return obj

    def project_name(self, obj):
        link = reverse("admin:technician_api_project_change", args=[obj.project_ref.code])
        return format_html('<a href="{}">{}</a>', link, obj.project_ref.short_name)

    def equipment_link(self, obj):
        link = reverse("admin:technician_api_equipments_change", args=[obj.equipment_ref.ref])
        return format_html('<a href="{}">{}</a>', link, obj.equipment_ref.description)

    ordering = ["id"]
    readonly_fields = ('timestamp', 'dateAcknowledged')
    list_display = ("request", "project_name", "equipment_link")
    search_fields = (
        'id', 'equipment_ref__description', 'equipment_ref__family', 'project_ref__short_name', 'project_ref__name')

    request.admin_order_field = 'id'
    request.short_description = 'Request id'

    project_name.admin_order_field = 'project_ref__short_name'
    project_name.short_description = 'Project requesting'

    equipment_link.short_description = 'Requested Equipment'
    equipment_link.admin_order_field = 'equipment_ref__description'


class GroupAdmin(admin.ModelAdmin):
    class StudentsInline(admin.TabularInline):
        model = Group.students.through
        extra = 0

    def project(self, obj):
        return obj.cod_project.short_name

    def students_list(self, obj):
        return [p for p in obj.students.all()]

    def number_of_members(self, obj):
        return obj.students.count()

    list_display = ["cod_group", "group_number", "project", "students_list"]
    search_fields = ["cod_group", "group_number", "students__name", "cod_project__short_name"]
    list_filter = (NumberOfMembersFilter,)

    inlines = [
        StudentsInline,
    ]

    project.short_description = 'project'
    project.admin_order_field = 'cod_project__short_name'


class EquipmentAdmin(admin.ModelAdmin):

    # Image Processing
    def image_tag(self, obj):
        return format_html(
            '<img src="{}" width="20" height="20" />'.format("http://localhost:8000/img/" + str(obj.image_file)))

    def make_unavailable(self, request, queryset):
        queryset.update(status='ind')

    def make_available(self, request, queryset):
        queryset.update(status='dis')

    ordering = ["ref"]
    list_display = ["ref", "family", "description", "location", "price", "broken", "status", "borrowed_items",
                    "total_items", "image_tag"]
    list_filter = ("family", "broken", "status")
    search_fields = ["ref", "family", "description", "location", "price", "broken", "status", "borrowed_items",
                     "total_items", ]

    actions = ["make_unavailable", "make_available"]

    make_available.short_description = "Mark selected Equipments as available"
    make_unavailable.short_description = "Mark selected Equipments as unavailable"
    image_tag.short_description = 'Image'


class ProjectAdmin(admin.ModelAdmin):
    list_display = ["code", "short_name", "name", "year", "semester"]
    search_fields = ["code", "short_name", "name", "year", "semester"]
    list_filter = ["year", "semester"]


admin.site.register(Group, GroupAdmin)
admin.site.register(Student, StudentAdmin)
admin.site.register(Request, RequestsAdmin)
admin.site.register(Exit, ExitAdmin)
admin.site.register(Equipments, EquipmentAdmin)
admin.site.register(Project, ProjectAdmin)

admin.site.register(Entrance)
admin.site.register(Missing)

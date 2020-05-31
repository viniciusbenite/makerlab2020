from django.contrib import admin
from django.utils.html import format_html

from .models import *

# Register your models here.
from .. import settings


class StudentAdmin(admin.ModelAdmin):
    list_display = ("name", "mail", "nmec")


class ExitAdmin(admin.ModelAdmin):
    readonly_fields = ('timestamp',)


class RequestsAdmin(admin.ModelAdmin):
    readonly_fields = ('timestamp',)


class StudentsInline(admin.TabularInline):
    model = Group.students.through
    extra = 3


class GroupAdmin(admin.ModelAdmin):
    list_display = ["cod_group", "group_number", "students_list"]
    inlines = [
        StudentsInline,
    ]

    def students_list(self, obj):
        return [p for p in obj.students.all()]


class EquipmentAdmin(admin.ModelAdmin):

    # Image Processing
    def image_tag(self, obj):
        return format_html(
            '<img src="{}" width="20" height="20" />'.format("http://localhost:8000/img/" + str(obj.image_file)))

    image_tag.short_description = 'Image'

    list_display = ["ref", "family", "description", "location", "price", "broken", "status", "borrowed_items",
                    "total_items", "image_tag"]
    list_filter = ("family", "broken", "status")

    search_fields = ["ref", "family", "description", "location", "price", "broken", "status", "borrowed_items",
                     "total_items", ]

    actions = ["make_unavailable", "make_available"]

    def make_unavailable(modeladmin, queryset):
        queryset.update(status='ind')

    make_unavailable.short_description = "Mark selected Equipments as unavailable"

    def make_available(modeladmin, queryset):
        queryset.update(status='dis')

    make_available.short_description = "Mark selected Equipments as available"

    ordering = ["ref"]


admin.site.register(Group, GroupAdmin)
admin.site.register(Student, StudentAdmin)
admin.site.register(Request, RequestsAdmin)
admin.site.register(Exit, ExitAdmin)
admin.site.register(Equipments, EquipmentAdmin)

admin.site.register(Entrance)
admin.site.register(Project)
admin.site.register(Missing)

from django.contrib import admin

from .models import *

# Register your models here.

admin.site.register(Equipments)
admin.site.register(Project)


class StudentAdmin(admin.ModelAdmin):
    list_display = ("name", "nmec")
admin.site.register(Student, StudentAdmin)

admin.site.register(Group)
admin.site.register(Entrance)
admin.site.register(Exit)


class RequestsAdmin(admin.ModelAdmin):  # To make the timestamp parameter readable in the admin page
    readonly_fields = ('timestamp',)
admin.site.register(Request, RequestsAdmin)

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

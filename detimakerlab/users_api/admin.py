from django.contrib import admin

from .models import *

# Register your models here.

admin.site.register(Student)
admin.site.register(Project)
admin.site.register(Group)


class StudentAdmin(admin.ModelAdmin):
    list_display = ("name", "nmec")

# admin.site.register(Student, StudentAdmin)

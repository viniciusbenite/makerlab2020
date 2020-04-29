# -*- coding: utf-8 -*-

from __future__ import unicode_literals

from django.db import models


class Project(models.Model):
    code = models.IntegerField(primary_key=True)
    short_name = models.CharField(max_length=32)
    name = models.CharField(max_length=64)
    year = models.IntegerField()
    semester = models.IntegerField()

    def __str__(self):
        return self.short_name


class Group(models.Model):
    cod_group = models.IntegerField(primary_key=True)
    year = models.IntegerField()
    group_number = models.IntegerField()
    cod_project = models.ForeignKey(  # One group can have many projects
        Project,
        on_delete=models.CASCADE,
        blank=True,
        null=True
    )
    teacher = models.CharField(max_length=64, blank=True)

    def __str__(self):
        return str(self.cod_group)


class Student(models.Model):  # Student also works as teacher (so is more like a USER table than a student table)
    nmec = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=128)
    mail = models.CharField(max_length=64)
    groups = models.ManyToManyField(Group, blank=True)

    # A student can have multiple groups and a group can have multiple students

    def __str__(self):
        return self.name

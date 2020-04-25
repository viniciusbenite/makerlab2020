# -*- coding: utf-8 -*-

from __future__ import unicode_literals

import datetime
import sys

from django.db import models
from django.urls import reverse


class Equipments(models.Model):
    family = models.CharField(max_length=100, help_text="Enter the family of the component")
    ref = models.IntegerField(primary_key=True)
    description = models.CharField(max_length=100, help_text="Enter the description of the product")
    location = models.CharField(max_length=10, help_text="Location of equipment")
    total_items = models.IntegerField()
    borrowed_items = models.IntegerField()
    price = models.FloatField()
    BROKEN = (
        ('yes', 'broken'),
        ('no', 'ok'),
    )
    broken = models.CharField(max_length=3, choices=BROKEN, blank=True, default='no',
                              help_text='Condition of the equipment')
    STATUS = (
        ('dis', 'Available'),
        ('ind', 'Unavailable'),
    )
    status = models.CharField(max_length=3, choices=STATUS, blank=True, default='dis', help_text='Status of equipment')

    def borrow_equipment(self):
        if self.borrowed_items >= self.total_items:
            print('Error. Borrow > total')
            sys.exit(1)
        self.borrowed_items += 1
        self.save()

    def return_equipment(self):
        if self.borrowed_items == 0:
            sys.exit(1)
        self.borrowed_items -= 1
        self.save()

    def set_status(self):
        if self.total_items <= self.borrowed_items:
            self.status = 'ind'
            self.save()
        elif self.broken == 'yes':
            self.status = 'rep'
            self.save()
        else:
            self.status = 'dis'
            self.save()

    def get_absolute_url(self):
        """
        Returns the url to access a particular instance of Equipments.
        """
        return reverse('equipment-detail-view', args=[str(self.ref)])

    def __str__(self):
        return self.description


class Project(models.Model):
    code = models.IntegerField(primary_key=True)
    short_name = models.CharField(max_length=32)
    name = models.CharField(max_length=64)
    year = models.IntegerField()
    semester = models.IntegerField()


class Group(models.Model):
    cod_group = models.CharField(max_length=32, primary_key=True)
    year = models.IntegerField()
    group_number = models.IntegerField()
    cod_project = models.ForeignKey(  # One group can have many projects
        Project,
        on_delete=models.CASCADE,
    )
    teacher = models.CharField(max_length=64, blank=True)


class Student(models.Model):  # Student also works as teacher (so is more like a USER than a student)
    nmec = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=128)
    mail = models.CharField(max_length=64)
    groups = models.ManyToManyField(Group, blank=True)


class Entrance(models.Model):
    id = models.IntegerField(primary_key=True)
    component_ref = models.OneToOneField(Equipments, on_delete=models.CASCADE)
    quantity = models.IntegerField()
    date = models.DateField(default=datetime.date.today)
    supplier = models.CharField(max_length=64)
    price_iva = models.IntegerField()
    price_unity = models.CharField(max_length=16)


class Exit(models.Model):
    id = models.IntegerField(primary_key=True)
    component_ref = models.OneToOneField(Equipments, on_delete=models.CASCADE)
    quantity = models.IntegerField()
    year = models.IntegerField()
    project = models.OneToOneField(Project, on_delete=models.CASCADE)
    group = models.OneToOneField(Group, on_delete=models.CASCADE)
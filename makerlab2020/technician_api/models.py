# -*- coding: utf-8 -*-

from __future__ import unicode_literals

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
        ('dis', 'Disponible'),
        ('ind', 'Indisponible'),
    )
    status = models.CharField(max_length=3, choices=STATUS, blank=True, default='dis', help_text='Status of equipment')

    def borrow_equipment(self):
        if self.borrowed_items > self.total_items:
            sys.exit(1)
        self.borrowed_items += 1
        self.save()

    def return_equipment(self):
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

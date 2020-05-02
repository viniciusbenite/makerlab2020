# class that's used to transform models data to a serialized format such as JSON or XML

from rest_framework import serializers

from detimakerlab.technician_api.models import *


class EquipmentsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Equipments
        fields = ('family', 'ref', 'description', 'location', 'total_items', 'borrowed_items',
                  'price', 'broken', 'status')


class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = ('code', 'short_name', 'name', 'year', 'semester')


class RequestSerializer(serializers.ModelSerializer):
    class Meta:
        model = Request
        fields = ('id', 'equipment_ref', 'project_ref', 'status', 'timestamp')

# class that's used to transform models data to a serialized format such as JSON or XML

from rest_framework import serializers

from detimakerlab.technician_api.models import *


class EquipmentsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Equipments
        fields = ('family', 'ref', 'description', 'location', 'total_items', 'borrowed_items',
                  'price', 'status')


class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = ('project_id', 'owner', 'equipments_used')

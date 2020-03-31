# class that's used to transform models data to a serialized format such as JSON or XML

from rest_framework import serializers

from makerlab2020.technician_api.models import Equipments, Projects


class EquipmentsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Equipments
        fields = ('family', 'ref', 'description', 'location', 'total_items', 'borrowed_items',
                  'price', 'status')


class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Projects
        fields = ('project_id', 'owner', 'equipments_used')

# class that's used to transform models data to a serialized format such as JSON or XML

from rest_framework import serializers

from detimakerlab.technician_api.models import *


class EquipmentsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Equipments
        fields = '__all__'


class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = ('code', 'short_name', 'name', 'year', 'semester', 'equipment')


class RequestSerializer(serializers.ModelSerializer):
    class Meta:
        model = Request
        fields = ('id', 'equipment_ref', 'project_ref', 'status', 'timestamp')


class ExitSerializer(serializers.ModelSerializer):
    class Meta:
        model = Exit
        fields = ('id', 'component_ref', 'quantity', 'year', 'project', 'group', 'timestamp')


class StudentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Student
        fields = ('nmec', 'name', 'mail')


class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = ('cod_group', 'year', 'group_number', 'cod_project')


class MissingSerializer(serializers.ModelSerializer):
    class Meta:
        model = Missing
        fields = ('id', 'equipment_ref', 'project_ref', 'group_ref', 'year')

# class that's used to transform models data to a serialized format such as JSON or XML

from rest_framework import serializers
from makerlab2020.users_api.models import *


class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = ('code', 'short_name', 'name', 'year', 'semester')


class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = ('cod_group', 'year', 'group_number', 'cod_project', 'teacher')


class StudentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Student
        fields = ('nmec', 'name', 'mail', 'groups')

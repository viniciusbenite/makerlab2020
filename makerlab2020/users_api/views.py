from django.contrib.auth import authenticate
from django.views.decorators.csrf import csrf_exempt
from rest_framework import generics
from rest_framework.authtoken.models import Token
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.status import HTTP_400_BAD_REQUEST, HTTP_404_NOT_FOUND, HTTP_200_OK
from rest_framework.views import APIView

from makerlab2020.users_api.serializers import *


class MainPage(APIView):

    def get(self, request):
        msg = {'message': 'This is our main page!'}
        return Response(msg)


class ListAllProjects(generics.ListCreateAPIView):
    """
        GET method to list all projects in dB
        POST method to create a new project
    """
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer


class ListAllGroups(generics.ListCreateAPIView):
    """
        GET method to list all groups in dB
        POST method to create a new group
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer


class ListAllStudents(generics.ListCreateAPIView):
    """
        GET method to list all students in dB
        POST method to create a new Student
    """
    queryset = Student.objects.all()
    serializer_class = StudentSerializer


class ProjectDetails(generics.RetrieveUpdateDestroyAPIView):
    """
        GET, PUT, PATH, DELETE methods for on a single project
    """
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer


class GroupDetails(generics.RetrieveUpdateDestroyAPIView):
    """
        GET, PUT, PATH, DELETE methods for on a single group
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer

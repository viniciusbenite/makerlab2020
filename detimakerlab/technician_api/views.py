# -*- coding: utf-8 -*-
from django.contrib.auth import authenticate
from django.http import QueryDict
from django.views.decorators.csrf import csrf_exempt
from rest_framework import generics
from rest_framework.authtoken.models import Token
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.status import HTTP_400_BAD_REQUEST, HTTP_404_NOT_FOUND, HTTP_200_OK
from rest_framework.views import APIView

from detimakerlab.technician_api.models import *
from detimakerlab.technician_api.serializers import EquipmentsSerializer, ProjectSerializer, RequestSerializer


@csrf_exempt
@api_view(["POST"])
@permission_classes((AllowAny,))
def login(request):
    """
    Create a token for user.
    Call this method within a valid username/password to generate da token. Then, use it in the headers:
    Authorization:Token **********
    Create user via: python manage.py createuser
    """
    username = request.data.get("username")
    password = request.data.get("password")
    if username is None or password is None:
        return Response({'error': 'Please provide both username and password'},
                        status=HTTP_400_BAD_REQUEST)
    user = authenticate(username=username, password=password)
    if not user:
        return Response({'error': 'Invalid Credentials'},
                        status=HTTP_404_NOT_FOUND)
    token, _ = Token.objects.get_or_create(user=user)
    return Response({'token': token.key},
                    status=HTTP_200_OK)


class MainPage(APIView):

    def get(self, request):
        msg = {'message': 'This is our main page!'}
        return Response(msg)


class ListAllEquipments(generics.ListCreateAPIView):
    """
        GET method to list all equipments in dB
        POST method to create a new equipment
    """
    queryset = Equipments.objects.all()
    serializer_class = EquipmentsSerializer


class EquipmentsDetails(generics.RetrieveUpdateDestroyAPIView):
    """
        GET, PUT, PATH, DELETE methods for a single equipment
    """
    queryset = Equipments.objects.all()
    serializer_class = EquipmentsSerializer


class ListAllProjects(generics.ListCreateAPIView):
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer


class ProjectsDetails(generics.RetrieveUpdateDestroyAPIView):
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer


class BorrowEquipments(APIView):
    """
        When the technician authorize a student to borrow an equipment,
        this PUT method automatically updates the stock and update the availability.
    """

    def get_object(self, pk):
        try:
            return Equipments.objects.get(pk=pk)
        except Equipments.DoesNotExist:
            return Response('Equipment not found', status=HTTP_404_NOT_FOUND)

    def put(self, request, pk):
        equipment = self.get_object(pk)
        serializer = EquipmentsSerializer(equipment, data=request.data)
        if serializer.is_valid():
            equipment.borrow_equipment()
            equipment.set_status()
            return Response(serializer.data, status=HTTP_200_OK)
        return Response('{Error: equipment not found}', status=HTTP_404_NOT_FOUND)


class ReturnEquipments(APIView):
    """
            When the technician authorize a student return an equipment,
            this PUT method automatically updates the stock and update the availability.
        """

    def get_object(self, pk):
        try:
            return Equipments.objects.get(pk=pk)
        except Equipments.DoesNotExist:
            return Response('Equipment not found', status=HTTP_404_NOT_FOUND)

    def put(self, request, pk, format=None):
        equipment = self.get_object(pk)
        serializer = EquipmentsSerializer(equipment, data=request.data)
        if serializer.is_valid():
            equipment.return_equipment()
            equipment.set_status()
            return Response(serializer.data, status=HTTP_200_OK)
        return Response('{Error: equipment not found}', status=HTTP_404_NOT_FOUND)


# List of Requests
class ListAllRequests(generics.ListCreateAPIView):
    """
        GET Method return all requests.
        POST method creates a new request:
            @:param equipment_ref: <int>
            @:param project_ref: <int>
            Those parameters are passed in the body of the request.
    """
    queryset = Request.objects.all()
    serializer_class = RequestSerializer


class RequestsDetails(generics.RetrieveUpdateDestroyAPIView):
    """
        GET method to retrieve details about a single request
            @:param id: <int>
        DELETE method to remove a request
            @:param id: <int>
    """
    queryset = Request.objects.all()
    serializer_class = RequestSerializer


# Deal with requests
class ApproveRequest(APIView):
    """
        Method for the technician
        PUT method to approve a request
            @:param id: <int>
    """
    def get_object(self, pk):
        try:
            return Request.objects.get(pk=pk)
        except Request.DoesNotExist:
            return Response('Request not found', status=HTTP_404_NOT_FOUND)

    def put(self, request, pk):
        req = self.get_object(pk)
        serializer = RequestSerializer(req, data=request.data)
        if serializer.is_valid():
            req.approve()
            return Response(serializer.data, status=HTTP_200_OK)
        return Response('{Error: request not found}', status=HTTP_404_NOT_FOUND)


class DenyRequest(APIView):
    """
            Methods for the techinician
            PUT method to deny a request
                @:param id: <int>
    """
    def get_object(self, pk):
        try:
            return Request.objects.get(pk=pk)
        except Request.DoesNotExist:
            return Response('Request not found', status=HTTP_404_NOT_FOUND)

    def put(self, request, pk):
        req = self.get_object(pk)
        serializer = RequestSerializer(req, data=request.data)
        if serializer.is_valid():
            req.deny()
            return Response(serializer.data, status=HTTP_200_OK)
        return Response('{Error: request not found}', status=HTTP_404_NOT_FOUND)
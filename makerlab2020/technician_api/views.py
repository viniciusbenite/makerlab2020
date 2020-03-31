# -*- coding: utf-8 -*-
from django.contrib.auth import authenticate
from django.http import HttpResponse, Http404
from django.views.decorators.csrf import csrf_exempt

from rest_framework import status, viewsets, generics
from rest_framework.decorators import api_view, permission_classes, action
from rest_framework.generics import RetrieveAPIView
from rest_framework.mixins import *
from rest_framework.permissions import AllowAny, IsAdminUser
from rest_framework.response import Response
from rest_framework.status import HTTP_400_BAD_REQUEST, HTTP_404_NOT_FOUND, HTTP_200_OK
from rest_framework.authtoken.models import Token
from rest_framework.views import APIView
from rest_framework.viewsets import GenericViewSet

from makerlab2020.technician_api.models import Equipments
from makerlab2020.technician_api.serializers import EquipmentsSerializer


@csrf_exempt
@api_view(["POST"])
@permission_classes((AllowAny,))
def login(request):
    """
    Create a token for user
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
    queryset = Equipments.objects.all()
    serializer_class = EquipmentsSerializer

    def perform_create(self, serializer):
        serializer.save(equipment=self.request.equipment)


class EquipmentsDetails(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = EquipmentsSerializer

    def get_queryset(self):
        return Equipments.objects.all().filter(equipment=self.request.equipment)

"""makerlab URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from makerlab2020.technician_api import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('index/', views.MainPage.as_view(), name='Main Page'),
    path('login/', views.login, name='Login'),
    path('equipments/', views.ListAllEquipments.as_view(), name='List all equipments'),
    path('equipments/<int:pk>/', views.EquipmentsDetails.as_view(), name='Equipments details'),
    path('projects/', views.ListAllProjects.as_view(), name='List all projects'),
    path('projects/<int:pk>/', views.ProjectsDetails.as_view(), name='Projects details'),
    path('users/', views.ListAllStudents.as_view(), name='User list'),
    path('borrow/<int:pk>/', views.BorrowEquipments.as_view(), name='Validate equipment borrow'),
    path('return/<int:pk>/', views.ReturnEquipments.as_view(), name='Validate equipment return')
]

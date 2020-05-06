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

from detimakerlab.users_api import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('index/', views.MainPage.as_view(), name='Main Page'),
    # path('projects/', views.ListAllProjects.as_view(), name='List of projects'),
    path('groups/', views.ListAllGroups.as_view(), name='List of groups'),
    path('students/', views.ListAllStudents.as_view(), name='List of students'),
    # path('projects/<int:pk>/', views.ProjectDetails.as_view(), name='Project details'),
    path('groups/<int:pk>/', views.GroupDetails.as_view(), name='Group details'),
]

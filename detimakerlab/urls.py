"""detimakerlab URL Configuration

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
from django.urls import path, include

import views

urlpatterns = [
    path('wiki/', include('detimakerlab.wiki.urls')),
    path('tech/', include('detimakerlab.technician_api.urls')),
    path('users/', include('detimakerlab.users_api.urls')),
    path('admin/', admin.site.urls),


# Web pages
    path('admin', admin.site.urls),
    path('', views.homepage, name="homepage"),
    path('about', views.about, name="about"),
    path('all_equipment', views.all_equipment, name="all_equipments"),
    path('create_project', views.create_project, name="create_project"),
    path('navbar', views.nav_bar, name="nav_bar"),
    path('rent_equipment', views.rent_equipment, name="rent_equipment"),
    path('return_equipment', views.return_equipment, name="return_equipment"),
    path('student', views.student, name="student"),
]

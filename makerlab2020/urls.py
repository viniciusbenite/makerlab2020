"""makerlab2020 URL Configuration

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
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include
from sorl.thumbnail.conf import settings

from makerlab2020 import views

urlpatterns = [
    path('wiki/', include('wiki.urls')),
    path('notifications/', include('django_nyt.urls')),
    path('tech/', include('makerlab2020.technician_api.urls')),
    path('users/', include('makerlab2020.users_api.urls')),

    # Web pages
    path('admin', admin.site.urls),
    path('index.html', views.homepage, name="homepage"),
    path('', views.homepage, name="homepage"),
    path('about.html', views.about, name="about"),
    path('all_equipment.html', views.all_equipment, name="all_equipments"),
    path('create_project.html', views.create_project, name="create_project"),
    path('navbar.html', views.nav_bar, name="nav_bar"),
    path('rent_equipment.html', views.rent_equipment, name="rent_equipment"),
    path('return_equipment.html', views.return_equipment, name="return_equipment"),
    path('student.html', views.student, name="student"),

]

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
from django.urls import path, include

from detimakerlab import design

urlpatterns = [
    path('wiki/', include('detimakerlab.wiki.urls')),
    path('tech/', include('detimakerlab.technician_api.urls')),
    path('users/', include('detimakerlab.users_api.urls')),
    # path('admin/', admin.site.urls),

    # Web pages
    path('', design.homepage, name="homepage"),
    path('about', design.about, name="about"),
    path('all_equipment', design.all_equipment, name="all_equipments"),
    path('create_project', design.create_project, name="create_project"),
    path('navbar', design.nav_bar, name="nav_bar"),
    path('rent_equipment', design.rent_equipment, name="rent_equipment"),
    path('return_equipment', design.return_equipment, name="return_equipment"),
    path('student', design.student, name="student"),
    path('login', design.login),

    # WIKI SHIT
    path('test/', include('detimakerlab.wiki.plugins.article_dependencies.urls'))
]

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

from makerlab2020.technician_api import views

urlpatterns = [
    path('', include('wiki.urls')),
    path('admin/', admin.site.urls),
    path('notifications/', include('django_nyt.urls')),
    path(r'index/', views.MainPage.as_view(), name='Main Page'),
    path(r'login/', views.login, name='Login'),
    path(r'equipments/', views.EquipmentsList.as_view(), name='List all equiments'),
    path(r'equipments/<int:pk>/', views.EquipmentsUpdate.as_view(), name='View equipment details/update/delete'),
    path(r'test/<int:pk>/', views.TechnicianAPI.as_view(), name='test'),
    path(r'test2/<int:pk>/', views.borrow)
]

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

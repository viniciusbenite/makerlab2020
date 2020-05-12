from django.shortcuts import render

from detimakerlab.utils import request_token

KEY = '_9521a91079fe9d915a122cd9a4e1ed89408362d78a'
SECRET = '_d4fbe1ef64c15163ae3d9d21a348fd7c8df5631549'


# Views for the HTML pages
def homepage(request):
    return render(request, 'index.html')


def about(request):
    return render(request, 'about.html')


def all_equipment(request):
    return render(request, 'all_equipment.html')


def create_project(request):
    return render(request, 'create_project.html')


def nav_bar(request):
    return render(request, 'navbar.html')


def rent_equipment(request):
    return render(request, 'rent_equipment.html')


def return_equipment(request):
    return render(request, 'return_equipment.html')


def student(request):
    return render(request, 'student.html')


def login(request):
    url = 'http://identity.ua.pt/oauth/request_token'

    owner_token, owner_secret = request_token(KEY, SECRET, url)

    return render(request, 'temp_login.html', {'owner_key': owner_token, 'owner_secret': owner_secret})

import random
import string
from datetime import datetime

# import oauthlib.oauth1.rfc5849.signature as oauth
from django.shortcuts import render
from requests_oauthlib import OAuth1Session

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

    oauth = OAuth1Session(KEY, client_secret=SECRET)
    fetch_response = oauth.fetch_request_token(url)

    return render(request, 'temp_login.html', {'url': fetch_response})

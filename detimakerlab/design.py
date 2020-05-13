from django.shortcuts import render, redirect
from requests_oauthlib import OAuth1Session

KEY = '_9521a91079fe9d915a122cd9a4e1ed89408362d78a'
SECRET = '_3d7d9273a282e9f392dc1400864c490b07cca8771d'


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
    # Request token
    url = 'http://identity.ua.pt/oauth/request_token'

    oauth = OAuth1Session(KEY, client_secret=SECRET)
    oauth.fetch_request_token(url)

    # Authorize
    url = 'http://identity.ua.pt/oauth/authorize'
    authorization_url = oauth.authorization_url(url)
    return redirect(authorization_url)
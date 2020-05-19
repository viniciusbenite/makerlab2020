from django.shortcuts import render, redirect
from requests_oauthlib import OAuth1Session

# Views for the HTML pages
from detimakerlab.technician_api.models import Equipments

KEY = '_9521a91079fe9d915a122cd9a4e1ed89408362d78a'
SECRET = '_da3c732e4c25393b6c31dd902dd873bca359e6acac'  # Look https://identity.ua.pt/


def homepage(request):
    if 'oauth_verifier' in request.GET and 'oauth_token' in request.GET:
        oauth_verifier = request.GET['oauth_verifier']
        oauth_token = request.GET['oauth_token']
        return render(request, 'temp_login.html', {'url': oauth_token})
    return render(request, 'index.html')


def about(request):
    return render(request, 'about.html')


def all_equipment(request):
    data = Equipments.objects.all()
    return render(request, 'all_equipment.html', {"equipmentData": data})


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


def technician(request):
    return render(request, 'technician.html')


def requests(request):
    return render(request, 'requests.html')


def edit_equipment(request):
    return render(request, 'edit_equipment.html')


def statistics(request):
    return render(request, 'statistics.html')


def my_projects(request):
    return render(request, 'my_projects.html')


def team(request):
    return render(request, 'team.html')


def login(request):
    # Request token
    url = 'http://identity.ua.pt/oauth/request_token'

    oauth = OAuth1Session(KEY, client_secret=SECRET)
    oauth.fetch_request_token(url)

    # Authorize
    url = 'http://identity.ua.pt/oauth/authorize'
    authorization_url = oauth.authorization_url(url)
    return redirect(authorization_url)

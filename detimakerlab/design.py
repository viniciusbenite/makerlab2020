import random
import string
from datetime import datetime
from urllib.parse import quote_plus

import oauthlib.oauth1.rfc5849.signature as oauth
from django.shortcuts import render

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
    headers = {
        "oauth_consumer_key": KEY,
        "oauth_signature_method": "HMAC-SHA1",
        "oauth_timestamp": str(datetime.timestamp(datetime.now())),
        "oauth_nonce": ''.join(random.choices(string.digits, k=10)),
        "oauth_version": '1.0a'
    }
    url = 'http://identity.ua.pt/oauth/request_token'
    url += '?oauth_consumer_key=' + headers['oauth_consumer_key']
    url += '&oauth_signature_method=' + headers['oauth_signature_method']
    url += '&oauth_timestamp=' + headers['oauth_timestamp']
    url += '&oauth_nonce=' + headers['oauth_nonce']
    url += '&oauth_version=' + headers['oauth_version']
    signature = get_signature(headers, url, KEY)
    url += '&oauth_signature=' + signature
    return render(request, 'temp_login.html', {'url': url})


def get_signature(headers, uri, client_secret):  # TODO: function wrong - fix
    params = oauth.collect_parameters(
        uri_query="",
        body=[],
        headers=headers,
        exclude_oauth_signature=True,
        with_realm=False
    )

    norm_params = oauth.normalize_parameters(params)

    base_string = oauth.signature_base_string(
        "GET",
        uri,
        norm_params
    )

    sig = oauth.sign_hmac_sha1(
        base_string,
        client_secret,
        SECRET
    )

    return quote_plus(sig)

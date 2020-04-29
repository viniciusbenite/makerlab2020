# from django.apps import AppConfig
from wiki.apps import WikiConfig


class UserApiConfig(WikiConfig):
    name = 'makerlab2020.users_api'
    verbose_name = 'DETI MakerLab Users'

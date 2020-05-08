# from django.apps import AppConfig
from detimakerlab.wiki.apps import WikiConfig


class UserApiConfig(WikiConfig):
    name = 'detimakerlab.users_api'
    verbose_name = 'DETI MakerLab Users'

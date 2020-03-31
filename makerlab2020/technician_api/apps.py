# from django.apps import AppConfig
from wiki.apps import WikiConfig


class TechApiConfig(WikiConfig):
    name = 'makerlab2020.technician_api'
    verbose_name = 'DETI MakerLab Technician'

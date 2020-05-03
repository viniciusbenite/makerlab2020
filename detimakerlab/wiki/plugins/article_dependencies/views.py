from django.shortcuts import render
from django.utils.decorators import method_decorator
from django.views.generic import FormView
from rest_framework import generics, request

from detimakerlab.technician_api.models import Request
from detimakerlab.technician_api.serializers import RequestSerializer
from detimakerlab.wiki.decorators import get_article
from detimakerlab.wiki.conf import settings
from detimakerlab.wiki import forms
from detimakerlab.wiki.plugins.article_dependencies.forms import CreateDependencieForm
from detimakerlab.wiki.views.mixins import ArticleMixin

import logging
logger = logging.getLogger(__name__)


class DependenciesView(FormView):
    template_name = "wiki/plugins/article_dependencies/dependencies_form.html"
    form_class = CreateDependencieForm

    def form_valid(self, form):
        logger.error("ola")
        form.make_request()
        if form.is_valid():
            print(form.data)
            print(form.request.STATUS)
            print(form.equipment)
            print(form.project)
        return super().form_valid(form)


# class DependencieView(FormView, ArticleMixin):
#     form_class = CreateDependencieForm
#     template_name = "wiki/plugins/article_dependencies/sidebar.html"
#
#     @method_decorator(get_article(can_write=True, can_create=True))
#     def dispatch(self, request, article, *args, **kwargs):
#         return super().dispatch(request, article, *args, **kwargs)
#
#     def get_form(self, form_class=None):
#         """
#         Returns an instance of the form to be used in this view.
#         """
#         if form_class is None:
#             form_class = self.get_form_class()
#         kwargs = self.get_form_kwargs()
#         initial = kwargs.get("initial", {})
#         initial["slug"] = self.request.GET.get("slug", None)
#         kwargs["initial"] = initial
#         form = form_class(self.request, self.urlpath, **kwargs)
#         form.fields["slug"].widget = forms.TextInputPrepend(
#             prepend="/" + self.urlpath.path,
#             attrs={
#                 # Make patterns force lowercase if we are case insensitive to bless the user with a
#                 # bit of strictness, anyways
#                 "pattern": "[a-z0-9_-]+"
#                 if not settings.URL_CASE_SENSITIVE
#                 else "[a-zA-Z0-9_-]+",
#                 "title": "Lowercase letters, numbers, hyphens and underscores"
#                 if not settings.URL_CASE_SENSITIVE
#                 else "Letters, numbers, hyphens and underscores",
#             },
#         )
#         return form
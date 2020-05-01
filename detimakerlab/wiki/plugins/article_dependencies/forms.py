from django import forms
from django.utils.translation import pgettext_lazy

from detimakerlab.technician_api.models import Equipments, Project
from detimakerlab.wiki.forms import SpamProtectionMixin, _clean_slug


class CreateDependencieForm(forms.Form, SpamProtectionMixin):
    def __init__(self, request, urlpath_parent, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.request = request
        self.urlpath_parent = urlpath_parent

    project = forms.ModelChoiceField(
        label=pgettext_lazy("project", "Project"),
        help_text='Choose your project. This will be associated with this article',
        required=True,
        queryset=Project.objects.all(),
    )
    equipment = forms.ModelChoiceField(
        label=pgettext_lazy("equipment", "Equipment"),
        help_text='Choose your equipments. This will be associated with this article',
        required=True,
        queryset=Equipments.objects.all(),
    )

    def clean_slug(self):
        return _clean_slug(self.cleaned_data["slug"], self.urlpath_parent)

    def clean(self):
        self.check_spam()
        return self.cleaned_data


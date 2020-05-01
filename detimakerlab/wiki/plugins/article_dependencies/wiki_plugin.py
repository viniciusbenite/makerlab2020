from django.utils.translation import gettext as _

from detimakerlab.wiki.core.plugins import registry
from detimakerlab.wiki.core.plugins.base import BasePlugin


class ArticleDependenciesPlugin(BasePlugin):
    slug = "dependencies"

    sidebar = {
        "headline": _("Dependencies"),
        "icon_class": "fa-tools",
        "template": "wiki/plugins/article_dependencies/sidebar.html",
        "form_class": None,
        "get_form_kwargs": (lambda a: {}),
    }

    markdown_extensions = []


registry.register(ArticleDependenciesPlugin)

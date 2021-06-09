from django.urls import path
from django.urls.conf import re_path

from . import views


urlpatterns = [
    path('favicon.ico', views.favicon),
    re_path(r'^.*$', views.file),
] 

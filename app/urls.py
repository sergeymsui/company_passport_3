from django.urls import path

from . import views

urlpatterns = [
    path('', views.IndexView.as_view()),
    path('search', views.loadPassport, name='loadPassport'),
    path('forms/<str:uuid>', views.WorksheetView.as_view(), name='forms'),
    path('forms', views.FormsView.as_view()),
    path('passports', views.PassportsView.as_view()),
    path('passports/<str:uuid>/<str:uuidp>', views.PassportIDConcreteView.as_view()),
    path('passports/<str:uuid>', views.PassportIDView.as_view()),
    path('load', views.PasslortLoadView.as_view()),
]




from django.urls import path
from .views import aPage

urlpatterns = [
    path('a',aPage),
]

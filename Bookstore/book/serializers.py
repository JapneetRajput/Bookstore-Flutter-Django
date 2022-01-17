from rest_framework import serializers
from .models import Book
class BookSerializer(serializers.ModelSerializer):
    author=serializers.StringRelatedField()
    publisher=serializers.StringRelatedField()
    subject=serializers.StringRelatedField()
    class Meta:
        model=Book
        fields=('id','name','price','discount','author','publisher','image','preview','last_sold','subject')
    
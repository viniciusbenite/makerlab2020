# class that's used to transform models data to a serialized format such as JSON or XML

from rest_framework import serializers

from makerlab2020.technician_api.models import Equipments


class EquipmentsSerializer(serializers.ModelSerializer):
    family = serializers.CharField(required=False)
    ref = serializers.IntegerField(required=False)
    description = serializers.CharField(required=False)
    location = serializers.CharField(required=False)
    total_items = serializers.IntegerField(required=False)
    borrowed_items = serializers.IntegerField(required=False)
    price = serializers.FloatField(required=False)
    BROKEN = (
        ('yes', 'broken'),
        ('no', 'ok'),
    )
    broken = serializers.CharField(required=False)
    STATUS = (
        ('dis', 'Disponible'),
        ('ind', 'Indisponible'),
        ('rep', 'Reparing'),
    )
    status = serializers.CharField(required=False)

    def create(self, validated_data):
        return Equipments.objects.create(**validated_data)

    def update(self, instance, validated_data):
        instance.borrowed_items = validated_data.get('borrowed_items', instance.borrowed_items)
        # instance.email = validated_data.get('email', instance.email)
        # instance.content = validated_data.get('content', instance.content)
        # instance.created = validated_data.get('created', instance.created)
        instance.save()
        return instance

    class Meta:
        model = Equipments
        fields = ('__all__')

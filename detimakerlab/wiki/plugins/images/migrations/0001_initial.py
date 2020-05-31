# Generated by Django 3.0.6 on 2020-05-31 13:02

import detimakerlab.wiki.plugins.images.models
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('wiki', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Image',
            fields=[
                ('revisionplugin_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='wiki.RevisionPlugin')),
            ],
            options={
                'verbose_name': 'image',
                'verbose_name_plural': 'images',
                'db_table': 'wiki_images_image',
            },
            bases=('wiki.revisionplugin',),
        ),
        migrations.CreateModel(
            name='ImageRevision',
            fields=[
                ('revisionpluginrevision_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='wiki.RevisionPluginRevision')),
                ('image', models.ImageField(blank=True, height_field='height', max_length=2000, null=True, upload_to=detimakerlab.wiki.plugins.images.models.upload_path, width_field='width')),
                ('width', models.SmallIntegerField(blank=True, null=True)),
                ('height', models.SmallIntegerField(blank=True, null=True)),
            ],
            options={
                'verbose_name': 'image revision',
                'verbose_name_plural': 'image revisions',
                'db_table': 'wiki_images_imagerevision',
                'ordering': ('-created',),
            },
            bases=('wiki.revisionpluginrevision',),
        ),
    ]

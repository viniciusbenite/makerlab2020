# Generated by Django 3.0.6 on 2020-05-31 18:48

import detimakerlab.wiki.plugins.attachments.models
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('wiki', '__first__'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Attachment',
            fields=[
                ('reusableplugin_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='wiki.ReusablePlugin')),
                ('original_filename', models.CharField(blank=True, max_length=256, null=True, verbose_name='original filename')),
            ],
            options={
                'verbose_name': 'attachment',
                'verbose_name_plural': 'attachments',
                'db_table': 'wiki_attachments_attachment',
            },
            bases=('wiki.reusableplugin',),
        ),
        migrations.CreateModel(
            name='AttachmentRevision',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('revision_number', models.IntegerField(editable=False, verbose_name='revision number')),
                ('user_message', models.TextField(blank=True)),
                ('automatic_log', models.TextField(blank=True, editable=False)),
                ('ip_address', models.GenericIPAddressField(blank=True, editable=False, null=True, verbose_name='IP address')),
                ('modified', models.DateTimeField(auto_now=True)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('deleted', models.BooleanField(default=False, verbose_name='deleted')),
                ('locked', models.BooleanField(default=False, verbose_name='locked')),
                ('file', models.FileField(max_length=255, upload_to=detimakerlab.wiki.plugins.attachments.models.upload_path, verbose_name='file')),
                ('description', models.TextField(blank=True)),
                ('attachment', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='wiki_attachments.Attachment')),
                ('previous_revision', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='wiki_attachments.AttachmentRevision')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL, verbose_name='user')),
            ],
            options={
                'verbose_name': 'attachment revision',
                'verbose_name_plural': 'attachment revisions',
                'db_table': 'wiki_attachments_attachmentrevision',
                'ordering': ('created',),
                'get_latest_by': 'revision_number',
            },
        ),
        migrations.AddField(
            model_name='attachment',
            name='current_revision',
            field=models.OneToOneField(blank=True, help_text='The revision of this attachment currently in use (on all articles using the attachment)', null=True, on_delete=django.db.models.deletion.CASCADE, related_name='current_set', to='wiki_attachments.AttachmentRevision', verbose_name='current revision'),
        ),
    ]

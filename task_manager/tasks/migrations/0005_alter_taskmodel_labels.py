# Generated by Django 4.2.5 on 2023-09-26 09:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('labels', '0001_initial'),
        ('tasks', '0004_rename_descriptions_taskmodel_description'),
    ]

    operations = [
        migrations.AlterField(
            model_name='taskmodel',
            name='labels',
            field=models.ManyToManyField(blank=True, null=True, related_name='labels', to='labels.labelmodel'),
        ),
    ]

# Generated by Django 4.0.3 on 2022-07-14 06:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_books', '0002_author_category_edition'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='edition',
            options={'verbose_name': 'Editeur'},
        ),
        migrations.AddField(
            model_name='edition',
            name='name',
            field=models.CharField(default='autres', max_length=255, unique=True, verbose_name='Editeur'),
        ),
        migrations.AddField(
            model_name='edition',
            name='slug',
            field=models.SlugField(blank=True, max_length=255, unique=True),
        ),
    ]

# Generated by Django 4.0.3 on 2022-07-14 16:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_books', '0005_alter_category_options_category_name_category_slug'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='author',
            options={'verbose_name': 'Auteur(e)'},
        ),
        migrations.AlterModelOptions(
            name='category',
            options={'verbose_name': 'Catégorie'},
        ),
        migrations.AddField(
            model_name='author',
            name='contact',
            field=models.URLField(default='', unique=True, verbose_name='Contact'),
        ),
        migrations.AddField(
            model_name='author',
            name='lastname',
            field=models.CharField(default='', max_length=100, verbose_name='Prénom'),
        ),
        migrations.AddField(
            model_name='author',
            name='name',
            field=models.CharField(default='', max_length=100, verbose_name='Nom'),
        ),
        migrations.AddField(
            model_name='author',
            name='slug',
            field=models.SlugField(default='', max_length=255),
        ),
        migrations.AlterField(
            model_name='category',
            name='name',
            field=models.CharField(default='', max_length=255, unique=True, verbose_name='Catégorie'),
        ),
    ]
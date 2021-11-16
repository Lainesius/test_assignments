from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name='NotableFigure',
            fields=[
                (
                    'id',
                    models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID'),
                ),
                ('name', models.TextField()),
                ('description', models.TextField(blank=True, null=True)),
                ('image', models.URLField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Event',
            fields=[
                (
                    'id',
                    models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID'),
                ),
                ('title', models.TextField()),
                ('description', models.TextField(blank=True, null=True)),
                (
                    'level',
                    models.TextField(
                        choices=[
                            ('town', 'Saved the town'),
                            ('world', 'Saved the world'),
                            ('universe', 'Saved the universe'),
                            ('crisis', 'Became the crisis'),
                        ]
                    ),
                ),
                ('timestamp', models.DateField()),
                (
                    'special_mentions',
                    models.ManyToManyField(
                        blank=True,
                        db_table='event_special_mentions',
                        related_name='events',
                        related_query_name='event',
                        to='web.NotableFigure',
                    ),
                ),
                ('image', models.URLField(blank=True, null=True)),
                ('special_mentions_message', models.TextField(blank=True, null=True)),
            ],
        ),
    ]

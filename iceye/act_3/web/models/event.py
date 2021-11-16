from django.db import models


class Event(models.Model):
    LEVEL_TOWN = 'town'
    LEVEL_WORLD = 'world'
    LEVEL_UNIVERSE = 'universe'
    LEVEL_CRISIS = 'crisis'
    LEVEL_CHOICES = (
        (LEVEL_TOWN, 'Saved the town'),
        (LEVEL_WORLD, 'Saved the world'),
        (LEVEL_UNIVERSE, 'Saved the universe'),
        (LEVEL_CRISIS, 'Became the crisis'),
    )

    title = models.TextField()
    description = models.TextField(null=True, blank=True)
    level = models.TextField(choices=LEVEL_CHOICES)
    image = models.URLField(null=True, blank=True)
    special_mentions = models.ManyToManyField(
        to='web.NotableFigure',
        db_table='event_special_mentions',
        blank=True,
        related_name='events',
        related_query_name='event',
    )
    special_mentions_message = models.TextField(null=True, blank=True)
    timestamp = models.DateField()

    def __str__(self):
        return self.title

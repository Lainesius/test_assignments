from django.db import models


class NotableFigure(models.Model):
    name = models.TextField()
    description = models.TextField(null=True, blank=True)
    image = models.URLField(null=True, blank=True)

    def __str__(self):
        return self.name

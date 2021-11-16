from django.shortcuts import render

from web.models import Event


def index(request):
    events = Event.objects.order_by('-timestamp').prefetch_related('special_mentions').all()
    context = {'events': events}
    return render(request, 'index.html', context)

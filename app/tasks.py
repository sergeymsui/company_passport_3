
from celery import shared_task
from celery_progress.backend import ProgressRecorder

from time import sleep 

@shared_task(bind=True)
def go_to_sleep(self, duration):
    progress_recorder = ProgressRecorder(self)
    sleep(duration)
    return 'Done'


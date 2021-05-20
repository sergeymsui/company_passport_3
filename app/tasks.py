
from celery import shared_task
from celery_progress.backend import ProgressRecorder

from time import sleep 

@shared_task(bind=True)
def go_to_sleep(self, duration):
    if duration == 0:
        return 'None'
    progress_recorder = ProgressRecorder(self)
    for i in range(5):
        sleep(duration)
        progress_recorder.set_progress(i+1, 5, f'On iteratin {i}')
    return 'Done'


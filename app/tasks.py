
from celery import shared_task
from celery_progress.backend import ProgressRecorder

from time import sleep 

# Тестовая задача
@shared_task(bind=True)
def go_to_sleep(self, duration):
    progress_recorder = ProgressRecorder(self)
    for i in range(5):
        sleep(duration)
        progress_recorder.set_progress(i+1, 5, f'On iteratin {i}')
    return 'Done'

from .domain import Parser

# Конвертация паспорта
@shared_task(bind=True)
def go_to_parse(self, duration, t_path):
    # ProgressRecorder для отслеживания статуса процесса
    progress_recorder = ProgressRecorder(self)

    # Парсер паспорта
    p = Parser()
    # Запуск конвертации
    p.parse(t_path)
    for i in range(5):
        sleep(duration)
        progress_recorder.set_progress(i+1, 5, f'On iteratin {i}')
    return 'Done'

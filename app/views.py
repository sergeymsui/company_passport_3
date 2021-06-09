from django.core.files.storage import FileSystemStorage
from django.http.response import HttpResponse
from django.shortcuts import render
from django.views.generic.base import View

from .domain import Chapters, Worksheets, Passports, PassportIDConcrete, PassportReview
from company_passport.settings import DEFAULT_FILE_DIRECTORY

from .tasks import go_to_parse

import json
import uuid

# Основная страница
class IndexView(View):
    def get(self, request):
        review = PassportReview()
        return render(request, "index.html", {"passport_list": review.get()})

# Страница форм
class FormsView(View):
    def get(self, request):
        cptrs = Chapters()
        return render(request, "forms.html", {"chapters": cptrs.get()})

# Страница паспортов
class PassportsView(View):
    def get(self, request):
        passports = Passports()
        passports_data = passports.get()
        return render(request, "passports.html", {"passports_data": passports_data})

# Область таблиц
class WorksheetView(View):
    def get(self, request, uuid):
        cptrs = Chapters()
        wrks = Worksheets()
        wrks_title, wrks_cols, wrks_rows = wrks.get(uuid)
        return render(request, "worksheet.html", {"chapters": cptrs.get(),
                                                  "wrks_title": wrks_title,
                                                  "wrks_cols": wrks_cols,
                                                  "wrks_rows": wrks_rows,
                                                  })

# Страница паспортов по ID
class PassportIDView(View):
    def get(self, request, uuid):
        cptrs = Chapters()
        return render(request, "passport_id.html", {"chapters": cptrs.get(),
                                                    "passport_uuid": uuid,
                                                    })

# Область таблиц по ID паспорта
class PassportIDConcreteView(View):
    def get(self, request, uuid, uuidp):
        cptrs = Chapters()

        pidc = PassportIDConcrete()

        # wrks = Worksheets()
        wrks_title, wrks_cols, wrks_rows = pidc.get(uuid, uuidp)
        return render(request, "passport_id_concrete.html", {"chapters": cptrs.get(),
                                                  "wrks_title": wrks_title,
                                                  "wrks_cols": wrks_cols,
                                                  "wrks_rows": wrks_rows,
                                                  "passport_uuid": uuid,
                                                  })

# Страница загрузки паспорта
class PasslortLoadView(View):
    def get(self, request):
        return render(request, "pload.html")

# Загрузка паспорта в файловую систему
def loadPassport(request):
    # директория загрузки
    loadDirectory = DEFAULT_FILE_DIRECTORY + str(uuid.uuid4().hex)
    if request.method == 'POST':
        for filename, file in request.FILES.items():
            # print(filename, file, type(file))
            fs = FileSystemStorage(location=loadDirectory)
            # Сохранение в локальной директории
            filename = fs.save(file.name, file)
    else:
        print("This is NOT POST request")
    
    # Полный путь к паспорту
    full_path = loadDirectory + '/' + file.name
    # Запуск процесса конвертации
    task = go_to_parse.delay(1, full_path)
    # Возврат ID процесса конвертации
    dumps = json.dumps({"json": task.task_id})
    # Возврат запроса с ответом
    return HttpResponse(dumps)

# counter - процент заполнения ProgressBar
counter = 10

# Функция обновления счетчика
def update():
    global counter
    if counter < 100:
        counter += 10
    else:
        counter = 0
    pass

# Статус процесса
def get_progress(request):
    response_data = {
        'state': counter,
        'details': 'Hole',
    }
    # Обновление счетчика
    update()
    # print('counter = ', counter)
    return HttpResponse(json.dumps(response_data), content_type='application/json')






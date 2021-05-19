
from company_passport.settings import DEFAULT_FILE_DIRECTORY
import os
from django.conf import settings

from django.core.files.storage import default_storage

from django.http.response import Http404, HttpResponseRedirect, HttpResponse
from django.shortcuts import render
from django.views.generic import ListView
from django.views.generic.base import View

# Create your views here.
from django.db.models import Q
from django.http import JsonResponse

from .domain import Chapters, Worksheets, Parser, Passports, PassportIDConcrete


class IndexView(View):
    def get(self, request):
        return render(request, "index.html", {})


class FormsView(View):
    def get(self, request):
        cptrs = Chapters()
        return render(request, "forms.html", {"chapters": cptrs.get()})

class PassportsView(View):
    def get(self, request):
        # p = Parser()
        # p.parse()

        passports = Passports()
        passports_data = passports.get()
        return render(request, "passports.html", {"passports_data": passports_data})

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

class PassportIDView(View):
    def get(self, request, uuid):
        cptrs = Chapters()
        return render(request, "passport_id.html", {"chapters": cptrs.get(),
                                                    "passport_uuid": uuid,
                                                    })

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


class PasslortLoadView(View):
    def get(self, request):
        if 'list' in request.POST:
            print('LOL')
        else:
            print(request.FILES)
        return render(request, "pload.html");


from django.core.files.storage import FileSystemStorage
# from .settings import DEFAULT_FILE_DIRECTORY

import json

counter = 10

def loadPassport(request):
    if request.method == 'POST':
        for filename, file in request.FILES.items():
            print(filename, file, type(file))
            # file_name = default_storage.save(filename, file)
            fs = FileSystemStorage(location=DEFAULT_FILE_DIRECTORY) #defaults to   MEDIA_ROOT  
            filename = fs.save(file.name, file)
            file_url = fs.url(file.name)

    else:
        print("This is NOT request")
    
    dumps = json.dumps({"json":"obj"})
    return HttpResponse(dumps);

def update():
    global counter
    if counter < 100:
        counter += 10
    else:
        counter = 0
    pass

def get_progress(request):
    response_data = {
        'state': counter,
        'details': 'Hole',
    }
    update()
    print('counter = ', counter)
    return HttpResponse(json.dumps(response_data), content_type='application/json')

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
        p = Parser()
        p.parse()

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


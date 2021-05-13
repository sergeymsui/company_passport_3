from django.contrib import admin

# Register your models here.

from .models import spr_forms, spr_chapters, indicator_data, header_data, rows, columns

admin.site.register(spr_forms)
admin.site.register(spr_chapters)

admin.site.register(indicator_data)
admin.site.register(header_data)
admin.site.register(rows)
admin.site.register(columns)
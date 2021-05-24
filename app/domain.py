from .models import *

from django.db.models import Q


class Chapters:
    def __init__(self):
        _forms = list()
        for form in spr_forms.objects.all():
            _forms.append(
                {
                    'id': form.id,
                    'name': str(form.name)
                }
            )
        self.forms = _forms
        _chapters = list()
        for chapter in spr_chapters.objects.all():
            _chapters.append(
                {
                    'id': chapter.id,
                    'id_forms_id': chapter.id_forms_id,
                    'number_f': str(chapter.number_f),
                    'name': str(chapter.name)
                }
            )
            pass
        self.chapters = _chapters
        pass

    def get(self):
        data = list()
        for form in self.forms:
            id = form['id']
            name = form['name']
            child = list()

            for chapter in self.chapters:
                id_c = chapter['id']
                id_forms_id_c = chapter['id_forms_id']
                number_f_c = chapter['number_f']
                name_c = chapter['name']
                if id == id_forms_id_c:
                    child.append(
                        {
                            'id': str(id_c),
                            'id_forms_id': str(id_forms_id_c),
                            'number_f': str(number_f_c),
                            'name': str(name_c)
                        }
                    )
                    pass
            pass

            data.append(
                {
                    'id': str(id),
                    'name': str(name),
                    'child': child
                }
            )
        return data


class Item:
    def __init__(self):
        self.id = uuid.UUID()
        self.id_header = uuid.UUID()
        self.pos = int()
        self.id_code = uuid.UUID()
        self.id_parent = uuid.UUID()
        pass


def find(itemList, id):
    for el in itemList:
        if el.id == id:
            return el


class Row(Item):
    def __init__(self):
        self.is_head = False
        self.colspan = 0
        self.dimension = str()
        pass


class Column(Item):
    def __init__(self):
        self.colspan = 0
        self.rowspan = 1

        self.deep = 0
        self.child = list()
        self.parent = None
        pass

    def colspanAdd(self):
        self.colspan = self.colspan + 1
        if self.parent is not None:
            self.parent.colspanAdd()

    def rowspanAdd(self):
        self.rowspan = self.rowspan + 1

    def rowspanSub(self):
        self.rowspan = self.rowspan - 1

    def setParent(self, item):
        self.parent = item
        pass

    def addChild(self, item):
        item.setParent(self)
        self.child.append(item)
        pass

    def getDeepest(self, i=0):
        if len(self.child) == 0:
            return i

        ttl = list()
        for el in self.child:
            ttl.append(el.getDeepest(i + 1))

        if len(ttl) > 0:
            return max(ttl)
        pass


class Worksheets:
    def __init__(self):
        pass

    def get(self, m_uuid):
        title = str(spr_chapters.objects.filter(id=m_uuid)[0].name)

        app_columns = columns.objects.filter(id_chapter_id=m_uuid)
        app_rows = rows.objects.filter(id_chapter_id=m_uuid)

        worksheet_column_data = list()
        worksheet_row_data = list()

        worksheet_cols_list = list()
        worksheet_rows_list = list()

        for el in app_columns:
            col = Column()
            col.id = el.id
            col.id_header = el.id_header
            col.pos = el.pos
            col.id_code = el.id_code
            col.id_parent = el.id_parent
            worksheet_cols_list.append(col)

        deepRows = 0

        for el in worksheet_cols_list:
            if el.pos > deepRows:
                deepRows = el.pos

        for el in worksheet_cols_list:
            el.rowspan = deepRows

        for el in worksheet_cols_list:
            parent_index = el.id_parent
            if parent_index is not None:
                parent = find(worksheet_cols_list, parent_index)
                parent.addChild(el)

        for el in worksheet_cols_list:
            if el.parent is None and len(el.child) == 0:
                el.rowspan = deepRows + 1
            elif el.parent is None:
                el.rowspan = max(1, deepRows - el.getDeepest())
            elif el.parent is not None and len(el.child) == 0:
                el.rowspan = max(1, deepRows - el.parent.deep)
                if el.pos == deepRows:
                    el.rowspan = 1
            elif el.parent is not None and len(el.child) > 0:
                el.rowspan = el.parent.getDeepest() - el.getDeepest()
            else:
                el.rowspan = 0

        for el in worksheet_cols_list:
            if len(el.child) == 0:
                el.colspanAdd()

        deepRows = deepRows + 1

        for i in range(deepRows):
            stack = list()
            for el in worksheet_cols_list:
                if el.pos == i:
                    stack.append(el)
            worksheet_column_data.append(stack)

        original_columns = 0

        for el in worksheet_cols_list:
            if len(el.child) == 0:
                original_columns = original_columns + 1

        # print("original_columns = ", original_columns)

        # flag = False

        for el in app_rows:
            row = Row()
            row.id = el.id
            row.id_header = el.id_indicator
            row.pos = el.pos
            row.id_parent = el.id_parent
            row.id_code = el.id_code
            row.dimension = el.dimension

            if row.id_code == -1:
                row.is_head = True

            worksheet_rows_list.append(row)

        for el in worksheet_rows_list:
            data = list()
            if el.is_head:
                data.append({
                    'value': el.id_header,
                    'colspan': original_columns
                })

            else:
                data.append({
                    'value': el.id_code,
                    'colspan': 1
                })
                data.append({
                    'value': el.id_header,
                    'colspan': 1
                })

                if el.dimension:
                    data.append({
                        'value': el.dimension,
                        'colspan': 1
                    })

                dt = original_columns - len(data)
                for i in range(dt):
                    data.append({
                        'value': '+',
                        'colspan': 1
                    })

            worksheet_row_data.append(data)

        if len(worksheet_rows_list) == 0:
            worksheet_row_data.clear()
            for t in range(5):
                data = list()
                dt = original_columns
                for i in range(dt):
                    data.append({
                        'value': '+',
                        'colspan': 1
                    })
                worksheet_row_data.append(data)

        return [title, worksheet_column_data, worksheet_row_data]


class PassportIDConcrete:
    def __init__(self):
        pass

    def get(self, p_uuid, m_uuid):

        title = str(spr_chapters.objects.get(id=m_uuid).name)

        app_columns = columns.objects.filter(id_chapter_id=m_uuid)
        app_rows = rows.objects.filter(id_chapter_id=m_uuid)

        worksheet_column_data = list()
        worksheet_row_data = list()

        worksheet_cols_list = list()
        worksheet_rows_list = list()

        for el in app_columns:
            col = Column()
            col.id = el.id
            col.id_header = el.id_header
            col.pos = el.pos
            col.id_code = el.id_code
            col.id_parent = el.id_parent
            worksheet_cols_list.append(col)

        deepRows = 0

        for el in worksheet_cols_list:
            if el.pos > deepRows:
                deepRows = el.pos

        for el in worksheet_cols_list:
            el.rowspan = deepRows

        for el in worksheet_cols_list:
            parent_index = el.id_parent
            if parent_index is not None:
                parent = find(worksheet_cols_list, parent_index)
                parent.addChild(el)

        for el in worksheet_cols_list:
            if el.parent is None and len(el.child) == 0:
                el.rowspan = deepRows + 1
            elif el.parent is None:
                el.rowspan = max(1, deepRows - el.getDeepest())
            elif el.parent is not None and len(el.child) == 0:
                el.rowspan = max(1, deepRows - el.parent.deep)
                if el.pos == deepRows:
                    el.rowspan = 1
            elif el.parent is not None and len(el.child) > 0:
                el.rowspan = el.parent.getDeepest() - el.getDeepest()
            else:
                el.rowspan = 0

        for el in worksheet_cols_list:
            if len(el.child) == 0:
                el.colspanAdd()

        deepRows = deepRows + 1

        for i in range(deepRows):
            stack = list()
            for el in worksheet_cols_list:
                if el.pos == i:
                    stack.append(el)
            worksheet_column_data.append(stack)

        original_columns = 0

        for el in worksheet_cols_list:
            if len(el.child) == 0:
                original_columns = original_columns + 1

        # print("original_columns = ", original_columns)

        # flag = False

        for el in app_rows:
            row = Row()
            row.id = el.id
            row.id_header = el.id_indicator
            row.pos = el.pos
            row.id_parent = el.id_parent
            row.id_code = el.id_code
            row.dimension = el.dimension

            if row.id_code == -1:
                row.is_head = True

            worksheet_rows_list.append(row)

        l_dataset = dataset.objects.filter(Q(passport=p_uuid) & Q(id_chapter=m_uuid))
        l_record = records.objects.filter(id_chapter=m_uuid)

        # print(len(l_dataset) , len(worksheet_rows_list))
        for n in range(len(worksheet_rows_list)):
            el = worksheet_rows_list[n]
            data = list()
            if el.is_head:
                data.append({
                    'value': el.id_header,
                    'colspan': original_columns
                })

            else:
                data.append({
                    'value': el.id_code,
                    'colspan': 1
                })
                data.append({
                    'value': el.id_header,
                    'colspan': 1
                })

                if el.dimension:
                    data.append({
                        'value': el.dimension,
                        'colspan': 1
                    })

                dt = original_columns - len(data)

                for i in range(dt):
                    r = l_record.get(Q(icol=i) & Q(id_row=el.id))
                    s = l_dataset.get(record=r)
                    data.append({
                        'value': s.data,
                        'colspan': 1
                    })

            worksheet_row_data.append(data)

        if len(worksheet_rows_list) == 0:
            worksheet_row_data.clear()

            row_uuid = set()

            for dt in l_dataset:
                row_uuid.add(dt.row_uuid)

            wrks_nsort_data = list()
            for u in row_uuid:
                # данные строки
                row_date = l_dataset.filter(row_uuid=u)
                data = list()
                for n in range(len(row_date)):
                    for d in row_date:
                        if d.record.id_column.id_code == n:
                            print(d.data)
                            data.append({
                                        'value': d.data,
                                        'colspan': 1,
                                        'nrow': d.nrow,
                                    })
                wrks_nsort_data.append(data)

            # worksheet_row_data = sorted(wrks_nsort_data, key=wrks_nsort_data['nrow'])

            # worksheet_row_data = {k: wrks_nsort_data[k] for k in sorted(wrks_nsort_data)}
            # for i in range(len(wrks_nsort_data)):
            #     for el in wrks_nsort_data:
            #         if el == i:
            #             worksheet_row_data.append(el.sort('nrow'))

            for i in range(len(wrks_nsort_data)):
                for el in wrks_nsort_data:
                    if el[0]['nrow'] == i:
                        worksheet_row_data.append(el)
                        break

        for el in worksheet_row_data:
            dt = original_columns - len(el)

            if el[0] ['colspan'] > 1:
                continue

            for n in range(dt):
                el.append({
                    'value': "",
                    'colspan': 1
                })



            # for t in range(5):
            #     data = list()
            #     dt = original_columns
            #     for i in range(dt):
            #         data.append({
            #             'value': "LOL",
            #             'colspan': 1
            #         })
            #     worksheet_row_data.append(data)

        return [title, worksheet_column_data, worksheet_row_data]


# Модуль для работы с ZIP файлами
import zipfile
from os import listdir
from os.path import isfile, join

import xlrd
import os

# from openpyxl import load_workbook

# import pandas as pd

import threading

from .enumerator import enumerator

# def convertToXLS(m_path):
#     if os.path.exists(m_path):
#         directory = os.path.dirname(m_path)
#         print('directory = ', directory)
#         cmd = 'libreoffice7.1  --headless --convert-to xls --outdir ' + directory + '  ' + m_path
#         os.system(cmd)


from django.core.exceptions import ObjectDoesNotExist


class Parser:
    def __init__(self):
        pass

    # Дописать цикл конвертера
    def convert(self, chapter_id, passport_m, tmp_file):

        if tmp_file == '':
            return

        # Достаем список всех записей
        record_list = records.objects.filter(id_chapter=chapter_id)

        chapter_numbers = spr_chapters.objects.get(id=chapter_id)
        c_number = chapter_numbers.number_f
        c_number = str(c_number).replace('/', '-')
        print('c_number = ', c_number)

        xls_file = str(tmp_file).replace('.xlsx', '.xls')
        # print('xls_file = ', xls_file)

        if os.path.exists(xls_file):
            pass
        else:
            if os.path.exists(tmp_file):
                directory = os.path.dirname(tmp_file)
                cmd = 'libreoffice7.1  --headless --convert-to xls --outdir ' + directory + '  ' + str(
                    tmp_file).replace(' ', '\ ')
                print('cmd = ', cmd)
                _ex = os.system(cmd)

        # thread = threading.Thread(target=convertToXLS, args=(tmp_file,))
        # # запускаем экземпляр конвертации формата
        # thread.start()

        print('tmp_file = ', tmp_file)
        workbook = xlrd.open_workbook(xls_file)

        sheet_index = workbook.sheet_names().index(c_number)
        print('sheet_index = ', sheet_index)

        worksheet = workbook.sheet_by_index(sheet_index)

        for el in record_list:
            col = el.id_column

            if el.id_row is None:
                break
            else:
                num_row = int(el.id_row.direction) - 1
                num_col = enumerator[col.direction]
                val = worksheet.cell(num_row, num_col).value
                print('val = ', val)
                dataset.objects.create(
                    record=el,
                    data=str(val),
                    passport=passport_m,
                    id_chapter=chapter_numbers
                )
            pass

        if len(record_list) == 0:
            return

        start_row = record_list[0].id_column.startech

        if start_row == -1 or start_row is None:
            return

        num_data_row = worksheet.nrows - start_row

        for i in range(num_data_row):

            empty = True
            for el in record_list:
                col = el.id_column
                row = start_row - 1 + i

                num_row = row
                num_col = enumerator[col.direction]
                if str(worksheet.cell(num_row, num_col).value) is not '':
                    empty = False
                    break

            if empty:
                break

            l_uuid = uuid.uuid4()
            for el in record_list:
                col = el.id_column
                row = start_row - 1 + i

                num_row = row
                num_col = enumerator[col.direction]
                val = worksheet.cell(num_row, num_col).value
                dataset.objects.create(
                    record=el,
                    data=str(val),
                    passport=passport_m,
                    id_chapter=chapter_numbers,
                    row_uuid=l_uuid,
                    nrow=i,
                )
        pass

    def parse(self, t_path):
        # Архив с данными
        path_to_zip_file = t_path
        # Каталог для извлечения архива
        directory_to_extract_to = '/tmp/e6fc5188457044ff8a5b55f999a42701/' + uuid.uuid4().hex
        # Извлекаем пофайлово
        with zipfile.ZipFile(path_to_zip_file, 'r') as zip_ref:
            zip_ref.extractall(directory_to_extract_to)

        # Получаем список локальных фалов
        local_files = [f for f in listdir(directory_to_extract_to) if isfile(join(directory_to_extract_to, f))]

        # Список всех форм
        chapters = spr_chapters.objects.all()

        # Генерим UUID пассспорта
        passport_id = uuid.uuid4()

        passport_actual_d = datetime.datetime.now()

        # Заносим его в БД
        passports.objects.create(id=passport_id, actual_d=passport_actual_d)

        for chapter in chapters:
            # Выбираем форму
            target_chapter = chapter

            tmp_file = str()

            try:
                file = files.objects.get(id_chapter=target_chapter.id)
                # Выбираем файл
                tmp_file = directory_to_extract_to + "/" + str(file)
                # print('is exists tmp_file = ', tmp_file, os.path.exists(tmp_file))
            except ObjectDoesNotExist:
                print("Either the blog or entry doesn't exist.")

            # Достаем уже объект из БД
            passport_m = passports.objects.get(id=passport_id)

            # Конвертируем // ЦЕЛЕВАЯ ЧЕТВЕРТЬ // ПАССПОРТ // файл для конвертации
            thread = threading.Thread(target=self.convert, args=(target_chapter.id, passport_m, tmp_file,))
            thread.start()
            thread.join()
            pass
        pass


class Passports:
    def get(self):
        passports_list = passports.objects.all()
        passports_data = list()
        for el in passports_list:
            passports_data.append({
                'id': el.id,
                'data': el.actual_d,
            })
        return passports_data

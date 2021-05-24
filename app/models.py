from django.db import models

import uuid
import datetime


def generate_uuid():
    return uuid.uuid4()


class spr_forms(models.Model):
    """
    Справочник форм
    """

    id = models.UUIDField('id', default=generate_uuid, primary_key=True)
    # id_section = models.UUIDField('id_section', default=None, blank=True, null=True)
    name = models.TextField('Наименование')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Форма'
        verbose_name_plural = 'Формы'


class spr_chapters(models.Model):
    """
    Четверти
    """

    id = models.UUIDField('id', default=generate_uuid, primary_key=True)
    id_forms = models.ForeignKey(spr_forms, verbose_name='Форма', on_delete=models.SET_NULL, null=True)
    name = models.TextField('Наименование')
    number_f = models.TextField('Номер четверти')

    repository_addres = models.CharField('Адрес репозитория', max_length=32, default='', blank=True, null=True)
    type = models.TextField('Тип', default='', blank=True, null=True)
    position = models.IntegerField('Позиция', default=0, blank=True, null=True)
    store = models.JSONField('Данные', default='', blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Четверть'
        verbose_name_plural = 'Четверти'


class files(models.Model):
    id = models.UUIDField('id', default=generate_uuid, primary_key=True)
    name = models.TextField('Имя файла')
    id_chapter = models.ForeignKey(spr_chapters, verbose_name='Четверть', on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Файл'
        verbose_name_plural = 'Файлы'


class indicator_data(models.Model):
    """
    Наименование строки
    """

    id = models.UUIDField('id', default=generate_uuid, primary_key=True)
    name = models.TextField('Наименование строки')
    actual_d = models.DateField('Актуальная дата', default=datetime.date.today, blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Наименование строки'
        verbose_name_plural = 'Наименования строк'


class header_data(models.Model):
    """
    Наименование столбца
    """

    id = models.UUIDField('id', default=generate_uuid, primary_key=True)
    name = models.TextField('Наименование строки')
    actual_d = models.DateField('Актуальная дата', default=datetime.date.today, blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Наименование столбца'
        verbose_name_plural = 'Наименования столбцов'


class rows(models.Model):
    """
    Данные со строками
    """

    id = models.UUIDField('id', default=generate_uuid, primary_key=True)
    id_indicator = models.ForeignKey(indicator_data, verbose_name='Наименование строки', on_delete=models.SET_NULL,
                                     null=True)
    pos = models.IntegerField('Позиция в строке', default=0)
    id_parent = models.UUIDField('Родительский итем', default=generate_uuid, blank=True, null=True)
    id_code = models.IntegerField('Код', default=0, blank=True, null=True)
    id_chapter = models.ForeignKey(spr_chapters, verbose_name='Четверть', on_delete=models.SET_NULL, null=True)
    is_define = models.BooleanField('Определение?', default=False, blank=True, null=True)
    dimension = models.TextField('Размерность', default='', blank=True, null=True)

    direction = models.IntegerField('Строка в таблице', default=0, blank=True, null=True)

    def __str__(self):
        return self.id_chapter.name + '/' + self.id_indicator.name

    class Meta:
        verbose_name = 'Данные строки'
        verbose_name_plural = 'Данные строк'


class columns(models.Model):
    """
    Данные со столбцами
    """

    id = models.UUIDField('id', default=generate_uuid, primary_key=True)
    id_header = models.ForeignKey(header_data, verbose_name='Наименование столбца', on_delete=models.SET_NULL,
                                  null=True)
    pos = models.IntegerField('Позиция в столбце', default=0)
    # level = models.IntegerField('Позиция  в столбце', default=0)
    id_parent = models.UUIDField('Родительский итем', default=generate_uuid, blank=True, null=True)

    id_code = models.IntegerField('Код', default=0, blank=True, null=True)
    is_act = models.BooleanField('Is act', default=False, null=True)
    id_chapter = models.ForeignKey(spr_chapters, verbose_name='Четверть', on_delete=models.SET_NULL, null=True)

    direction = models.CharField('Столбец в таблице', default='', max_length=5, blank=True, null=True)

    startech = models.IntegerField('Стартовая строка', default=-1, blank=True, null=True)

    def __str__(self):
        return self.id_chapter.name + '/' + self.id_header.name

    class Meta:
        verbose_name = 'Данные столбца'
        verbose_name_plural = 'Данные столбцов'


class records(models.Model):
    id = models.UUIDField('id', default=generate_uuid, primary_key=True)

    id_column = models.ForeignKey(columns, verbose_name='Наименование строки', on_delete=models.CASCADE)
    id_row = models.ForeignKey(rows, verbose_name='Наименование строки', on_delete=models.SET_NULL, null=True)
    id_chapter = models.ForeignKey(spr_chapters, verbose_name='Наименование строки', on_delete=models.SET_NULL,
                                   null=True)
    icol = models.IntegerField('Номер информационного столбца', default=0, null=True)

    def __str__(self):
        return self.id_column.id_header.name + '/' + self.id_row.id_indicator.name

    class Meta:
        verbose_name = 'Запись в таблице'
        verbose_name_plural = 'Записи в таблице'


class passports(models.Model):
    id = models.UUIDField('id', default=generate_uuid, primary_key=True)
    # company = models.TextField('Контора', default='', blank=True, null=True)
    actual_d = models.DateTimeField('Актуальная дата', default=datetime.datetime.now(), blank=True, null=True)

    def __str__(self):
        return str(self.id)

    class Meta:
        verbose_name = 'Паспорт'
        verbose_name_plural = 'Паспорты'


class dataset(models.Model):
    id = models.UUIDField('id', default=generate_uuid, primary_key=True)
    record = models.ForeignKey(records, verbose_name='Позиция', on_delete=models.SET_NULL, null=True)
    data = models.TextField('Информация', default='', blank=True, null=True)
    passport = models.ForeignKey(passports, verbose_name='Паспорт', on_delete=models.SET_NULL, null=True)
    id_chapter = models.ForeignKey(spr_chapters, verbose_name='Четверть', on_delete=models.SET_NULL, null=True)

    row_uuid = models.UUIDField('UUID строки', default=0, blank=True, null=True)
    nrow = models.IntegerField('Номер строки', default=0, blank=True, null=True)

    def __str__(self):
        return str(self.data)

    class Meta:
        verbose_name = 'Массив данных'
        verbose_name_plural = 'Массивы данных'


class example(models.Model):
    id = models.UUIDField('id', default=generate_uuid, primary_key=True)
    name = models.TextField('Наименование', default='', blank=True, null=True)

    def __str__(self):
        return str(self.name)

    class Meta:
        verbose_name = 'Пример'
        verbose_name_plural = 'Примеры'

from django.http.response import Http404, HttpResponse, HttpResponseNotFound
from django.shortcuts import render

# Create your views here.

import os

# Build paths inside the project like this: BASE_DIR / 'subdir'.

from django.conf import settings

# Корневая директория
BASE_DIR = settings.BASE_DIR


def file(request):
    # Целевой путь
    path = request.path

    # Если путь пустой
    if path == '' or path == '/':
        path = '/index.html'
    
    # Корневая директория с исходниками
    m_dir = os.path.join(BASE_DIR, 'build/html')

    # Путь от корня
    m_path = m_dir + path

    # Если данный путь существует, то вернуть файл
    if os.path.exists(m_path):
        # Прочесть
        with open(m_path, 'rb') as f:
            data = f.read()

        # Находим формат файла
        filename, file_extension = os.path.splitext(m_path)

        # content_type для соответствующего формата
        if file_extension == '.css':
            response = HttpResponse(data, content_type='text/css')
        elif file_extension == '.js':
            response = HttpResponse(data, content_type='application/javascript')
        else:
            response = HttpResponse(data)

        # В Response добавляем длинну
        response['Content-Length'] = len(data)
        return response
    
    # Если файла нет, то 404
    return Http404()

def favicon(request):

    m_path = BASE_DIR + '/' + 'favicon.ico'

    print('m_path = ', m_path)

    if os.path.exists(m_path):
        with open(m_path, 'rb') as f:
            data = f.read()
        response = HttpResponse(data, content_type='image/x-icon')
        response['Content-Length'] = len(data)
        return response        

    return Http404()

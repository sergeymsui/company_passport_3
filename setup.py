#!/usr/bin/env python

from distutils.core import setup
from os.path import join, dirname

setup(name='ConverterDB',
      version='1.0',
      description='Enterprise passport database converter',
      long_description=open(join(dirname(__file__), 'README.md')).read(),
      author='Sergey Malichenko',
      author_email='s.malichenko@yandex.ru',
      url='https://www.python.org/sigs/distutils-sig/',
      packages=['distutils', 'distutils.command'],
     )
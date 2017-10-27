#!/usr/bin/env python

from setuptools import setup

setup(name='python_sabnzbd',
      version='1.0',
      description='SABnzbd Python dependencies',
      author='Thoradia',
      url='https://github.com/thoradia/LibreELEC.tv',
      py_modules = ['dummy'],
      install_requires=[
          "Cheetah==2.4.4",
          "Markdown==2.6.9",
          "asn1crypto==0.23.0",
          "cryptography==2.1.2",
          "enum34==1.1.6",
          "idna==2.6",
          "ipaddress==1.0.18",
          "py-notify==0.3.1",
          "sabyenc==3.3.1",
          "setuptools",
          "six==1.11.0",
        ],
     )

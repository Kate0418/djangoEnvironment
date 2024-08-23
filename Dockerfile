FROM python:3.11
WORKDIR /workdir

ARG APP_NAME

RUN pip install django
RUN django-admin startproject ${APP_NAME}
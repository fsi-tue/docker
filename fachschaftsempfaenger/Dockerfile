FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD ./fse/requirements.txt /code/
RUN pip install -r ./fse/requirements.txt
ADD ./fse/ /code/

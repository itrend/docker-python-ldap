FROM python:3.5

RUN apt-get update
RUN apt-get install -y libldap2-dev libsasl2-dev libssl-dev
RUN apt-get autoremove -y

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY requirements.txt /usr/src/app/
ONBUILD RUN pip install --no-cache-dir -r requirements.txt

ONBUILD COPY . /usr/src/app

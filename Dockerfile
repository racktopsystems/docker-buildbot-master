FROM python:2.7
MAINTAINER Stefan Schindler <docker-buildbot-master@boxbox.org>

RUN pip install sqlalchemy==0.7.10 buildbot==0.8.9

CMD ["/app/start"]

VOLUME "/app/data"
EXPOSE 9989
EXPOSE 8010

ADD start /app/start

FROM debian:8

ENV DEBIAN_FRONTEND noninteractive

MAINTAINER evertonagilar <evertonagilar@unb.br>

RUN mkdir /app
ADD ./app /app
VOLUME /app


ADD sources.list /etc/apt/sources.list
ADD preferences /etc/apt/preferences
ADD apt_unattended-upgrades /etc/apt/apt.conf.d/50unattended-upgrades
ADD apt_periodic /etc/apt/apt.conf.d/02periodic


RUN echo "***************** Part 1: Debian Linux installation *********************** "

RUN apt-get update
RUN apt-get install -y --force-yes --no-install-recommends curl wget net-tools
RUN apt-get install -y --force-yes --no-install-recommends unixodbc tdsodbc freetds-common odbcinst1debian2 odbcinst libcppdb-sqlite3-0 libodbc1 libiodbc2 libcppdb-odbc0 libltdl7 libcppdb0 ldap-utils
RUN apt-get dist-upgrade -y && apt-get autoremove -y && apt-get clean && apt-get autoclean



RUN echo "***************** Part 2: ERLANGMS installation *********************** "

RUN wget https://raw.githubusercontent.com/erlangMS/releases/master/setup/setup-emsbus-linux.x86_64.sh 
RUN chmod +x ./setup-emsbus-linux.x86_64.sh
RUN ./setup-emsbus-linux.x86_64.sh
RUN rm ./setup-emsbus-linux.x86_64.sh


COPY ./conf/emsbus.conf /var/opt/erlangms/.erlangms/

WORKDIR /var/opt/erlangms/
ENV HOME /var/opt/erlangms
ENV APP_VERSION {{ APP_VERSION }}
USER erlangms

LABEL HTTP_PORT="{{ HTTP_PORT }}"
LABEL HTTPS_PORT="{{ HTTPS_PORT }}"

EXPOSE {{ HTTP_PORT }}
EXPOSE {{ HTTPS_PORT }}

CMD [ "/var/opt/erlangms/ems-bus/bin/ems-bus", "console" ]







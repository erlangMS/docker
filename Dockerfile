FROM debian:8

ENV DEBIAN_FRONTEND noninteractive


RUN mkdir /app
ADD ./app /app
VOLUME /app


ADD sources.list /etc/apt/sources.list
ADD preferences /etc/apt/preferences
ADD apt_unattended-upgrades /etc/apt/apt.conf.d/50unattended-upgrades
ADD apt_periodic /etc/apt/apt.conf.d/02periodic


RUN echo "***************** Part 1: Debian Linux installation *********************** "

RUN apt-get update && \
	apt-get install -y curl wget net-tools vim && \
	apt-get install -y unixodbc tdsodbc freetds-common odbcinst1debian2 odbcinst libcppdb-sqlite3-0 libodbc1 libiodbc2 libcppdb-odbc0 libltdl7 libcppdb0 ldap-utils && \
	apt-get dist-upgrade -y && apt-get autoremove -y && apt-get clean && apt-get autoclean



RUN echo "***************** Part 2: ERLANGMS installation *********************** "

RUN wget https://raw.githubusercontent.com/erlangMS/releases/master/setup/setup-emsbus-linux.x86_64.sh 
RUN chmod +x ./setup-emsbus-linux.x86_64.sh
RUN ./setup-emsbus-linux.x86_64.sh
RUN rm ./setup-emsbus-linux.x86_64.sh


COPY ./conf/emsbus.conf /var/opt/erlangms/.erlangms/

WORKDIR /var/opt/erlangms/
ENV HOME /var/opt/erlangms
USER erlangms

#CMD [ "/var/opt/erlangms/ems-bus/bin/ems-bus", "console" ]

LABEL HTTP_PORT="3000"
LABEL HTTPS_PORT="4000"
EXPOSE 3000
EXPOSE 4000





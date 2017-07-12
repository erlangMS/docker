ErlangMS Docker Build
====

* sudo ./docker-build.sh  --app_url_git=http://servicosssi.unb.br/ssi/questionario_frontend.git --app=questionario


# Arquivo de configuração /etc/default/erlangms-docker 

```console
# Settings for erlangms docker image build

REGISTRY=164.41.106.30:5000
GIT_USER="erlangms"
GIT_PASSWD=""
ERLANGMS_RELEASE_URL="https://github.com/erlangms/releases/raw/master"
GIT_BASE_URL_PROJECTS="http://servicosssi.unb.br/ssi"
NPM_VERSION="4.2.0"
NODE_VERSION="v7.10.0"
ENVIRONMENT=minha_maquina

# E-mail UnB 
IMAP_SERVER="imap.gmail.com"
SMTP_SERVER="smtp.gmail.com"
SMTP_PORT=587
SMTP_LOGIN=erlangms@gmail.com
SMTP_PASSWD=
SMTP_DE=erlangms@unb.br
SMTP_PARA=

# ERLANGMS
ERLANGMS_ADDR=164.41.121.30
ERLANGMS_HTTP_PORT=2301
ERLANGMS_HTTPS_PORT=2344
ERLANGMS_AUTH_PROTOCOL=auth2

```


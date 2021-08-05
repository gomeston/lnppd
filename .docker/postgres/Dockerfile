ARG IMG_DB_VERSION=13-buster
FROM postgres:${IMG_DB_VERSION}

LABEL MAINTAINER="Ton Gomes <neilgomesdev@gmail.com>"

## Disable interactive mode for installation via APT
ENV DEBIAN_FRONTEND=noninteractive

## Update package information
RUN apt-get update \
  && apt-get upgrade -f -y

RUN apt-get install -f -y apt-utils

## Locale
RUN apt-get install -f -y --no-install-recommends locales locales-all
RUN sed -i -e 's/# pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen \
  && dpkg-reconfigure --frontend=noninteractive locales \
  && update-locale LANG=pt_BR.UTF-8

ENV LANG pt_BR.UTF-8
ENV LC_ALL pt_BR.UTF-8
ENV LANGUAGE pt_BR.UTF-8
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Copy existing application directory permissions
ARG DATA_VOLUME_DIR=/var/lib/postgresql/data
ARG NEWUID=1000
ARG NEWGID=1000
ARG LOGIN=postgres
ARG GROUP=postgres
RUN usermod -u ${NEWUID} ${LOGIN} \
  && groupmod -g ${NEWGID} ${GROUP} \
  && chown -hR ${LOGIN}:${GROUP} ${DATA_VOLUME_DIR}

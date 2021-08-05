ARG IMG_VERSION=1.21
FROM nginx:${IMG_VERSION}

LABEL MAINTAINER="Ton Gomes <neilgomesdev@gmail.com>"

## Disable interactive mode for installation via APT
ENV DEBIAN_FRONTEND=noninteractive

## Update package information
RUN apt-get update \
  && apt-get upgrade -f -y

RUN apt install -f -y \
  apt-utils \
  ca-certificates \
  apt-transport-https \
  software-properties-common \
  nano \
  iputils-ping \
  gnupg \
  locales \
  locales-all

## Locale
RUN sed -i -e 's/# pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen \
  && dpkg-reconfigure --frontend=noninteractive locales \
  && update-locale LANG=pt_BR.UTF-8

ENV LC_ALL pt_BR.UTF-8
ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR.UTF-8
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Setup Nginx
WORKDIR /var/www
RUN rm -rf $WORKDIR/html
ADD './.docker/config/nginx/conf.d/default.conf'  '/etc/nginx/conf.d/default.conf'

## Reload permissions
ADD .docker/scripts/reload_permissions.sh /opt/reload_permissions.sh
RUN chmod +x /opt/reload_permissions.sh
RUN ln -s /opt/reload_permissions.sh /bin/reload_permissions

# Copy existing application directory permissions
ARG WORK_DIR=/var/www
WORKDIR ${WORK_DIR}
ARG NEWUID=1000
ARG NEWGID=1000
ARG LOGIN=www-data
ARG GROUP=www-data
RUN usermod -u ${NEWUID} ${LOGIN} \
  && groupmod -g ${NEWGID} ${GROUP} \
  && chown -hR ${LOGIN}:${GROUP} ${WORK_DIR} \
  && chmod u+rwx,g+rx,o+rx ${WORK_DIR} \
  && find ${WORK_DIR} -type d -exec chmod u+rwx,g+rx,o+rx {} + \
  && find ${WORK_DIR} -type f -exec chmod u+rw,g+rw,o+r {} +


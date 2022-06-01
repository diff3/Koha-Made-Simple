FROM debian:bullseye

LABEL version="0.5"
LABEL description="Koha docker image"

ARG DEBIAN_FRONTEND="noninteractive"

# ENV LC_ALL sv_SE.UTF-8
ENV LANG sv_SE.UTF-8
ENV LANGUAGE sv_SE.UTF-8
ENV TZ=Europe/Stockholm

RUN apt-get update && apt-get -f -y -q --no-install-recommends install wget gnupg locales apache2 mariadb-server ca-certificates
RUN locale-gen sv_SE.UTF-8

RUN a2dismod mpm_event
RUN a2enmod mpm_prefork rewrite suexec cgi headers proxy_http && service apache2 restart
RUN wget -q -O - https://debian.koha-community.org/koha/gpg.asc | apt-key add - && echo 'deb http://debian.koha-community.org/koha stable main' | tee /etc/apt/sources.list.d/koha.list && apt-get update

RUN apt-get install -f -y -q --no-install-recommends koha-common


COPY entry.sh /
RUN chmod +x /entry.sh

CMD /entry.sh

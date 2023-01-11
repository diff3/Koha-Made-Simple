FROM debian:bullseye-slim

LABEL version="0.7"
LABEL description="Koha docker image"

ARG DEBIAN_FRONTEND="noninteractive"
ARG KOHA_DEB_REPOSITORY
RUN echo $KOHA_DEB_REPOSITORY

# ENV LC_ALL sv_SE.UTF-8
# ENV LANG sv_SE.UTF-8
# ENV LANGUAGE sv_SE.UTF-8
# ENV TZ=Europe/Stockholm

RUN apt-get update && apt-get -f -y -q --no-install-recommends install wget gnupg locales apache2  ca-certificates
RUN locale-gen sv_SE.UTF-8

RUN a2dismod mpm_event
RUN a2enmod mpm_prefork rewrite suexec cgi headers proxy_http && service apache2 restart
RUN wget -qO - https://debian.koha-community.org/koha/gpg.asc | gpg --dearmor -o /usr/share/keyrings/koha-keyring.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/koha-keyring.gpg] $KOHA_DEB_REPOSITORY" | tee /etc/apt/sources.list.d/koha.list && apt-get update

RUN apt-get install -f -y -q --no-install-recommends koha-common

COPY --chmod=755 entry.sh /
COPY koha_template.sql /etc

ENTRYPOINT [ "/entry.sh" ]

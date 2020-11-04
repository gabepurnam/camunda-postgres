FROM camunda/camunda-bpm-platform:tomcat-latest

USER root

RUN set -ex && apk --no-cache --update add openssl sudo tree joe

WORKDIR /camunda/webapps

RUN rm ROOT/ -rf && rm h2 -rf && rm host-manager -rf && rm manager -rf && rm docs -rf && rm examples -rf && mv camunda ROOT 

# CASO QUEIRA REMOVER O CAMUNDA INVOICE EXAMPLE, DESCOMENTE A LINHA ABAIXO
#RUN rm camunda-invoice/ -rf && rm camunda-welcome/ -rf

# ADICIONANDO TRADUÇÃO EM PORTUGUÊS BRASIL
RUN wget https://raw.githubusercontent.com/gabepurnam/camunda-webapp-translations/master/admin/pt-BR.json -P ROOT/app/admin/locales/ && \
	mv ROOT/app/admin/locales/pt-BR.json ROOT/app/admin/locales/en.json
RUN wget https://raw.githubusercontent.com/gabepurnam/camunda-webapp-translations/master/cockpit/pt-BR.json -P ROOT/app/cockpit/locales/ && \
	mv ROOT/app/cockpit/locales/pt-BR.json ROOT/app/cockpit/locales/en.json
RUN wget https://raw.githubusercontent.com/gabepurnam/camunda-webapp-translations/master/tasklist/pt-BR.json -P ROOT/app/tasklist/locales/ && \
	mv ROOT/app/tasklist/locales/pt-BR.json ROOT/app/tasklist/locales/en.json
RUN wget https://raw.githubusercontent.com/gabepurnam/camunda-webapp-translations/master/welcome/pt-BR.json -P ROOT/app/welcome/locales/ && \
	mv ROOT/app/welcome/locales/pt-BR.json ROOT/app/welcome/locales/en.json

RUN chown camunda.camunda /camunda -R && chmod 775 /camunda -R

ARG USER=camunda

RUN adduser $USER root \
    && echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
    && chmod 0440 /etc/sudoers.d/$USER

WORKDIR /camunda


# Camunda com Postgres Dockerfile

Projeto criado para simplificar o uso de camunda com postgres através do docker e suas configurações, usando como base a imagem do camunda-tomcat.

Este é um projeto simples que mostra como executar o Camunda com banco de dados Postgres através do docker e docker-compose.
Já foi adicionada a tradução em português das aplicações web (COCKPIT, TASKLIST, ADMIN, WELCOME) no momento de criação da imagem.

As traduções peguei do meu [fork](https://github.com/gabepurnam/camunda-webapp-translations) do projeto [Camunda Webapp Translations](https://github.com/camunda/camunda-webapp-translations)

## Pré requisitos

1. [Ter o docker instalado](https://docs.docker.com/get-docker/)
1. [Ter o docker-compose instalado](https://docs.docker.com/compose/install/)
1. Ter o make instalado (*OPCIONAL*) - [Windows](http://gnuwin32.sourceforge.net/packages/make.htm) / Linux (acho que vem por padrão, dependendo da distro) / Mac (mesmo que o linux)

## Usage

Para facilitar a criação e remoção ou reconstrução (caso tenha habilidado ou removido a tradução, ou o camunda-invoice, por exemplo),
adicionei um arquivo Makefile para simplificar os comandos.

* `$ make start ` Para iniciar o projeto 
* `$ make stop ` Para interromper a execução do projeto, sem destruir as imagens
* `$ make delete ` Para sem destruir as imagens do projeto
* `$ make re-init ` Para reconstruir as imagens do projeto


Ou, se quiser ir direto, pode usar os comandos `docker-compose up` para colocar o ambiente rodando.

Os endereços a serem utilizados serão:

* o [/](http://localhost/) para os webapps (cockpit, tasklist, admin, welcome).
* o [/engine-rest](http://localhost/engine-rest) para a api do engine.
* o [/camunda-invoice](http://localhost/camunda-invoice) para a homepage do exemplo padrão da camunda, caso não tenha removido na imagem docker.
* o [/camunda-welcome](http://localhost/camunda-welcome) para a homepage welcome padrão da camunda, caso não tenha removido na imagem docker.
* o [:8881](http://localhost:8881) para PgAdmin, afim de acessarmos e manusearmos a base de dados (chart@example.local/pgadmin2020).


Ainda há bastante coisa para adicionar quanto à documentação. Contribuições são bem vindas.

Espero que seja util.
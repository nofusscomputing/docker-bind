---
title: Dockerized Bind DNS Server
description: How to use No Fuss Computings docker container bind.
date: 2023-11-12
template: project.html
about: https://gitlab.com/nofusscomputing/projects/docker-bind
---

This docker container is for running the BIND9 DNS Server from within a container environment. Usage of the Alpine Linux image for the base was chosen to limit container size. Inclusive of bind9, `supervisord` is the entry point which starts bind9. As supervisor daemon is used, a health check has been setup and automagically runs and if any service fails, the health check will adjust accordingly.

!!! info "TL;DR"
    `docker pull nofusscomputing/bind:latest` for stable branch or `docker pull nofusscomputing/bind:dev` for head branch.


## Configuration

All Configuration for Bind is located in directory `/etc/bind/conf.d` when launching this container it's recommended that this path be a volume and you place your own config files there. Without doing so the container will start a DNS server that will be of no use.

!!! info
    Bind9 Documentation can be found at <https://bind9.readthedocs.io/en/v9.18.19/reference.html>


## Running the container

To quickly setup a container the following `docker-compose.yaml` file could be used.

``` yaml title="docker-compose.yaml" linenums="1"

services:

  bind:
    image: nofusscomputing/docker-bind:dev
    container_name : bind
    hostname: bind
    ports:
      - "53:53"
    volumes:
      - data_bind9_external:/etc/bind/conf.d/external
      - data_bind9_internal:/etc/bind/conf.d/internal
      - zones_bind9_dynamic:/var/bind/dyn
      - zones_bind9_primary:/var/bind/pri
      - zones_bind9_secondary:/var/bind/sec
      - logs_bind9:/var/logs
    environment:
      - TIMEZONE=UTC
    restart: always
    networks:
      - default
      - ingress


volumes:
  data_bind9_external:
  data_bind9_internal:
  logs_bind9:
  zones_bind9_dynamic:
  zones_bind9_primary:
  zones_bind9_secondary:


networks:
  default:
    external: no
  ingress:
    external: yes

```

#! /bin/bash

exec /usr/bin/docker run --rm --hostname my-rabbit --name rabbitmq1 -e RABBITMQ_DEFAULT_VHOST="/" \
 -e RABBITMQ_ERLANG_COOKIE="secret cookie here" -p 5672:5672 -p 15672:15672 -v /usr/local/src/rabbitmq:/var/lib/rabbitmq rabbitmq1
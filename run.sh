#! /bin/bash

exec /usr/bin/docker run --rm --hostname my-rabbit --name $CONTAINERNAME \
	-e RABBITMQ_DEFAULT_VHOST="$DEFAULT_VHOST" \
	-e RABBITMQ_ERLANG_COOKIE="$ERLANG_SECRET_COOKIE" \
	-p 5672:5672 -p 15672:15672 \
	-v $DATA_FOLDER:/var/lib/rabbitmq \
	$IMAGENAME
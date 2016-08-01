COMMON_NAME = rabbitmq
HOSTNAME = my-rabbit

IMAGE = $(COMMON_NAME)
NAME = $(COMMON_NAME)
ENV_VARS = -e RABBITMQ_DEFAULT_VHOST="/" -e RABBITMQ_ERLANG_COOKIE="secret cookie here"
PORTS = -p 5672:5672 -p 15672:15672
VOLUMES = \
	-v /usr/data/rabbitmq:/var/lib/rabbitmq


.PHONY: build run stop inspect rm logs ports

build:
		docker build -t $(IMAGE) .

# daemon only
run:
		docker run --rm -it $(NET) --hostname $(HOSTNAME) --name $(NAME) $(ENV_VARS) $(PORTS) $(VOLUMES) $(IMAGE)

stop:
		docker stop $(NAME)
		docker rm $(NAME)

inspect:
		docker exec -it $(NAME) bash

rm:
		docker rm $(NAME)

logs:
		docker logs $(NAME)

ports:
		docker port $(NAME)
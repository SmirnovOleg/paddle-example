FROM registry.jetbrains.team/p/paddle/docker/paddle-py-3-9:0.4.6

ARG JB_SPACE_CLIENT_ID
ARG JB_SPACE_CLIENT_SECRET

ENV JB_SPACE_CLIENT_ID $JB_SPACE_CLIENT_ID
ENV JB_SPACE_CLIENT_SECRET $JB_SPACE_CLIENT_SECRET

COPY . /paddle-example
WORKDIR /paddle-example

ENTRYPOINT ["java", "-jar", "/paddle.jar"]
FROM python:3.9-buster

ARG PADDLE_VERSION='0.4.5'

ARG JB_SPACE_CLIENT_ID
ARG JB_SPACE_CLIENT_SECRET

# Install OpenJDK-11
RUN apt-get update && \
    apt-get install -y openjdk-11-jre-headless && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

COPY . /paddle-example
WORKDIR /paddle-example

# Download Paddle
RUN wget -O /paddle-example/paddle.jar "https://github.com/JetBrains-Research/paddle/releases/download/v${PADDLE_VERSION}/paddle-${PADDLE_VERSION}-all.jar" && chmod +x /paddle-example/paddle.jar

ENV JB_SPACE_CLIENT_ID $JB_SPACE_CLIENT_ID
ENV JB_SPACE_CLIENT_SECRET $JB_SPACE_CLIENT_SECRET

ENTRYPOINT ["java", "-jar", "paddle.jar"]
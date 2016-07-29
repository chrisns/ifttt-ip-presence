FROM ubuntu:latest
RUN apt-get update && apt-get -y install \
  inetutils-ping \
  curl
COPY run.sh .
ENV SLEEP=5
CMD sh ./run.sh

FROM alpine:latest

RUN apk --no-cache add curl

#RUN apt-get update && apt-get -y install \
#  inetutils-ping \
#  curl

COPY run.sh .

ENV SLEEP=5

CMD sh ./run.sh

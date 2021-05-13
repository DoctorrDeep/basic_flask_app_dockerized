FROM ubuntu:hirsute

COPY . /app

ENV TZ=Europe/Amsterdam
ENV PYTHONPATH=/app/src

RUN apt update -y
RUN apt upgrade -y
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt install python3 -y 
RUN apt install python3-pip -y

RUN pip3 install Flask
CMD python3 /app/src/main.py
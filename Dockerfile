FROM ubuntu
RUN apt update
RUN apt install git -y
RUN apt install nodejs -y
RUN apt install npm -y

COPY ./webviz /webviz
WORKDIR /webviz
RUN npm run bootstrap
RUN npm run build

EXPOSE 80
EXPOSE 8080
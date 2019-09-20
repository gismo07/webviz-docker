FROM ubuntu
RUN apt update
RUN apt install git nodejs npm curl -y

RUN npm install -g npm && \ 
    npm install -g npm && \ 
    npm install -g n && \ 
    n latest && \ 
    npm install http-server -g

RUN git clone https://github.com/cruise-automation/webviz.git
WORKDIR /webviz

RUN npm install node-sass && \ 
    npm run bootstrap && \ 
    npm run build && \ 
    mkdir public && \ 
    cp packages/webviz-core/public/index.html public/ && \ 
    cp -r docs/public/dist/ public/ && \ 
    rm -rf LICENSE babel.config.js common/ docs/ flow-typed/ jest/ lerna.json node_modules/ package-lock.json package.json packages regconfig.json stories/ webpack.config.js

EXPOSE 8080

CMD [ "http-server" ]
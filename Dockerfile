FROM debian:jessie

RUN apt-get update
RUN apt-get install -y npm
RUN npm install -g nexe
RUN ln -sf /usr/bin/nodejs /usr/bin/node
RUN echo "console.log('test')" > app.js && nexe -i app.js -o app.bin
RUN rm app.js && rm app.bin

ENTRYPOINT ["nexe"]
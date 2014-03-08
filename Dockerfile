FROM debian:jessie

# GET NODE INSTALL DEPS
RUN       apt-get update
RUN       apt-get install -y build-essential python wget

# NODE V0.10.23
RUN       wget http://nodejs.org/dist/v0.10.23/node-v0.10.23.tar.gz
RUN       tar -zxvf node-v0.10.23.tar.gz
RUN       rm node-v0.10.23.tar.gz
WORKDIR   node-v0.10.23

# INSTALL NODE
RUN       ./configure
RUN       make
RUN       make install

# INSTALL NEXE
RUN       npm install -g nexe

# BUILD SOMETHING (FOR FASTER BUILDS HEREAFTER)
WORKDIR   ..
RUN       echo "console.log('test')" > app.js && nexe -i app.js -o app.bin

# CLEAN UP
RUN       rm app.js && rm app.bin
RUN       rm -r node-v0.10.23
RUN       apt-get remove -y build-essential python wget
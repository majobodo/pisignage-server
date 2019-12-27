FROM node:latest

RUN apt-get update && apt-get install -y ffmpeg imagemagick git

# Install pisignage
RUN git clone -b update-socketio https://github.com/majobodo/pisignage-server /usr/src/app && \
    cd /usr/src/app && \
    npm install

EXPOSE 3000

WORKDIR /usr/src/app

VOLUME ["/usr/src/media"]

ENV MONGO_HOST=mongo MONGO_PORT=27017 MONGO_DB=pisignage-server

COPY entrypoint.sh /entrypoint.sh
RUN chmod 744 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# VOLUME ["/usr/src/app/config/env/development.js"]

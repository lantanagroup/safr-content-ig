FROM ubuntu
RUN apt-get update && \
  apt-get install -y --no-install-recommends ruby-full build-essential zlib1g-dev git python3 bash curl openjdk-11-jdk nodejs && \
  apt-get install -y npm
RUN gem install jekyll bundler
RUN npm install -g fsh-sushi

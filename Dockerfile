FROM lantanagroup/measure-builder AS build
#FROM ubuntu AS build
#RUN apt-get update && apt-get install -y --no-install-recommends ruby-full build-essential zlib1g-dev git python3 bash curl openjdk-11-jdk
#RUN gem install jekyll bundler

WORKDIR /work
COPY . .
RUN npm install fsh-sushi
# Forcing script without prompts
RUN bash _updatePublisher.sh --yes
RUN bash _updateCQFTooling.sh --yes
RUN bash _genonce.sh

FROM nginx:1.21.6-alpine

COPY --from=build /work/output/. /usr/share/nginx/html
COPY nginx.default.conf /etc/nginx/conf.d/default.conf

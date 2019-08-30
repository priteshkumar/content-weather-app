from node as build
run mkdir -p /node/weather-app
copy . /node/weather-app
workdir /node/weather-app
run rm -rf .git
run npm install

from node:alpine
ARG APP_VERSION
ENV NODE_ENV="development"
copy --from=build /node/weather-app /var/weather-app
workdir /var/weather-app
expose 3000/tcp
entrypoint ["./bin/www"]




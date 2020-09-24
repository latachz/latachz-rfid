FROM node:10-alpine AS assets
WORKDIR /app/assets
COPY ./web/assets /app/assets
RUN yarn install && yarn build

FROM elixir:1.9.1-alpine
ARG MIX_ENV=prod
ARG DATABASE_URL=postgres://tiuiqjcfbamaeb:634b4e18e8321f1cfe587234d1b948b69a47cfbaa4919b59a3c288c1707141ca@ec2-54-247-79-178.eu-west-1.compute.amazonaws.com:5432/d607j33blq9640
ARG SECRET_KEY_BASE=qY6xuPl7zHSE76Gtx8szUJfO5EIoDd1o9PVBqAhRd6rdVuAJrM2ITv4PJjUTLdn7
ENV MIX_HOME=/root/.mix
WORKDIR /app
COPY /web /app
COPY --from=assets /app/assets/build /app/assets/build
RUN apk --no-cache add curl
RUN mix local.hex --force && mix local.rebar --force && mix do deps.get, compile
CMD mix phx.server
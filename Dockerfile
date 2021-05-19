FROM hexpm/elixir:1.12.0-erlang-24.0-alpine-3.13.3 as build

# install build dependencies
RUN apk add --no-cache build-base npm git python3

# prepare build dir
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# set build ENV
ENV MIX_ENV=prod

# install mix dependencies
COPY mix.exs ./
RUN mix do deps.get, deps.compile

# build assets

# compile and build release
COPY lib lib
# uncomment COPY if rel/ exists
# COPY rel rel
RUN mix do compile, release

# prepare release image
FROM alpine:3.13 AS app
RUN apk add --no-cache openssl ncurses-libs

# NOTE adding libstdc++ to the line above fixes

WORKDIR /app

RUN chown nobody:nobody /app

USER nobody:nobody

COPY --from=build --chown=nobody:nobody /app/_build/prod/rel/twelve ./

ENV HOME=/app

CMD ["bin/twelve", "start"]


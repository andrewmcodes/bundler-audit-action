FROM ruby:3.3.0-alpine

COPY LICENSE README.md /
COPY entrypoint.sh /entrypoint.sh

RUN apk add git
RUN gem install bundler bundler-audit

ENTRYPOINT ["/entrypoint.sh"]

FROM ruby:2.3-alpine

RUN echo 'gem: --no-document' >> /etc/gemrc

# https://github.com/gliderlabs/docker-alpine/issues/53#issuecomment-125671731
RUN apk add --no-cache \
  build-base \
  libxml2-dev \
  libxslt-dev

RUN gem install html-proofer

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]

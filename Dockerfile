FROM ruby:2.5.0

RUN mkdir -p /app

WORKDIR /app
COPY . ./

RUN bundle --version && bundle install --jobs 8 --retry 4 --system && \
  \
  find / -type f -iname \*.apk-new -delete && \
  rm -rf /usr/local/bundle/cache/* && \
  rm -rf ~/.bundle/cache/*


EXPOSE 9292

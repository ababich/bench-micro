FROM crystallang/crystal:0.24.1

RUN mkdir sources
COPY . sources

RUN cd sources && \
  shards install && \
  crystal build --release --verbose -o /usr/local/bin/application src/app.cr && \
  rm -rf /sources

EXPOSE 3000:3000
CMD ["application"]
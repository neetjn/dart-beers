FROM google/dart

WORKDIR /app

ADD beers/pubspec.* /app/
RUN pub get --no-precompile
ADD beers/. /app
RUN pub get --offline --no-precompile

ENTRYPOINT ["dart", "bin/main.dart"]

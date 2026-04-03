FROM dart:3.10

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      python3 \
      python3-pip && \
    pip3 install --break-system-packages fonttools && \
    rm -rf /var/lib/apt/lists/*

COPY pubspec.yaml pubspec.lock* ./
RUN dart pub get

COPY . .

ENV PORT=8080
ENV DATA_DIR=/data

EXPOSE 8080

CMD ["dart", "run", "bin/server.dart"]
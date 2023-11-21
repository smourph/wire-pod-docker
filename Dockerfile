FROM ubuntu:jammy

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/kercre123/wire-pod --depth=1

WORKDIR /wire-pod

RUN STT=vosk ./setup.sh \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["chipper/start.sh"]

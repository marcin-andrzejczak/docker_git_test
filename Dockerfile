FROM alpine

LABEL maintainer="marcin_andrzejczak@outlook.com"

RUN apk add --update python3 bash \
	&& python3 -m ensurepip \
	&& rm -r /usr/lib/python*/ensurepip \
	&& pip3 install --upgrade pip \
	&& rm -rf /var/cache/apk/*

COPY . /src

WORKDIR /src

RUN pip3 install -r requirements.txt

EXPOSE 8000

ENTRYPOINT ["./start.sh"]

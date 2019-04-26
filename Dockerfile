FROM surnet/alpine-wkhtmltopdf:3.7-0.12.5-small-font

RUN apk add wget unzip
RUN wget https://oscdl.ipa.go.jp/IPAexfont/IPAexfont00301.zip
RUN unzip IPAexfont00301.zip \
    && mv IPAexfont00301 /root/.fonts/

RUN fc-cache -f

RUN \
    set -xe; \
    apk --no-cache add ca-certificates tzdata; \
    cp -f /usr/share/zoneinfo/Asia/Tokyo /etc/localtime; \
    apk del --purge tzdata


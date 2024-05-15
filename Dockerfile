FROM imiobe/base:py3-ubuntu-20.04 as builder
LABEL maintainer="Benoît Suttor <benoit.suttor@imio.be>"
ENV PIP=23.3.1 \
  ZC_BUILDOUT=3.0.1 \
  SETUPTOOLS=69.0.2 \
  WHEEL=0.42.0 \
  PLONE_MAJOR=6.0 \
  PLONE_VERSION=6.0.9

# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  gcc \
  git \
  libbz2-dev \
  libc6-dev \
  libffi-dev \
  libjpeg62-dev \
  libopenjp2-7-dev \
  libmemcached-dev \
  libpcre3-dev \
  libpq-dev \
  libreadline-dev \
  libssl-dev \
  libxml2-dev \
  libxslt1-dev \
  python3-dev \
  python3-pip \
  wget \
  zlib1g-dev \
  && pip3 install --no-cache-dir pip==$PIP setuptools==$SETUPTOOLS zc.buildout==$ZC_BUILDOUT py-spy

WORKDIR /plone
RUN chown imio:imio -R /plone && mkdir /data && chown imio:imio -R /data

# COPY --chown=imio --from=docker-staging.imio.be/smartweb/news:latest /plone/eggs/ /plone/eggs/
COPY --chown=imio *.cfg /plone/
COPY --chown=imio scripts /plone/scripts
COPY --chown=imio templates /plone/templates
RUN su -c "buildout -c prod.cfg -t 30 -N" -s /bin/sh imio

FROM imiobe/base:py3-ubuntu-20.04
ENV PIP=23.3.1 \
  ZC_BUILDOUT=3.0.1 \
  SETUPTOOLS=69.0.2 \
  WHEEL=0.42.0 \
  PLONE_MAJOR=6.0 \
  PLONE_VERSION=6.0.9 \
  ZEO_HOST=db \
  ZEO_PORT=8100 \
  HOSTNAME_HOST=local \
  PROJECT_ID=smartweb

RUN mkdir -p /data/blobstorage && chown imio:imio -R /data && mkdir /plone && chown imio:imio -R /plone
VOLUME /data/blobstorage
WORKDIR /plone

# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends \
  libjpeg62 \
  libmemcached11 \
  libopenjp2-7 \
  libpq5 \
  libtiff5 \
  libxml2 \
  libxslt1.1 \
  lynx \
  netcat \
  poppler-utils \
  python3-distutils \
  rsync \
  wget \
  wv \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN curl -L https://github.com/Yelp/dumb-init/releases/download/v1.2.5/dumb-init_1.2.5_amd64.deb > /tmp/dumb-init.deb && dpkg -i /tmp/dumb-init.deb && rm /tmp/dumb-init.deb
COPY --chown=imio --from=builder /plone .
COPY --from=builder /usr/local/lib/python3.8/dist-packages /usr/local/lib/python3.8/dist-packages
COPY --from=builder /usr/local/bin/py-spy /usr/local/bin/py-spy
COPY --chown=imio docker-initialize.py docker-entrypoint.sh /
RUN sed -i 's/ZServer/gunicorn/g' parts/omelette/Products/CMFPlone/controlpanel/browser/overview.py # HACK for overview-controlpanel view

USER imio
EXPOSE 8080
HEALTHCHECK --interval=10s --timeout=5s --start-period=20s \
  CMD wget -q http://127.0.0.1:8080/ok -O - | grep OK || exit 1

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["console"]

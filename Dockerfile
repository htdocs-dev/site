# Copyright (c) 2016-2020 Martin Donath <martin.donath@squidfunk.com>

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.

FROM python:3.8.1-alpine3.11

# Build-time flags
ARG WITH_PLUGINS=true

# Set build directory
WORKDIR /tmp

# Copy files necessary for build
COPY requirements.txt requirements.txt

# Perform build and cleanup artifacts
RUN \
  apk add --no-cache \
    git \
    git-fast-import \
    openssh \
  && apk add --no-cache --virtual .build gcc musl-dev \
  && pip install --no-cache-dir -r requirements.txt \
  && \
    if [ "${WITH_PLUGINS}" = "true" ]; then \
      pip install --no-cache-dir \
        'mkdocs-minify-plugin>=0.3' \
        'mkdocs-redirects>=1.0'; \
    fi \
  && apk del .build gcc musl-dev \
  && rm -rf /tmp/*

# Set working directory
WORKDIR /docs

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]
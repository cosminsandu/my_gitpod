# You can find the new timestamped tags here: https://hub.docker.com/r/gitpod/workspace-base/tags
FROM gitpod/workspace-base:2024-01-04-18-58-45

USER root
ENV TRIGGER_REBUILD=1

RUN add-apt-repository -y ppa:ondrej/php \
    && apt-get install -y  \
      apt-transport-https \
      unzip \
      wget \
      git \
      sqlite \
      php8.3 \
      php8.3-cli \
      php8.3-dev \
      php8.3-bcmath \
      php8.3-ctype \
      php8.3-curl \
      php8.3-gd \
      php8.3-intl \
      php8.3-mbstring \
      php8.3-mysql \
      php8.3-sqlite3 \
      php8.3-tokenizer \
      php8.3-xml \
      php8.3-zip \
      php8.3-dom \
      php8.3-xdebug \
    && apt-get clean  \
    && rm -rf /var/lib/apt/lists/*

# Install apcu
RUN yes 'no' | pecl install -o -f apcu-5.1.23 \
    && echo 'extension=apcu.so' > /etc/php/8.3/cli/conf.d/21-apcu.ini

# Install Composer
RUN wget https://getcomposer.org/installer -O - | php -- --install-dir=/usr/local/bin --filename=composer

# Install Symfony CLI and fix permissions
RUN wget https://get.symfony.com/cli/installer -O - | bash -s -- --install-dir=/usr/local/bin
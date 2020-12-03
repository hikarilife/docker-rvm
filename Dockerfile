FROM ubuntu

ARG RVM_PASS

# DEBIAN_FRONTEND=noninteractive for interactive packages install
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y \
  sudo \
  git \
  # for rvm user
  openssl \
  # to install rvm
  gnupg2 \
  curl \
  # ruby in rvm dependies
  patch \
  gawk \
  g++ \
  autoconf \
  bison \
  libffi-dev \
  libgdbm-dev \
  libncurses5-dev \
  libsqlite3-dev \
  libtool \
  libyaml-dev \
  make \
  sqlite3 \
  zlib1g-dev \
  libgmp-dev \
  libreadline-dev \
  libssl-dev \
  # interactive
  pkg-config && \
  # add rvm user and add rvm user to sudo group
  useradd -m -u 1000 -s /bin/bash -p $(openssl passwd -crypt ${RVM_PASS}) rvm && \
  gpasswd -a rvm sudo

# install rvm
USER rvm
SHELL ["/bin/bash", "-c", "-l"]
RUN gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB && \
  curl -sSL https://get.rvm.io | bash -s stable --rails && \
  source /home/rvm/.rvm/scripts/rvm && \
# install ruby version which you want
  rvm install 2.5.1 && \
  rvm install 2.6.6 && \
  rvm install 2.7.2 && \
  rvm --default use 2.7.2

WORKDIR /usr/src/app

CMD ["/bin/bash"]
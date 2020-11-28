FROM ubuntu

ARG Ruby_PASS

# DEBIAN_FRONTEND=noninteractive for interactive packages install
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y \
  sudo \
  #for ruby user
  openssl \
  gnupg2 \
  curl \
  # ruby in rvm dependies
  patch \
  gawk \
  g++ \
#  gcc \
  autoconf \
#  automake \
  bison \
#  libc6-dev \
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
  pkg-config

#add ruby user and ruby user add to sudo group
RUN useradd -m -u 1000 -s /bin/bash -p $(openssl passwd -crypt ${Ruby_PASS}) ruby && \
  gpasswd -a ruby sudo

SHELL ["/bin/bash", "-c", "-l"]

# install rvm
USER ruby
RUN gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB 
RUN curl -sSL https://get.rvm.io | bash -s stable --rails
RUN source /home/ruby/.rvm/scripts/rvm
RUN rvm install 2.5.1 && \
  rvm install 2.6.6 && \
  rvm install 2.7.2


WORKDIR /usr/src/app

CMD ["/bin/bash"]
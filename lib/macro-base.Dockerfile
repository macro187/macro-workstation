ARG baseimage
FROM $baseimage

ARG user
ARG uid
ARG gid

USER root
WORKDIR /root
RUN set -eux ; \
    addgroup --gid $gid $user ; \
    adduser --disabled-password --uid $uid --ingroup $user $user

USER $user:$user
WORKDIR /home/$user
RUN set -eux ; \
    git clone https://github.com/macro187/macro-workstation.git ; \
    macro-workstation/macro-setup

USER $user:$user
WORKDIR /home/$user

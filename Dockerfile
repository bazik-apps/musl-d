ARG gid
ARG uid
ARG uname

FROM docker.io/chimeralinux/chimera:latest

RUN apk update && apk add --no-cache \
    shadow \
    ca-certificates \
    clang \
    curl \
    git \
    llvm \
    musl \
    wget2

RUN groupadd --gid $GID ${UNAME}
RUN useradd --gid $GID --uid $UID -m ${UNAME}

USER ${UNAME}

WORKDIR /home/${UNAME}

CMD ["/bin/sh"]

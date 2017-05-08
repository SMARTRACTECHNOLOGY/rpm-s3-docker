
FROM fedora:25

RUN dnf update -y && \
  dnf install -y createrepo python2-boto python-pexpect deltarpm python-deltarpm git && \
  dnf clean all

RUN git clone https://github.com/SMARTRACTECHNOLOGY/rpm-s3.git --recurse-submodules /rpm-s3 && \
  chmod u+x /rpm-s3/bin/rpm-s3

RUN groupadd --gid 1000 smartcosmos && \
  useradd --uid 1000 --gid 1000 --create-home --shell /usr/bin/bash smartcosmos

USER smartcosmos

ENV PATH $PATH:/rpm-s3/bin

ENTRYPOINT ["/rpm-s3/bin/rpm-s3"]

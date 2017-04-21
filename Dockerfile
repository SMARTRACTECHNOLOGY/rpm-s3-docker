
FROM fedora:latest

RUN dnf install -y createrepo python2-boto python-pexpect deltarpm python-deltarpm git && \
  dnf clean all

RUN git clone https://github.com/SMARTRACTECHNOLOGY/rpm-s3.git --recurse-submodules /rpm-s3 && \
  chmod +x /rpm-s3/bin/rpm-s3 && \
  ln -sf /rpm-s3/bin/rpm-s3 /usr/local/bin/rpm-s3

  ENTRYPOINT ["/usr/local/bin/rpm-s3"]

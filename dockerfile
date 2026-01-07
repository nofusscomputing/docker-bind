
ARG VERSION_BIND="9.21"


FROM internetsystemsconsortium/bind9:${VERSION_BIND}


EXPOSE \
  53/tcp \
  53/udp
  # Others required? dnssec, secure updates, sone transfers DOT etc


COPY includes/ /


RUN \
  chown bind:bind -R /etc/bind; \
  chmod 771 /etc/bind; \
  chmod +x /entrypoint.sh;


VOLUME /etc/bind

VOLUME /var/bind

VOLUME /var/log


ENTRYPOINT [ "/entrypoint.sh" ]


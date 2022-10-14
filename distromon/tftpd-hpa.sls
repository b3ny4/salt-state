install_tftpd_hpa:
  pkg.installed:
    - pkgs:
      - tftpd-hpa
  file.managed:
    - name: /etc/default/tftpd-hpa
    - source: salt://distromon/files/tftpd-hpa
    - makedirs: True

configure_pxeboot:
  file.recurse:
    - name: /srv/tftp
    - source: salt://distromon/files/tftp
    - include_empty: True

place_etc_motd:
  file.managed:
    - name: /etc/motd
    - source: salt://base/motd/files/motd


install_node_exporter:
  archive.extracted:
    - name: /usr/local/
    - source: salt://monitoring/files/node_exporter-1.4.0.linux-armv7.tar.gz
    - unless: test -d /usr/local/node_exporter-1.4.0.linux-armv7
  file.symlink:
    - name: /usr/local/node_exporter
    - target: /usr/local/node_exporter-1.4.0.linux-armv7

configure_node_exporter:
  file.managed:
    - name: /usr/lib/systemd/system/node_exporter.service
    - source: salt://monitoring/files/node_exporter.service
    - user: root
    - group: root
    - mode: '0644'
    - makedirs: True

start_node_exporter:
  service.running:
    - name: node_exporter.service
    - reload: true
    - enable: true
    - watch:
      - file: /usr/lib/systemd/system/node_exporter.service



install_prometheus:
  archive.extracted:
    - name: /usr/local/
    - source: salt://distromon/files/prometheus-2.37.1.linux-armv7.tar.gz
    - unless: test -d /usr/local/prometheus-2.37.1.linux-armv7
  file.symlink:
    - name: /usr/local/prometheus
    - target: /usr/local/prometheus-2.37.1.linux-armv7

configure_prometheus:
  file.managed:
    - names:
      - /usr/lib/systemd/system/prometheus.service:
        - source: salt://distromon/files/prometheus.service
        - makedirs: True
      - /usr/local/prometheus/prometheus.yml:
        - source: salt://distromon/files/prometheus.yml
        - makedirs: True

start_prometheus:
  service.running:
    - name: prometheus.service
    - enable: true
    - reload: true
    - watch:
      - file: /usr/local/prometheus/prometheus.yml

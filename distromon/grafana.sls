install_grafana:
  pkgrepo.managed:
    - humanname: Grafana PPA
    - name: deb https://packages.grafana.com/oss/deb stable main
    - dist: stable
    - file: /etc/apt/sources.list.d/grafana.list
    - key_url: salt://distromon/files/grafana_ppa_gpg.key
  pkg.installed:
    - name: grafana
  service.running:
    - name: grafana-server
    - enable: true

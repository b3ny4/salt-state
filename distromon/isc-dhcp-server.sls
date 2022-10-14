install_isc_dhcp_server:
  pkg.installed:
    - pkgs:
      - isc-dhcp-server
  file.managed:
    - names:
      - /etc/dhcp/dhcpd.conf:
        - source: salt://distromon/files/dhcpd.conf
      - /etc/default/isc-dhcp-server:
        - source: salt://distromon/files/isc-dhcp-server
  service.running:
    - name: isc-dhcp-server.service
    - enable: True
    - reload: True
    - watch:
      - file: /etc/dhcp/dhcpd.conf

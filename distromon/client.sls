eth0:
  network.managed:
    - enabled: True
    - type: eth
    - proto: static
    - ipaddr: 192.168.3.50
    - netmask: 255.255.255.0
    - gateway: 192.168.3.1
    - enable_ipv6: false
    - dns:
      - 8.8.8.8
      - 1.1.1.1

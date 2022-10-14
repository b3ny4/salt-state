benya:
  user.present:
    - fullname: benya
    - shell: /bin/zsh
    - groups:
      - adm
      - dialout
      - cdrom
      - sudo
      - audio
      - video
      - plugdev
      - games
      - users
      - input
      - render
      - netdev
      - gpio
      - i2c
      - spi
    - home: /home/benya
  ssh_auth.present:
    - user: benya
    - names:
      - {{ pillar['users']['benya'] }} 
    - config: '%h/.ssh/authorized_keys'

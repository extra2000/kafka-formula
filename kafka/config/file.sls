# -*- coding: utf-8 -*-
# vim: ft=sls

kafka-systemd-service-present:
  file.managed:
    - name: /etc/systemd/system/kafka.service
    - source: salt://kafka/files/kafka.service.jinja
    - template: jinja
    - force: true

kafka-systemd-reload:
  cmd.run:
   - name: systemctl daemon-reload
   - onchanges:
     - file: kafka-systemd-service-present

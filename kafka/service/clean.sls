# -*- coding: utf-8 -*-
# vim: ft=sls

kafka-service-dead:
  service.dead:
    - name: kafka.service
    - enable: false

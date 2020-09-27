# -*- coding: utf-8 -*-
# vim: ft=sls

kafka-service-running:
  service.running:
    - name: kafka.service
    - enable: true

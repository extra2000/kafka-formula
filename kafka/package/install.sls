# -*- coding: utf-8 -*-
# vim: ft=sls

kafka-group-present:
  group.present:
    - name: {{ pillar['kafka']['group'] }}

kafka-user-present:
  user.present:
    - name: {{ pillar['kafka']['user'] }}
    - groups:
      - {{ pillar['kafka']['group'] }}
      - sudo

kafka-binaries-present:
  archive.extracted:
    - name: /opt
    - source: {{ pillar['kafka']['archive']['source'] }}
    - source_hash: {{ pillar['kafka']['archive']['sha512'] }}
    - user: {{ pillar['kafka']['user'] }}
    - group: {{ pillar['kafka']['group'] }}

kafka-binaries-owner:
  file.directory:
    - name: /opt/kafka_{{ pillar['kafka']['scalaversion'] }}-{{ pillar['kafka']['version'] }}
    - user: {{ pillar['kafka']['user'] }}
    - group: {{ pillar['kafka']['group'] }}
    - recurse:
      - user
      - group
    - require:
      - archive: kafka-binaries-present

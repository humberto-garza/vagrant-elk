# Vagrant ELK stack

A vagrant based ELK stack (Elasticsearch, Logstash, Kibana).

Logstash is configured with one pipeline that listens to `Filebeat` input at port `5062`

Installation Steps:

```bash
vagrant up
visit URL for kibana - http://127.0.0.1:5601
Elasticsearch - http://127.0.0.1:9200
```

## Installed versions 

Contains the following software 
- Elasticsearch `7.<latest>`
- Logstash `7.<latest>`
- Kibana `7.<latest>`


## Configuration folders

```bash
# Elasticsearch
/etc/elasticsearch/

# Logstash
/etc/logstash/conf.d

# Kibana
/etc/kibana
```

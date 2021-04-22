#!/bin/bash
echo "拉取镜像logstash:7.6.2"
docker pull logstash:7.6.2

sudo mkdir /root/logstash
sudo cat > /root/logstash/logstash.conf << EOF 
input {
  tcp {
    mode => "server"
    host => "0.0.0.0"
    port => 4560
    codec => json_lines
    type => "debug"
  }
  tcp {
    mode => "server"
    host => "0.0.0.0"
    port => 4561
    codec => json_lines
    type => "error"
  }
  tcp {
    mode => "server"
    host => "0.0.0.0"
    port => 4562
    codec => json_lines
    type => "business"
  }
  tcp {
    mode => "server"
    host => "0.0.0.0"
    port => 4563
    codec => json_lines
    type => "record"
  }
}
filter{
  if [type] == "record" {
    mutate {
      remove_field => "port"
      remove_field => "host"
      remove_field => "@version"
    }
    json {
      source => "message"
      remove_field => ["message"]
    }
  }
}
output {
  elasticsearch {
    hosts => "es:9200"
    user => elastic                                                                                                                                                                                         
    password => czy1024  
    index => "mall-%{type}-%{+YYYY.MM.dd}"
  }
}
EOF

docker run  -d \
    -p 4560:4560 \
    -p 4561:4561 \
    -p 4562:4562 \
    -p 4563:4563 \
    --name logstash \
    --restart=always \
    --link es:es \
    -v /root/logstash/logstash.conf:/usr/share/logstash/pipeline/logstash.conf \
    -d logstash:7.6.2

docker exec -it logstash logstash-plugin install logstash-codec-json_lines --illegal-access=warn
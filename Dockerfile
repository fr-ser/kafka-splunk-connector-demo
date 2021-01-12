FROM confluentinc/cp-kafka-connect-base:6.0.0

RUN confluent-hub install --no-prompt splunk/kafka-connect-splunk:2.0

ENV CONNECT_GROUP_ID=kafka-connect
ENV CONNECT_CONFIG_STORAGE_TOPIC=kafka-connect-config
ENV CONNECT_OFFSET_STORAGE_TOPIC=kafka-connect-offset
ENV CONNECT_STATUS_STORAGE_TOPIC=kafka-connect-status
ENV CONNECT_INTERNAL_KEY_CONVERTER=org.apache.kafka.connect.json.JsonConverter
ENV CONNECT_INTERNAL_KEY_CONVERTER_SCHEMAS_ENABLE=false
ENV CONNECT_INTERNAL_VALUE_CONVERTER=org.apache.kafka.connect.json.JsonConverter
ENV CONNECT_INTERNAL_VALUE_CONVERTER_SCHEMAS_ENABLE=false
ENV CONNECT_KEY_CONVERTER=org.apache.kafka.connect.json.JsonConverter
ENV CONNECT_KEY_CONVERTER_SCHEMAS_ENABLE=false
ENV CONNECT_VALUE_CONVERTER=org.apache.kafka.connect.json.JsonConverter
ENV CONNECT_VALUE_CONVERTER_SCHEMAS_ENABLE=false
ENV CONNECT_PLUGIN_PATH=/usr/share/confluent-hub-components

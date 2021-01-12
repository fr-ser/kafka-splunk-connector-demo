# Kafka Splunk Connector Demo

## Setup

### Setting Up Splunk

Start a Splunk Enterprise instance by running `make start-splunk`

Open <http://localhost:8000> to access Splunk Web. Login with username admin and password password.

Configure a Splunk HEC using Splunk Web.

```txt
Click Settings > Data Inputs.

Click HTTP Event Collector.

Click Global Settings.
In the All Tokens toggle button, select Enabled.
Ensure SSL disabled is checked.
Change the HTTP Port Number to 8889.
Click Save.

Click New Token.
In the Name field, enter a name for the token: kafka
Click Next.
Click Review.
Click Submit.
```

Note the token value on the “Token has been created successfully” page. This token value is needed
for the connector configuration later.
Substitute `HEC_TOKEN` with the Splunk HEC token in `splunk-sink.json`

### Setting Up Kafka Connect

Start Kafka and Kafka-Connect with `start-kafka-connect`

One Kafka-Connect is running you can deploy the connector with `connector-install`

## Publish Data

To publish data into the Kafka topic you can use `publish-events`.

These events should appear in Splunk UI (<http://localhost:8000>) with the following search:
`source="http:kafka"`

`kafka` from the above search is the name of the Token.

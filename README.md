telegrafrelay
=============

A relay to collect metrics (as opposed to logs) and relay them to Amazon CloudWatch. Uses influxdata's [telegraf](https://github.com/influxdata/telegraf).

## Installation

This image is built automatically on Dockerhub as steemit/telegrafrelay so it's as simple as:
```bash
$ docker pull steemit/telegrafrelay
```

If you want to build the image yourself:

```bash
$ git clone https://github.com/steemit/telegrafrelay
$ cd telegrafrelay
$ docker build -t telegrafrelay .
```

## Configuration

The Docker build copies the `telegraf.conf` file in this repository to `/etc/telegraf/telegraf.conf`.
Environment variables you will probably want to set when running the Docker image are:
- `TELEGRAF_CLOUDWATCH_REGION`: the name of the AWS region where the CloudWatch metrics will be collected.
- `TELEGRAF_CLOUDWATCH_NAMESPACE`: the AWS namespace the Cloudwatch metrics will be placed under.

You'll also need to get valid AWS credentials into the container, whether by IAM or good old-fashioned
`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.

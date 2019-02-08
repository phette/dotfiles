#!/usr/bin/env bash

# Install docker-credential-ecr-helper (so we don't have to log into ECR frequently).
# Don't forget to set up ~/.docker/config.json.
go get github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login

# For unit testing.
go get github.com/smartystreets/goconvey

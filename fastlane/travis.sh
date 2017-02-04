#!/bin/sh

if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
  gem update fastlane
  carthage update --use-ssh --platform iOS
  fastlane test
  exit $?
fi

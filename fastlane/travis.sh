#!/bin/sh

if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
  gem update fastlane
  # carthage update --use-ssh --platform iOS
  cathage bootstrap
  fastlane test
  exit $?
fi

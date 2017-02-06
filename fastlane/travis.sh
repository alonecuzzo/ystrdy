#!/bin/sh

if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
  gem update fastlane
  carthage bootstrap --platform iOS
  fastlane test
  exit $?
fi

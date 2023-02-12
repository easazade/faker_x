#!/bin/bash

dart scripts/generate_all.dart
dart scripts/create_tests.dart
dart format .
dart analyze .
dart test .
#!/bin/bash

dart scripts/regenerate_base_classes.dart
dart scripts/generate_all.dart &&
dart scripts/create_tests.dart &&
dart scripts/generate_example.dart &&
dart scripts/readme.dart &&
dart format . &&
dart analyze . &&
dart test .
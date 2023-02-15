#!/bin/bash

dart scripts/regenerate_base_classes.dart
dart scripts/generate_all.dart &&
dart scripts/create_tests.dart &&
dart scripts/generate_example.dart &&
dart scripts/readme.dart &&
echo '----------------------------------------------------------------' &&
echo -e 'Formatting generated code \n' &&
dart format . &&
echo '----------------------------------------------------------------' &&
echo -e 'Analyzing generated code \n' &&
dart analyze . &&
echo '----------------------------------------------------------------' &&
echo -e 'Testing generated code \n' &&
dart test .
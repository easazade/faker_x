#!/bin/bash

dart scripts/regenerate_base_classes.dart
dart scripts/generate_all.dart &&
dart scripts/create_tests.dart &&
dart scripts/generate_example.dart &&
dart scripts/readme.dart &&
echo '----------------------------------------------------------------' &&
echo -e '\x1B[33mFormatting generated code\033[0m \n' &&
dart format . &&
echo '----------------------------------------------------------------' &&
echo -e '\x1B[33mAnalyzing generated code\033[0m \n' &&
dart analyze . &&
echo '----------------------------------------------------------------' &&
echo -e '\x1B[33mTesting generated code\033[0m \n' &&
dart test .
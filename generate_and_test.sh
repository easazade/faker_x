#!/bin/bash

dart scripts/generate_all.dart &&
dart scripts/create_tests.dart &&
dart scripts/generate_example.dart &&
dart format . &&
dart analyze . &&
dart test .
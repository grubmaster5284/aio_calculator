#!/bin/bash
# Script to generate all freezed and json_serializable files

echo "Running flutter pub get..."
flutter pub get

echo "Running build_runner to generate freezed and json_serializable files..."
dart run build_runner build --delete-conflicting-outputs

echo "Code generation complete!"


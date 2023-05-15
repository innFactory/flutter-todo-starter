#!/bin/bash
set -e

package_name="api_client"

# OpenApi Generator
openapi_path="../../openapi.json"
openapi_jar_path="./openapi-generator-cli.jar"
openapi_generator_version="6.4.0"
openapi_generator_url="https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/$openapi_generator_version/openapi-generator-cli-$openapi_generator_version.jar"

# Clean existing files
find . -not -path "./.git" -not -path "./.git/*" -not -path "*/openapi.json" -not -path "./generate*" -not -path "CHANGELOG.md" -not -path "." -exec rm -rf {} +

# Get dependencies
wget $openapi_generator_url -O $openapi_jar_path

# Generate the dart-dio client
java -jar $openapi_jar_path generate -i $openapi_path -g dart-dio --additional-properties=pubName=$package_name,pubLibrary=$package_name,enumUnknownDefaultCase=true,serializationLibrary=json_serializable

# Delete the openapi-generator-cli.jar
rm $openapi_jar_path

# Clean up the generated files
dart pub get
dart format --fix lib
dart pub run build_runner build --delete-conflicting-outputs
rm -rf test
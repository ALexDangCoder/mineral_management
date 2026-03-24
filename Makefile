.PHONY: clean get gen run-dev run-stg run-prod build-android-dev build-android-stg build-android-prod build-android-all

# Clean project
clean:
	fvm flutter clean

# Get packages
get:
	fvm flutter pub get

# Run build_runner to generate files (JSON serialization, Freezed, etc.)
gen:
	fvm dart run build_runner build --delete-conflicting-outputs

# --- Run Commands ---
run-dev:
	flutter run --flavor develop -t lib/main_develop.dart

run-stg:
	flutter run --flavor staging -t lib/main_staging.dart

run-prod:
	flutter run --flavor product -t lib/main_product.dart

# --- Build Android APK Commands ---
build-android-dev:
	fvm flutter build apk --flavor develop -t lib/main_develop.dart

build-android-stg:
	fvm flutter build apk --flavor staging -t lib/main_staging.dart

build-android-prod:
	fvm flutter build apk --flavor product -t lib/main_product.dart

# Build APKs for all environments
build-android-all: build-android-dev build-android-stg build-android-prod

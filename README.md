# Flutter Todo Starter

This project is a starting point for scalable and complex flutter applications.

## Getting Started

### FVM / Flutter

This project uses [fvm](https://fvm.app/) to manage flutter versions. If you have already installed flutter or dart on your machine, you should uninstall it before installing fvm. After installation run the following command to install the correct flutter version:

```bash
# To install the correct flutter version defined in .fvm/fvm_config.json
fvm use

# The template ususally uses the stable version of flutter. FVM doesn't care if your stable version is up to date. To make sure you have the latest stable version run the following command:
fvm flutter upgrade
```

To make working with `fvm` easier we recommend creating aliases for the `flutter` and `dart` commands in your `.bashrc` or `.zshrc` file:

```bash
alias flutter="fvm flutter"
alias dart="fvm dart"
```

This will ensure that running any `flutter` or `dart` command always uses the project's defined flutter version or the accompanying dart version.

### Melos

Additionally since the project uses an architecture made up of multiple packages, we use [melos](https://melos.invertase.dev/~melos-latest) to manage the packages. To install the correct version of melos and initialize the project run the following command:

```bash
flutter pub get && flutter pub run init
```

We also recommend you setup an alias for working with melos:

```bash
alias melos="flutter pub run melos"
```

In the `melos.yaml` File in the project root directory you can find all the scripts that are available to you. To run a script simply run the following command:

```bash
melos run <script_name>
```

The most important commands are:

* `melos run init` - Combination of the [bootstrap](https://melos.invertase.dev/~melos-latest/commands/bootstrap) command and the `melos run build` script
* `melos bs` or `melos boostrap` - Run the [bootstrap](https://melos.invertase.dev/~melos-latest/commands/bootstrap) command (Install all dependencies in all packages)
* `melos run build` - Run `build_runner` in all relevant packages
* `melos run build:watch` - Run `build_runner` in all relevant packages in watch mode

### Running the App

The app has three environments: `development`, `staging` and `production`. But only
`development` is initially configured.

Using VSCode all environments are configured as launch configurations. If you need to run the app from the command line you can use the following command:

```bash
flutter run --flavor <environment> --target lib/main_<environment>.dart

# Example
flutter run --flavor development --target lib/main_development.dart
```

> Note: The mocked sign in credentials are `email` and `password`.


## Project structure

Generally the project consists of the following packages.

### **app** (`packages/app`)

This is the entry point for launching the app and contains the ui pages and routing.

### **core** (`packages/core`)

The core package contains the EnvironmentConfig, logging and utility functions used in all packages, etc. It also acts as a dependency core, providing essential packages with centrally defined versions.

### **database** (`packages/database`, also referenced as "local")

The database package contains the database and the corresponding local dtos, tables and daos.

### **api-client** (`packages/api-client`)

The api client package contains a generated api client, which processes the basic network requests and generates the corresponding remote dtos.

### **api** (`packages/api`, also referenced as "remote")

The api package references the generated api client and acts as a proxy which injects e.g. the auth token and provides wrapper functions for network requests for each feature.

### **feature packages** (e.g. `packages/todo`)

Each feature has its own package, which is divided into the following sections:

- application: The application folder contains the logic for the ui, e.g. controller and usecases, as well as forms
- domain: The domain folder contains models,  repositories, provider and widgets
- infrastructure: The infrastructure folder contains the repository implementation and mapper functions

### Functional Programming

The Project uses functional programming patterns from [fpdart](https://pub.dev/packages/fpdart).

### Backend

This repository also contains a simple backend service to store the todos. Get it running by following the instructions in the [backend README](./backend/README.md).

You will need to configure your IP address in the `packages/core/lib/src/environment.dart` file. To get the app connected to your local backend instance.

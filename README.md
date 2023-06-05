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

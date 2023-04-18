# Flutter Todo Starter

This project is a starting point for scalable and complex flutter applications.

## Getting Started

### FVM

This project uses [fvm](https://fvm.app/) to manage flutter versions. After installation run the following command to install the correct flutter version:

```bash
fvm use
```

This will prompt you to install the stable version of flutter if you don't already have it installed. To make working with `fvm` easier we recommend you to create an alias in your `.bashrc` or `.zshrc` file:

```bash
alias flutter="fvm flutter"
```

This will ensure that running any flutter command always uses the project's flutter version.

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

The most important scripts are:

* `melos run init` - Combination of `melos bootstrap` and the `melos run build` script
* `melos run build` - Run `build_runner` in all relevant packages
* `melos run build:watch` - Run `build_runner` in all relevant packages in watch mode

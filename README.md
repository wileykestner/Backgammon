# Backgammon

This is a toy repo that I have no serious intention of developing, it's a playground for ideas and fun, that's it!

## To generate the Xcode project

```bash
bazel run //:xcodeproj && xed Backgammon.xcodeproj
```

## To build the app

```bash
bazel build //Backgammon:BackgammonApp
```
## To build & run the app:

```bash
bazel run //Backgammon:BackgammonApp --ios_simulator_device="iPhone 16 Pro" --ios_simulator_version="18.3"
```

## To build & run the tests

```bash
bazel test //:BackgammonTests
```

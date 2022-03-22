load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

# TODO:
# When a new version of rules_apple higher than 0.33.0 is released, try upgrading and removing
# this manual git_repository rule that loads a custom version of rules_swift
#
git_repository(
    name = "build_bazel_rules_swift",
    remote = "https://github.com/bazelbuild/rules_swift",
    commit = "7b8558cab8e402eb21e2fc655989bae378171486",
    shallow_since = "1647912211 -0700",
)

http_archive(
    name = "build_bazel_rules_apple",
    url = "https://github.com/bazelbuild/rules_apple/releases/download/0.33.0/rules_apple.0.33.0.tar.gz",
    sha256 = "a5f00fd89eff67291f6cd3efdc8fad30f4727e6ebb90718f3f05bbf3c3dd5ed7",
)

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

# TODO:
# remove `ignore_version_differences = True` when we can upgrade
# to a versioned release of rules_apple higher than 0.33.0
#
apple_rules_dependencies(ignore_version_differences = True)

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

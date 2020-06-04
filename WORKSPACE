workspace(name = "test")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_toolchains",
    sha256 = "db48eed61552e25d36fe051a65d2a329cc0fb08442627e8f13960c5ab087a44e",
    strip_prefix = "bazel-toolchains-3.2.0",
    urls = [
        "https://github.com/bazelbuild/bazel-toolchains/releases/download/3.2.0/bazel-toolchains-3.2.0.tar.gz",
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-toolchains/releases/download/3.2.0/bazel-toolchains-3.2.0.tar.gz",
    ],
)

http_archive(
    name = "rules_foreign_cc",
    strip_prefix = "rules_foreign_cc-74b146dc87d37baa1919da1e8f7b8aafbd32acd9",
    sha256 = "2de65ab702ebd0094da3885aae2a6a370df5edb4c9d0186096de79dffb356dbc",
    url = "https://github.com/bazelbuild/rules_foreign_cc/archive/74b146dc87d37baa1919da1e8f7b8aafbd32acd9.zip",
)

load("@rules_foreign_cc//:workspace_definitions.bzl", "rules_foreign_cc_dependencies")

all_contents = """filegroup(name="all", srcs=glob(["**"]), visibility=["//visibility:public"])"""

http_archive(
    name = "cmake_linux",
    build_file_content = all_contents,
    sha256 = "0641046b4c35ac5119cd2f24f16246bfb242b47c89cbad19a9162ccbfb247d47",
    url = "https://github.com/Kitware/CMake/releases/download/v3.16.2/cmake-3.16.2-Linux-x86_64.tar.gz",
)

http_archive(
    name = "ninja_linux",
    build_file_content = all_contents,
    sha256 = "d2fea9ff33b3ef353161ed906f260d565ca55b8ca0568fa07b1d2cab90a84a07",
    url = "https://github.com/ninja-build/ninja/releases/download/v1.8.2/ninja-linux.zip",
)

rules_foreign_cc_dependencies([
    "//tools:prebuilt_cmake_toolchain_linux",
    "//tools:prebuilt_ninja_toolchain_linux",
])

http_archive(
    name = "llvm",
    build_file_content = all_contents,
    strip_prefix = "llvm-project-fb042b094fda351b59f1b00fe6235fc55d0f79b9",
    sha256 = "06664e823231dd792108efed5b373a94325fa4d8fb1e0c2ef3f4329307bb31e4",
    urls = ["https://github.com/llvm/llvm-project/archive/fb042b094fda351b59f1b00fe6235fc55d0f79b9.zip"],
)


# Tarantool static build tooling

These files help to prepare environment for building Tarantool
statically. And builds it.

## Prerequisites

CentOS:

```bash
yum install -y \
    git perl gcc cmake make gcc-c++ libstdc++-static autoconf automake libtool \
    python-msgpack python-yaml python-argparse python-six python-gevent
```

MacOS:

Before you start please install default Xcode Tools by Apple:

```
sudo xcode-select --install
sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
```

Install brew using command from
[Homebrew repository instructions](https://github.com/Homebrew/inst)

After that run next script:

```bash
  brew install autoconf automake libtool cmake file://$${PWD}/tools/brew_taps/tntpython2.rbs
  pip install --force-reinstall -r test-run/requirements.txt
```

### Usage

```bash
cmake .
make -j
ctest -V
```

## Customize your build

If you want to customise build, you need to set `CMAKE_TARANTOOL_ARGS` variable

### Usage

There is three types of `CMAKE_BUILD_TYPE`:
* Debug - default
* Release
* RelWithDebInfo

And you want to build tarantool with RelWithDebInfo:

```bash
cmake -DCMAKE_TARANTOOL_ARGS="-DCMAKE_BUILD_TYPE=RelWithDebInfo" .
```

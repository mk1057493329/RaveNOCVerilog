# RaveNOCVerilog
ravenoc project changed from System Verilog to Verilog to  be  simulated in Xilinx ISE

# Convertion Steps
## 1.Convert All .sv files to .v using sv2v project
### sv2v: SystemVerilog to Verilog

sv2v converts SystemVerilog ([IEEE 1800-2017]) to Verilog ([IEEE 1364-2005]),
with an emphasis on supporting synthesizable language constructs.
[sv2v source]: https://github.com/r-shakoori/sv2v

#### Pre-built binaries

Binaries for Ubuntu, macOS, and Windows are available on the [releases page]. If
your system is not covered, or you would like to build the latest commit, simple
instructions for building from source are below.

[releases page]: https://github.com/r-shakoori/sv2v/releases

### Building from source

You must have [Stack] installed to build sv2v. Then you can:

[Stack]: https://www.haskellstack.org/

```
git clone https://github.com/zachjs/sv2v.git
cd sv2v
make
```

This creates the executable at `./bin/sv2v`. Stack takes care of installing
exact (compatible) versions of the compiler and sv2v's build dependencies.

You can install the binary to your local bin path (typically `~/.local/bin`) by
running `stack install`, or copy over the executable manually.


## Usage

sv2v takes in a list of files and prints the converted Verilog to `stdout`.
Using `--write=adjacent` will create a converted `.v` for every `.sv` input file
rather than printing to `stdout`. `--write`/`-w` can also be used to specify a
path to a `.v` output file.

Users may specify `include` search paths, define macros during preprocessing,
and exclude some of the conversions. Specifying `-` as an input file will read
from `stdin`.

Below is the current usage printout. This interface is subject to change.

```
sv2v [OPTIONS] [FILES]

Preprocessing:
  -I --incdir=DIR           Add directory to include search path
  -D --define=NAME[=VALUE]  Define a macro for preprocessing
     --siloed               Lex input files separately, so macros from
                            earlier files are not defined in later files
     --skip-preprocessor    Disable preprocessor
Conversion:
     --pass-through         Dump input without converting
  -E --exclude=CONV         Exclude a particular conversion (Always, Assert,
                            Interface, Logic, or UnbasedUnsized)
  -v --verbose              Retain certain conversion artifacts
  -w --write=MODE/FILE      How to write output; default is 'stdout'; use
                            'adjacent' to create a .v file next to each input;
                            use a path ending in .v to write to a file
Other:
     --oversized-numbers    Disable standard-imposed 32-bit limit on unsized
                            number literals (e.g., 'h1_ffff_ffff, 4294967296)
     --dump-prefix=PATH     Create intermediate output files with the given
                            path prefix; used for internal debugging
     --help                 Display help message
     --version              Print version information
     --numeric-version      Print just the version number
```

Sample usages in this project:

```c
without dependency:
./sv2v --write=adjacent ../../Desktop/ravenoc/src/router/router_if.sv

with dependency to a file  like ravenoc_pkg.sv:
./sv2v --write=adjacent ../../Desktop/ravenoc/src/router/input_datapath.sv ../../Desktop/ravenoc/src/router/ravenoc_pkg.sv

for multiple files having same dependency you should delete the dependency .v file and let  it be  recreated!
```

## 2.router_if.v interface problem

router_if.v is defining an interface which is used in definition of router interfaces. as Verilog does not support interface despite SystemVerilog we should change the file ravenoc_router.v file with some resgisters suffixed by _req and _resp to make it work!

## 3. Synthesis
![alt text](https://github.com/r-shakoori/RaveNOCVerilog/top-level.png)

# CTSS on simh quickstart

This repo provided a quick way to get a pre-installed
[CTSS](https://timereshared.com/ctss/) running on the simh emulator.
It is a small wrapper around two excellent creations of
[Richard Cornwell](https://sky-visions.com/ibm/index.shtml):

* The IBM 709/7090/7094 emulator, distributed as part of
  [open-simh](https://github.com/open-simh/simh).
* The [reconstructed](https://github.com/rcornwell/ctss) CTSS
  operating system

## Prerequisites

You will need a Unix-like environment capable of running a shell, git,
make, a C compiler etc.

You will also need the `telnet` command line program or a GUI telnet
client. The command line program can be installed by `sudo apt install
telnet` on Debian/Ubuntu or `brew install telnet` on MacOS.

## Build the system

Type `./build.sh`. This will:

* Clone the open-simh and ctss repos under `dist/`
* Build the open-simh i7090 binary.
* Copy needed disk and card files into `dasd/` and `units/`.

This will take around a minute and will only need to be done once.

## Start CTSS

Type `./run.sh`. After a few seconds the system will say it is ready
for connection. Using a telnet client, connect to port 7090 (eg via
`telnet 0 7090`.)

In the telnet session, try typing `login guest` and then giving the
password `guest`. Once logged in, try running a command like `listf`.

Note that the connection does not support the Delete key (like the
teletype it is emulating). To delete the last character, press `#`. To
delete a whole line, press `@`.

## Shutting down

* Go back to the original window where you entered the `run.sh`
  command
* Press `Control-E`
* Type `do shutdown.ini`
* Wait for around 30s, after which it will return to the host OS.

You can restart CTSS with `./run.sh` as needed.

## Learning more

* See the READMEs under `dist/open-simh/` and `dist/ctss/` to learn
  more about the simh emulator and the reconstructed CTSS kit.
* Read the [CTSS Programmer's
  Guide](https://bitsavers.org/pdf/mit/ctss/CTSS_ProgrammersGuide_Dec69.pdf)
  (PDF) to learn more about CTSS
* See my blog post series on CTSS at https://timereshared.com/ctss/

## License

3-clause new BSD; see LICENSE file.

This excludes the items cloned at runtime under `dist/` which have
their own licenses.

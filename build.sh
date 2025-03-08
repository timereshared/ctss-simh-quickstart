#!/bin/sh

# Script to build simh and assemble a copy of CTSS.

# Make the directories we will need
mkdir -p dist                   # Cloned opensimh and CTSS
mkdir -p bin                    # Destination for simh binary
mkdir -p dasd                   # Disks and drums holding CTSS
mkdir -p units                  # Tape, punched card and printer

# Get open-simh
cd dist
if [ ! -d "open-simh" ] ; then
    git clone https://github.com/open-simh/simh.git open-simh
fi

# Build open-simh. Note we only need i7090 so no need to build more.
cd open-simh
make i7090
if [ ! -f "BIN/i7090" ]
then
    echo "*** i7090 did not compile successfully"
    exit 1
fi
cp BIN/i7090 ../../bin
cd ..

# Get CTSS
if [ ! -d "ctss" ] ; then
    git clone https://github.com/rcornwell/ctss
fi
cd ctss

# Extract copies of disks and drums
echo "Extracting disks and drums"
gzip -ckd bin/dasd/DISK1.BIN.gz > ../../dasd/disk1.bin
gzip -ckd bin/dasd/DISK2.BIN.gz > ../../dasd/disk2.bin
gzip -ckd bin/dasd/DRUM1.BIN.gz > ../../dasd/drum1.bin
gzip -ckd bin/dasd/DRUM2.BIN.gz > ../../dasd/drum2.bin

# Make a copy of the punched card needed to boot
cp bin/mit.crd ../../units

echo ""
echo "simh and CTSS have been built."

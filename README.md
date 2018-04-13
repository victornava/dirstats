# Dirstats

Dirstats is a command line program that produces basic file statistics of a directory.

Statistics include:

- Total size
- Total items
- Total files
- Total directories
- Top files by size
- Top directories by size
- Top directories by file count

Written in Ruby. Tested on MacOS.

## Installation

Run `dirstat` from the root directory:

    ./dirstat

or symlink it somewhere in your bin path, for example:

    cd ~/bin
    ln -s PATH_TO_HERE/dirstats dirstats

Then use it as a regular command.
  
## Usage

    distats DIRECTORY [options]
      --top NUMBER                 Number of top items to show
      --output-format FORMAT       Output format: text, json
      --dump-items                 List all items in json format
      --help                       Print this help

## Example

Running:

    distats test-data

Would scan all files in the directory `test-data` and produce:

    Total size: 14.31 MB
    Total items: 390
    Total files: 349
    Total directories: 41
    
    Top files by size:
    
    97.63 KB test-data/home/Music/Guaco/Amazonas/11 Ese Rumbo Es De Los Dos.mp3
    97.40 KB test-data/home/Pictures/2014/IMG_5283.JPG
    97.26 KB test-data/home/Music/Bonobo/Black Sands/01 Prelude.m4a
    96.85 KB test-data/home/Pictures/2016/20160211-IMG_0382.JPG
    96.66 KB test-data/home/Pictures/2015/20150127-IMG_7291.JPG
    96.66 KB test-data/home/Music/Bonobo/Dial 'M' for Monkey/09 Light Pattern.mp3
    96.48 KB test-data/home/Music/TOOL/10000 Days/01 Vicarious.mp3
    96.34 KB test-data/home/Pictures/2017/IMG_1067.JPG
    95.65 KB test-data/home/Music/Bonobo/Migration/04 Grains.mp3
    95.61 KB test-data/home/Music/Bonobo/Migration/06 Surface (Feat. Nicole Miglis).mp3
    
    Top directories by size:
    
    14.31 MB test-data
    14.29 MB test-data/home
    9.12 MB  test-data/home/Music
    4.96 MB  test-data/home/Pictures
    2.81 MB  test-data/home/Music/TOOL
    2.73 MB  test-data/home/Music/Draco
    2.41 MB  test-data/home/Music/Bonobo
    2.08 MB  test-data/home/Pictures/2014
    1.63 MB  test-data/home/Pictures/2015
    1.18 MB  test-data/home/Music/Guaco
    
    Top directories by file count:
    
    389 test-data
    372 test-data/home
    196 test-data/home/Music
    112 test-data/home/Pictures
    60  test-data/home/Music/TOOL
    55  test-data/home/Music/Draco
    55  test-data/home/dev
    51  test-data/home/Music/Bonobo
    44  test-data/home/Pictures/2014
    32  test-data/home/Pictures/2015

## Testing

To run the tests:

    ruby test.rb

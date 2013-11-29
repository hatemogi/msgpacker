# MsgPacker: json2msgpack, msgpack2json

a rubygem which converts JSON to MsgPack and vice versa. 
It contains an excutable script that reads from STDIN and writes the converted stream to STDOUT.

## Installation and Usage

Install this gem
    gem install msgpacker

And then execute:

    $ cat DATA.json | msgpacker > DATA.mpac

Then you might want to decode the MsgPack-ed file

    $ cat DATA.mpac | msgpacker -d > DATA_decoded.json


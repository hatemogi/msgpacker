# MsgPacker: json2msgpack, msgpack2json

a rubygem which converts a JSON stream to MsgPack-ed one and vice versa. 
It contains an excutable script that reads from STDIN and writes the converted stream to STDOUT.

## Installation and Usage

Install this gem

    gem install msgpacker

Then you now have a executable script named `msgpacker`.

## Usage

Prepare a sample JSON file

    $ echo '{"compact": true, "schema": 0}' > DATA.json 

And then execute:

    $ cat DATA.json | msgpacker > DATA.mpac

Finally, you might also want to decode the MsgPack-ed file

    $ cat DATA.mpac | msgpacker -d -n > DATA_decoded.json

If you give the `-n` option, it prints decoded json items with newline(\n) character appended.

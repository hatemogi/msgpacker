require 'optparse'

module MsgPacker
  class App
    def run
      options = {}
      OptionParser.new do |opts|
        opts.banner = "Usage: msgpacker [options]"
        opts.on("-d", "--decode", "decode msgpack to json") do |d|
          options[:decode] = d
        end
      end.parse!
      coder = unless options[:decode]
        MsgPacker::Encoder
      else
        MsgPacker::Decoder
      end.new
      STDOUT.sync = true
      coder.code(STDIN, STDOUT)
    end
  end
end

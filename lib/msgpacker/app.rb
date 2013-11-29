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
        opts.on("-n", "--newline", "appends a newline character for each JSON item") do |n|
          options[:newline] = n
        end
      end.parse!
      coder = unless options[:decode]
        MsgPacker::Encoder
      else
        MsgPacker::Decoder
      end.new(options)
      STDOUT.sync = true
      coder.code(STDIN, STDOUT)
    end
  end
end

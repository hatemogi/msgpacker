require "yajl"
require "msgpack"

module MsgPacker
  class Decoder
    def initialize opts = {}
      @options = opts.select {|k, v| [:pretty, :indent, :newline].include? k}
    end

    def code is = STDIN, os = STDOUT
      MessagePack::Unpacker.new(is).each do |obj|
        Yajl::Encoder.encode(obj, os, @options)
        os.write "\n" if @options[:newline]
      end
    end
  end
end
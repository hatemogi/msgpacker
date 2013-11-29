require "yajl"
require "msgpack"

module MsgPacker
  class Encoder
    def initialize opts = {}
      @options = opts.dup
    end

    def object_parsed obj
      @os.write obj.to_msgpack
    end

    def code is = STDIN, os = STDOUT
      @os = os
      parser = Yajl::Parser.new
      parser.on_parse_complete = method(:object_parsed)
      is.each_char { |ch| parser << ch }
    end
  end
end

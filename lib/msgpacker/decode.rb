require "yajl"
require "msgpack"

module MsgPacker
  class Decoder
    def code is = STDIN, os = STDOUT
      u = MessagePack::Unpacker.new
      is.each_char do |ch|
        u.feed_each(ch) do |obj|
          Yajl::Encoder.encode(obj, os)
        end
      end
    end
  end
end


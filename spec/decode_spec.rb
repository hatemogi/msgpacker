require_relative 'helper'
require 'stringio'

describe MsgPacker::Decoder do
  before do
    @e = MsgPacker::Decoder.new
  end

  it "should decode an array" do
    o = StringIO.new("", "w")
    @e.code(StringIO.new("\x82\xA7compact\xC3\xA6schema\x00"), o)
    v = o.string
    v.bytes.size.must_equal 27
    v.must_equal '{"compact":true,"schema":0}'
  end
end
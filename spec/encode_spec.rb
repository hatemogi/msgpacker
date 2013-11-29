require_relative 'helper'
require 'stringio'

describe MsgPacker::Encoder do
  before do
    @e = MsgPacker::Encoder.new
  end

  it "should encode an array" do
    o = StringIO.new("", "w")
    @e.code(StringIO.new('{"compact": true, "schema": 0}'), o)
    o.string.must_equal "\x82\xA7compact\xC3\xA6schema\x00"
  end
end
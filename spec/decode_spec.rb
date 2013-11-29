require_relative 'helper'
require 'stringio'

describe MsgPacker::Decoder do
  before do
    @e = MsgPacker::Decoder.new
    @msgpacked = "\x82\xA7compact\xC3\xA6schema\x00"
  end

  it "should decode an array" do
    o = StringIO.new("", "w")
    @e.code(StringIO.new(@msgpacked), o)
    v = o.string
    v.bytes.size.must_equal 27
    v.must_equal '{"compact":true,"schema":0}'
  end

  it "shouldn't insert a newline character without the -n option" do
    o = StringIO.new("", "w") 
    @e.code(StringIO.new(@msgpacked * 2), o)
    v = o.string
    expected = '{"compact":true,"schema":0}'
    v.must_equal expected * 2
  end

  it "should insert a newline character with the -n option" do
    o = StringIO.new("", "w") 
    MsgPacker::Decoder.new(newline: true).code(StringIO.new(@msgpacked * 2), o)
    v = o.string
    expected = '{"compact":true,"schema":0}'
    v.must_equal "#{expected}\n#{expected}\n"
  end
end
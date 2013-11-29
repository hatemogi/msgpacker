require_relative 'helper'
require 'stringio'

describe MsgPacker::Decoder do
  before do
    @e = MsgPacker::Decoder.new
    @msgpacked = "\x82\xA7compact\xC3\xA6schema\x00"
    @out = StringIO.new("", "w")
  end

  it "should decode an array" do
    @e.code(StringIO.new(@msgpacked), @out)
    @out.string.must_equal '{"compact":true,"schema":0}'
  end

  it "shouldn't insert a newline character without the -n option" do
    @e.code(StringIO.new(@msgpacked * 2), @out)
    @out.string.must_equal '{"compact":true,"schema":0}' * 2
  end

  it "should insert a newline character with the -n option" do
    MsgPacker::Decoder.new(newline: true).code(StringIO.new(@msgpacked * 2), @out)
    expected = '{"compact":true,"schema":0}'
    @out.string.must_equal [expected, "\n", expected, "\n"].join
  end

  it "should prettify JSON output when the -p option is given" do
    MsgPacker::Decoder.new(pretty: true).code(StringIO.new(@msgpacked), @out)
    @out.string.must_equal %Q({\n  "compact": true,\n  "schema": 0\n})
  end

end
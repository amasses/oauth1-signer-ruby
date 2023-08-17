require 'minitest/autorun'
require 'minitest/mock'
require_relative '../lib/mastercard/oauth'

class TestGetTimeStamp < Minitest::Test

  def test_creates_UNIX_timestamp_UTC
    timestamp = Mastercard::OAuth.time_stamp
    assert_equal(timestamp > 0, true)
  end
end

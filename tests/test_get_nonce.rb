require 'minitest/autorun'
require 'minitest/mock'
require_relative '../lib/mastercard/oauth'

class TestGetNonce < Minitest::Test

  NONCE_LENGTH = 32
  VALID_CHARS = Regexp.new('^[a-zA-Z0-9_]*$').freeze

  def test_creates_UUID_with_dashes_removed

    nonce = Mastercard::OAuth.get_nonce

    assert_equal(nonce.length, NONCE_LENGTH)
    assert_equal(VALID_CHARS.match?(nonce), true)
  end
end

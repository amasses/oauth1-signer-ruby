# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/mock'
require_relative '../lib/oauth'

class TestToOAuthParamString < Minitest::Test
  def test_creates_a_correctly_encoded_and_sorted_OAuth_parameter_string
    consumer_key = 'aaa!aaa'
    OAuth.stub(:get_nonce, 'uTeLPs6K') do
      OAuth.stub(:time_stamp, '1524771555') do
        query_params = OAuth.extract_query_params 'HTTPS://SANDBOX.api.mastercard.com/merchantid/v1/merchantid?MerchantId=GOOGLE%20LTD%20ADWORDS%20%28CC%40GOOGLE.COM%29&Format=XML&Type=ExactMatch&Format=JSON'
        oauth_params = OAuth.get_oauth_params consumer_key
        param_string = OAuth.to_oauth_param_string query_params, oauth_params
        assert_equal param_string, 'Format=JSON&Format=XML&MerchantId=GOOGLE%20LTD%20ADWORDS%20%28CC%40GOOGLE.COM%29&Type=ExactMatch&oauth_body_hash=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=&oauth_consumer_key=aaa!aaa&oauth_nonce=uTeLPs6K&oauth_signature_method=RSA-SHA256&oauth_timestamp=1524771555&oauth_version=1.0'
      end
    end
  end

  def test_should_use_ascending_byte_value_ordering
    query_params = { 'b' => ['b'], 'A' => %w[a A], 'B' => ['B'], 'a' => %w[A a], '0' => ['0'] }
    oauth_params = {}
    param_string = OAuth.to_oauth_param_string query_params, oauth_params
    assert_equal '0=0&A=A&A=a&B=B&a=A&a=a&b=b', param_string

    # https://oauth.net/core/1.0a/#anchor13
    query_params = { 'a' => ['1'], 'c' => ['hi%20there'], 'f' => %w[25 50 a], 'z' => %w[p t] }
    oauth_params = {}
    param_string = OAuth.to_oauth_param_string query_params, oauth_params
    assert_equal 'a=1&c=hi%20there&f=25&f=50&f=a&z=p&z=t', param_string
  end
end

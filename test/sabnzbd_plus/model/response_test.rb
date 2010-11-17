$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..'))

require 'test/unit'
require 'lib/sabnzbd_plus/model/response'
require 'test/sabnzbd_plus/model/api/caller/test'

module SabnzbdPlusModel
  class ResponseTest < Test::Unit::TestCase
    def setup
      @fixture = SabnzbdPlusModel::ResponseTestCase.new
    end
    
    def test_parameter_mapping
      assert_equal({}, SabnzbdPlusModel::Response.parameter_mapping)
    end

    def test_equal
      @fixture.test_data = "testing"
      expecting = SabnzbdPlusModel::ResponseTestCase.new
      expecting.test_data = "testing"

      assert_equal(expecting, @fixture)
    end

    def test_from_hash
      actual = SabnzbdPlusModel::ResponseTestCase.from_hash({"test_data" => "testing"})
      expected = SabnzbdPlusModel::ResponseTestCase.new
      expected.test_data = "testing"

      assert_equal(expected, actual)
    end
  end
end

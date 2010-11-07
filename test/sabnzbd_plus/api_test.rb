$:.unshift File.join(File.dirname(__FILE__),'..','..')

require 'test/unit'
require 'lib/sabnzbd_plus/api'
require 'test/sabnzbd_plus/model/api/caller/test'

module SabnzbdPlus
  class ApiTest < Test::Unit::TestCase
    def setup
      caller   = SabnzbdPlusModelApiCaller::Test.new
      api      = SabnzbdPlusModelApi::Api.new(caller)
      mapper   = SabnzbdPlusModel::Mapper.new(api)
      @fixture = SabnzbdPlus::Api.new(mapper)
    end

    def test_current_queue
      expected = @fixture.current_queue
      actual = "current_queue"

      assert_equal(expected, actual)
    end

    def test_unannounced_added
      expected = @fixture.unannounced_added
      actual = "unannounced_added"

      assert_equal(expected, actual)
    end

    def test_unannounced_complete
      expected = @fixture.unannounced_complete
      actual = "unannounced_complete"

      assert_equal(expected, actual)
    end
  end
end

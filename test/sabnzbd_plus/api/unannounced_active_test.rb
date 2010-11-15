$:.unshift File.join(File.dirname(__FILE__),'..','..')

require 'test/unit'
require 'lib/sabnzbd_plus/api/unannounced_active'
require 'test/sabnzbd_plus/model/api/caller/test'

module SabnzbdPlusApi
  class UnannouncedActiveTest < Test::Unit::TestCase
    def setup
      @caller   = SabnzbdPlusModelApiCaller::Test.new
      @caller.fixture_name = "unannounced_active"
      api      = SabnzbdPlusModelApi::Api.new(@caller)
      mapper   = SabnzbdPlusModel::Mapper.new(api)
      @fixture = SabnzbdPlusApi::UnannouncedActive.new(mapper)
    end

    def test_unannounced_active
      actual = @fixture.process

      hash = JSON.parse("{\"status\":\"Downloading\",
         \"index\":0,
         \"eta\":\"unknown\",
         \"timeleft\":\"0:00:00\",
         \"avg_age\":\"18m\",
         \"script\":\"None\",
         \"msgid\":\"\",
         \"verbosity\":\"\",
         \"mb\":\"5075.93\",
         \"sizeleft\":\"4.96 GB\",
         \"filename\":\"Example\",
         \"priority\":\"Normal\",
         \"cat\":\"None\",
         \"mbleft\":\"5075.93\",
         \"percentage\":\"0\",
         \"nzo_id\":\"SABnzbd_nzo_gT3l7L\",
         \"unpackopts\":\"3\",
         \"size\":\"4.96 GB\"}")

      expected = [SabnzbdPlusModel::QueueSlot.from_hash(hash)]


      assert_equal(expected, actual)

      actual = @fixture.process
      assert_equal([], actual)
    end

  end
end

$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..'))

require 'test/unit'
require 'lib/sabnzbd_plus/model/stage_log'
require 'test/sabnzbd_plus/model/api/caller/test'

module SabnzbdPlusModel
  class StageLogTest < Test::Unit::TestCase
    def setup
      @fixture = SabnzbdPlusModel::StageLog.new
    end
    
    def test_initialize
      assert_equal([], @fixture.actions)
      assert_equal(nil, @fixture.name)
    end

    def test_from_hash
      input = {
        "name"    => "Test Test",
        "actions" => ["Test Test"]
      }

      expected = SabnzbdPlusModel::StageLog.new
      expected.name = "Test Test"
      expected.actions = ["Test Test"]


      assert_equal(expected, SabnzbdPlusModel::StageLog.from_hash(input))
    end

  end
end

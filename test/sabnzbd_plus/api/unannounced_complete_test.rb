$:.unshift File.join(File.dirname(__FILE__),'..','..')

require 'test/unit'
require 'lib/sabnzbd_plus/api/unannounced_complete'
require 'test/sabnzbd_plus/model/api/caller/test'

module SabnzbdPlusApi
  class UnannouncedCompleteTest < Test::Unit::TestCase
    def setup
      caller   = SabnzbdPlusModelApiCaller::Test.new
      api      = SabnzbdPlusModelApi::Api.new(caller)
      mapper   = SabnzbdPlusModel::Mapper.new(api)
      @fixture = SabnzbdPlusApi::UnannouncedComplete.new(mapper)
    end

    def test_unannounced_complete
      actual = @fixture.process
      expected = []
      expected[0] = SabnzbdPlusModel::HistorySlot.new
      expected[0].action_line = ""
      expected[0].show_details = "True"
      expected[0].script_log = ""
      expected[0].meta = nil
      expected[0].fail_message = ""
      expected[0].loaded = false
      expected[0].id = 19
      expected[0].size = "389.45 MB"
      expected[0].category = "tv"
      expected[0].pp = "D"
      expected[0].completeness = 0
      expected[0].script = ""
      expected[0].nzb_name = "Ubuntu.10.10.nzb"
      expected[0].download_time = 7284
      expected[0].storage = "/home/wab/SABnzbd+/Complete/Software/Ubuntu.10.10"
      expected[0].status = "Completed"
      expected[0].script_line = ""
      expected[0].completed = 1289106460
      expected[0].nzo_id = "SABnzbd_nzo__09l_P"
      expected[0].downloaded = 408371029
      expected[0].report = ""
      expected[0].path = "/Ubuntu.10.10"
      expected[0].post_proc_time = 0
      expected[0].name = "Ubuntu.10.10"
      expected[0].url = ""
      expected[0].bytes = 408371029
      expected[0].url_info = ""
      expected[0].stage_log[0] = SabnzbdPlusModel::StageLog.new
      expected[0].stage_log[0].name = "Download"
      expected[0].stage_log[0].actions[0] = "Downloaded in 2 hours 1 minute 24 seconds at an average of 54.75 KB/s"

      assert_equal(expected, actual)

      actual = @fixture.process
      assert_equal([], actual)
    end

  end
end

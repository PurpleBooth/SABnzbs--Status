$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..'))

require 'test/unit'
require 'lib/sabnzbd_plus/model/history'
require 'test/sabnzbd_plus/model/api/caller/test'

module SabnzbdPlusModel
  class HistoryTest < Test::Unit::TestCase
    def setup
      @fixture = SabnzbdPlusModel::History.new
    end

    def test_initialize
      assert_equal([], @fixture.slots)
    end

    def test_compare_true
      @fixture.total_size   = "Test"
      @fixture.month_size   = "Test"
      @fixture.week_size    = "Test"
      @fixture.color_scheme = "Test"

      fixture_2 = SabnzbdPlusModel::History.new
      fixture_2.total_size   = "Test"
      fixture_2.month_size   = "Test"
      fixture_2.week_size    = "Test"
      fixture_2.color_scheme = "Test"

      assert_equal(true, @fixture == fixture_2)
    end

    def test_compare_false_1
      @fixture.total_size   = "Fail"
      @fixture.month_size   = "Test"
      @fixture.week_size    = "Test"
      @fixture.color_scheme = "Test"

      fixture_2 = SabnzbdPlusModel::History.new
      fixture_2.total_size   = "Test"
      fixture_2.month_size   = "Test"
      fixture_2.week_size    = "Test"
      fixture_2.color_scheme = "Test"

      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_2
      @fixture.total_size   = "Test"
      @fixture.month_size   = "Fail"
      @fixture.week_size    = "Test"
      @fixture.color_scheme = "Test"

      fixture_2 = SabnzbdPlusModel::History.new
      fixture_2.total_size   = "Test"
      fixture_2.month_size   = "Test"
      fixture_2.week_size    = "Test"
      fixture_2.color_scheme = "Test"

      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_3
      @fixture.total_size   = "Test"
      @fixture.month_size   = "Test"
      @fixture.week_size    = "Fail"
      @fixture.color_scheme = "Test"

      fixture_2 = SabnzbdPlusModel::History.new
      fixture_2.total_size   = "Test"
      fixture_2.month_size   = "Test"
      fixture_2.week_size    = "Test"
      fixture_2.color_scheme = "Test"

      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_3
      @fixture.total_size   = "Test"
      @fixture.month_size   = "Test"
      @fixture.week_size    = "Test"
      @fixture.color_scheme = "Fail"

      fixture_2 = SabnzbdPlusModel::History.new
      fixture_2.total_size   = "Test"
      fixture_2.month_size   = "Test"
      fixture_2.week_size    = "Test"
      fixture_2.color_scheme = "Test"

      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_from_hash
      history = {
        "active_lang" => "us-en",
        "session" => "48e93e8b1aaf946f541cc5118a531f48",
        "slots" => [
          {
            "action_line" => "",
            "show_details" => "True",
            "script_log" => "",
            "meta" => nil,
            "fail_message" => "",
            "loaded" => false,
            "id" => 19,
            "size" => "389.45 MB",
            "category" => "tv",
            "pp" => "D",
            "completeness" => 0,
            "script" => "",
            "nzb_name" => "Ubuntu.10.10.nzb",
            "download_time" => 7284,
            "storage" => "/home/wab/SABnzbd+/Complete/Software/Ubuntu.10.10",
            "status" => "Completed",
            "script_line" => "",
            "completed" => 1289106460,
            "nzo_id" => "SABnzbd_nzo__09l_P",
            "downloaded" => 408371029,
            "report" => "",
            "path" => "/Ubuntu.10.10",
            "postproc_time" => 0,
            "name" => "Ubuntu.10.10",
            "url" => "",
            "bytes" => 408371029,
            "url_info" => "",
            "stage_log" => [
              {
                "name" => "Download",
                "actions" => [
                  "Downloaded in 2 hours 1 minute 24 seconds at an average of 54.75 KB/s"
                ]
              }
            ]
          }
        ]
      }

      actual = SabnzbdPlusModel::History.from_hash(history)
      history_slot = SabnzbdPlusModel::HistorySlot.new
      history_slot.action_line = ""
      history_slot.show_details = "True"
      history_slot.script_log = ""
      history_slot.meta = nil
      history_slot.fail_message = ""
      history_slot.loaded = false
      history_slot.id = 19
      history_slot.size = "389.45 MB"
      history_slot.category = "tv"
      history_slot.pp = "D"
      history_slot.completeness = 0
      history_slot.script = ""
      history_slot.nzb_name = "Ubuntu.10.10.nzb"
      history_slot.download_time = 7284
      history_slot.storage = "/home/wab/SABnzbd+/Complete/Software/Ubuntu.10.10"
      history_slot.status = "Completed"
      history_slot.script_line = ""
      history_slot.completed = 1289106460
      history_slot.nzo_id = "SABnzbd_nzo__09l_P"
      history_slot.downloaded = 408371029
      history_slot.report = ""
      history_slot.path = "/Ubuntu.10.10"
      history_slot.post_proc_time = 0
      history_slot.name = "Ubuntu.10.10"
      history_slot.url = ""
      history_slot.bytes = 408371029
      history_slot.url_info = ""
      history_slot.stage_log= []
      history_slot.stage_log[0] = StageLog.new
      history_slot.stage_log[0].actions = ["Downloaded in 2 hours 1 minute 24 seconds at an average of 54.75 KB/s"]
      history_slot.stage_log[0].name = "Download"

      expected = SabnzbdPlusModel::History.new
      expected.active_lang   = "us-en"
      expected.session   = "48e93e8b1aaf946f541cc5118a531f48"
      

      expected.slots = [history_slot]

      assert_equal(expected, actual)
    end
  end
end

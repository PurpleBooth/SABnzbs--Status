$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..'))

require 'test/unit'
require 'lib/sabnzbd_plus/model/history_slot'
require 'test/sabnzbd_plus/model/api/caller/test'

module SabnzbdPlusModel
  class HistorySlotTest < Test::Unit::TestCase
    def setup
      @fixture = SabnzbdPlusModel::HistorySlot.new
    end

    def test_initialize
      assert_equal([], @fixture.stage_log)
    end

    def test_compare_true
      @fixture.action_line    = "Test"
      @fixture.show_details   = "Test"
      @fixture.script_log     = "Test"
      @fixture.meta           = "Test"
      @fixture.loaded         = "Test"
      @fixture.id             = "Test"
      @fixture.category       = "Test"
      @fixture.filename       = "Test"
      @fixture.pp             = "Test"
      @fixture.completeness   = "Test"
      @fixture.fail_message   = "Test"
      @fixture.nzb_name       = "Test"
      @fixture.download_time  = "Test"
      @fixture.script_line    = "Test"
      @fixture.completed      = "Test"
      @fixture.downloaded     = "Test"
      @fixture.report         = "Test"
      @fixture.path           = "Test"
      @fixture.stage_log      = "Test"
      @fixture.post_proc_time = "Test"
      @fixture.name           = "Test"
      @fixture.url            = "Test"
      @fixture.bytes          = "Test"
      @fixture.url_info       = "Test"
      @fixture.storage        = "Test"

      fixture_2 = SabnzbdPlusModel::HistorySlot.new
      fixture_2.action_line    = "Test"
      fixture_2.show_details   = "Test"
      fixture_2.script_log     = "Test"
      fixture_2.meta           = "Test"
      fixture_2.loaded         = "Test"
      fixture_2.id             = "Test"
      fixture_2.category       = "Test"
      fixture_2.filename       = "Test"
      fixture_2.pp             = "Test"
      fixture_2.completeness   = "Test"
      fixture_2.fail_message   = "Test"
      fixture_2.nzb_name       = "Test"
      fixture_2.download_time  = "Test"
      fixture_2.script_line    = "Test"
      fixture_2.completed      = "Test"
      fixture_2.downloaded     = "Test"
      fixture_2.report         = "Test"
      fixture_2.path           = "Test"
      fixture_2.stage_log      = "Test"
      fixture_2.post_proc_time = "Test"
      fixture_2.name           = "Test"
      fixture_2.url            = "Test"
      fixture_2.bytes          = "Test"
      fixture_2.url_info       = "Test"
      fixture_2.storage        = "Test"

      assert_equal(true, @fixture == fixture_2)
      assert_equal(true, @fixture.eql?(fixture_2))
    end

    def test_compare_false_1
      @fixture.action_line    = "Test"
      @fixture.show_details   = "Test"
      @fixture.script_log     = "Test"
      @fixture.meta           = "Test"
      @fixture.loaded         = "Test"
      @fixture.id             = "Test"
      @fixture.category       = "Test"
      @fixture.filename       = "Test"
      @fixture.pp             = "Test"
      @fixture.completeness   = "Test"
      @fixture.fail_message   = "Test"
      @fixture.nzb_name       = "Test"
      @fixture.download_time  = "Test"
      @fixture.script_line    = "Test"
      @fixture.completed      = "Test"
      @fixture.downloaded     = "Test"
      @fixture.report         = "Test"
      @fixture.path           = "Test"
      @fixture.stage_log      = "Test"
      @fixture.post_proc_time = "Test"
      @fixture.name           = "Test"
      @fixture.url            = "Test"
      @fixture.bytes          = "Test"
      @fixture.url_info       = "Test"
      @fixture.storage        = "Test"

      fixture_2 = SabnzbdPlusModel::HistorySlot.new
      fixture_2.action_line    = "Fail"
      fixture_2.show_details   = "Test"
      fixture_2.script_log     = "Test"
      fixture_2.meta           = "Test"
      fixture_2.loaded         = "Test"
      fixture_2.id             = "Test"
      fixture_2.category       = "Test"
      fixture_2.filename       = "Test"
      fixture_2.pp             = "Test"
      fixture_2.completeness   = "Test"
      fixture_2.fail_message   = "Test"
      fixture_2.nzb_name       = "Test"
      fixture_2.download_time  = "Test"
      fixture_2.script_line    = "Test"
      fixture_2.completed      = "Test"
      fixture_2.downloaded     = "Test"
      fixture_2.report         = "Test"
      fixture_2.path           = "Test"
      fixture_2.stage_log      = "Test"
      fixture_2.post_proc_time = "Test"
      fixture_2.name           = "Test"
      fixture_2.url            = "Test"
      fixture_2.bytes          = "Test"
      fixture_2.url_info       = "Test"
      fixture_2.storage        = "Test"

      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_2
      @fixture.action_line    = "Test"
      @fixture.show_details   = "Test"
      @fixture.script_log     = "Test"
      @fixture.meta           = "Test"
      @fixture.loaded         = "Test"
      @fixture.id             = "Test"
      @fixture.category       = "Test"
      @fixture.filename       = "Test"
      @fixture.pp             = "Test"
      @fixture.completeness   = "Test"
      @fixture.fail_message   = "Test"
      @fixture.nzb_name       = "Test"
      @fixture.download_time  = "Test"
      @fixture.script_line    = "Test"
      @fixture.completed      = "Test"
      @fixture.downloaded     = "Test"
      @fixture.report         = "Test"
      @fixture.path           = "Test"
      @fixture.stage_log      = "Test"
      @fixture.post_proc_time = "Test"
      @fixture.name           = "Test"
      @fixture.url            = "Test"
      @fixture.bytes          = "Test"
      @fixture.url_info       = "Test"
      @fixture.storage        = "Test"

      fixture_2 = SabnzbdPlusModel::HistorySlot.new
      fixture_2.action_line    = "Test"
      fixture_2.show_details   = "Fail"
      fixture_2.script_log     = "Test"
      fixture_2.meta           = "Test"
      fixture_2.loaded         = "Test"
      fixture_2.id             = "Test"
      fixture_2.category       = "Test"
      fixture_2.filename       = "Test"
      fixture_2.pp             = "Test"
      fixture_2.completeness   = "Test"
      fixture_2.fail_message   = "Test"
      fixture_2.nzb_name       = "Test"
      fixture_2.download_time  = "Test"
      fixture_2.script_line    = "Test"
      fixture_2.completed      = "Test"
      fixture_2.downloaded     = "Test"
      fixture_2.report         = "Test"
      fixture_2.path           = "Test"
      fixture_2.stage_log      = "Test"
      fixture_2.post_proc_time = "Test"
      fixture_2.name           = "Test"
      fixture_2.url            = "Test"
      fixture_2.bytes          = "Test"
      fixture_2.url_info       = "Test"
      fixture_2.storage        = "Test"

      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_3
      @fixture.action_line    = "Test"
      @fixture.show_details   = "Test"
      @fixture.script_log     = "Fail"
      @fixture.meta           = "Test"
      @fixture.loaded         = "Test"
      @fixture.id             = "Test"
      @fixture.category       = "Test"
      @fixture.filename       = "Test"
      @fixture.pp             = "Test"
      @fixture.completeness   = "Test"
      @fixture.fail_message   = "Test"
      @fixture.nzb_name       = "Test"
      @fixture.download_time  = "Test"
      @fixture.script_line    = "Test"
      @fixture.completed      = "Test"
      @fixture.downloaded     = "Test"
      @fixture.report         = "Test"
      @fixture.path           = "Test"
      @fixture.stage_log      = "Test"
      @fixture.post_proc_time = "Test"
      @fixture.name           = "Test"
      @fixture.url            = "Test"
      @fixture.bytes          = "Test"
      @fixture.url_info       = "Test"
      @fixture.storage        = "Test"

      fixture_2 = SabnzbdPlusModel::HistorySlot.new
      fixture_2.action_line    = "Test"
      fixture_2.show_details   = "Test"
      fixture_2.script_log     = "Test"
      fixture_2.meta           = "Test"
      fixture_2.loaded         = "Test"
      fixture_2.id             = "Test"
      fixture_2.category       = "Test"
      fixture_2.filename       = "Test"
      fixture_2.pp             = "Test"
      fixture_2.completeness   = "Test"
      fixture_2.fail_message   = "Test"
      fixture_2.nzb_name       = "Test"
      fixture_2.download_time  = "Test"
      fixture_2.script_line    = "Test"
      fixture_2.completed      = "Test"
      fixture_2.downloaded     = "Test"
      fixture_2.report         = "Test"
      fixture_2.path           = "Test"
      fixture_2.stage_log      = "Test"
      fixture_2.post_proc_time = "Test"
      fixture_2.name           = "Test"
      fixture_2.url            = "Test"
      fixture_2.bytes          = "Test"
      fixture_2.url_info       = "Test"
      fixture_2.storage        = "Test"

      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_4
      @fixture.action_line    = "Test"
      @fixture.show_details   = "Test"
      @fixture.script_log     = "Test"
      @fixture.meta           = "Fail"
      @fixture.loaded         = "Test"
      @fixture.id             = "Test"
      @fixture.category       = "Test"
      @fixture.filename       = "Test"
      @fixture.pp             = "Test"
      @fixture.completeness   = "Test"
      @fixture.fail_message   = "Test"
      @fixture.nzb_name       = "Test"
      @fixture.download_time  = "Test"
      @fixture.script_line    = "Test"
      @fixture.completed      = "Test"
      @fixture.downloaded     = "Test"
      @fixture.report         = "Test"
      @fixture.path           = "Test"
      @fixture.stage_log      = "Test"
      @fixture.post_proc_time = "Test"
      @fixture.name           = "Test"
      @fixture.url            = "Test"
      @fixture.bytes          = "Test"
      @fixture.url_info       = "Test"
      @fixture.storage        = "Test"

      fixture_2 = SabnzbdPlusModel::HistorySlot.new
      fixture_2.action_line    = "Test"
      fixture_2.show_details   = "Test"
      fixture_2.script_log     = "Test"
      fixture_2.meta           = "Test"
      fixture_2.loaded         = "Test"
      fixture_2.id             = "Test"
      fixture_2.category       = "Test"
      fixture_2.filename       = "Test"
      fixture_2.pp             = "Test"
      fixture_2.completeness   = "Test"
      fixture_2.fail_message   = "Test"
      fixture_2.nzb_name       = "Test"
      fixture_2.download_time  = "Test"
      fixture_2.script_line    = "Test"
      fixture_2.completed      = "Test"
      fixture_2.downloaded     = "Test"
      fixture_2.report         = "Test"
      fixture_2.path           = "Test"
      fixture_2.stage_log      = "Test"
      fixture_2.post_proc_time = "Test"
      fixture_2.name           = "Test"
      fixture_2.url            = "Test"
      fixture_2.bytes          = "Test"
      fixture_2.url_info       = "Test"
      fixture_2.storage        = "Test"

      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_5
      @fixture.action_line    = "Test"
      @fixture.show_details   = "Test"
      @fixture.script_log     = "Test"
      @fixture.meta           = "Test"
      @fixture.loaded         = "False"
      @fixture.id             = "Test"
      @fixture.category       = "Test"
      @fixture.filename       = "Test"
      @fixture.pp             = "Test"
      @fixture.completeness   = "Test"
      @fixture.fail_message   = "Test"
      @fixture.nzb_name       = "Test"
      @fixture.download_time  = "Test"
      @fixture.script_line    = "Test"
      @fixture.completed      = "Test"
      @fixture.downloaded     = "Test"
      @fixture.report         = "Test"
      @fixture.path           = "Test"
      @fixture.stage_log      = "Test"
      @fixture.post_proc_time = "Test"
      @fixture.name           = "Test"
      @fixture.url            = "Test"
      @fixture.bytes          = "Test"
      @fixture.url_info       = "Test"
      @fixture.storage        = "Test"

      fixture_2 = SabnzbdPlusModel::HistorySlot.new
      fixture_2.action_line    = "Test"
      fixture_2.show_details   = "Test"
      fixture_2.script_log     = "Test"
      fixture_2.meta           = "Test"
      fixture_2.loaded         = "Test"
      fixture_2.id             = "Test"
      fixture_2.category       = "Test"
      fixture_2.filename       = "Test"
      fixture_2.pp             = "Test"
      fixture_2.completeness   = "Test"
      fixture_2.fail_message   = "Test"
      fixture_2.nzb_name       = "Test"
      fixture_2.download_time  = "Test"
      fixture_2.script_line    = "Test"
      fixture_2.completed      = "Test"
      fixture_2.downloaded     = "Test"
      fixture_2.report         = "Test"
      fixture_2.path           = "Test"
      fixture_2.stage_log      = "Test"
      fixture_2.post_proc_time = "Test"
      fixture_2.name           = "Test"
      fixture_2.url            = "Test"
      fixture_2.bytes          = "Test"
      fixture_2.url_info       = "Test"
      fixture_2.storage        = "Test"

      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_6
      @fixture.action_line    = "Test"
      @fixture.show_details   = "Test"
      @fixture.script_log     = "Test"
      @fixture.meta           = "Test"
      @fixture.loaded         = "Test"
      @fixture.id             = "False"
      @fixture.category       = "Test"
      @fixture.filename       = "Test"
      @fixture.pp             = "Test"
      @fixture.completeness   = "Test"
      @fixture.fail_message   = "Test"
      @fixture.nzb_name       = "Test"
      @fixture.download_time  = "Test"
      @fixture.script_line    = "Test"
      @fixture.completed      = "Test"
      @fixture.downloaded     = "Test"
      @fixture.report         = "Test"
      @fixture.path           = "Test"
      @fixture.stage_log      = "Test"
      @fixture.post_proc_time = "Test"
      @fixture.name           = "Test"
      @fixture.url            = "Test"
      @fixture.bytes          = "Test"
      @fixture.url_info       = "Test"
      @fixture.storage        = "Test"

      fixture_2 = SabnzbdPlusModel::HistorySlot.new
      fixture_2.action_line    = "Test"
      fixture_2.show_details   = "Test"
      fixture_2.script_log     = "Test"
      fixture_2.meta           = "Test"
      fixture_2.loaded         = "Test"
      fixture_2.id             = "Test"
      fixture_2.category       = "Test"
      fixture_2.filename       = "Test"
      fixture_2.pp             = "Test"
      fixture_2.completeness   = "Test"
      fixture_2.fail_message   = "Test"
      fixture_2.nzb_name       = "Test"
      fixture_2.download_time  = "Test"
      fixture_2.script_line    = "Test"
      fixture_2.completed      = "Test"
      fixture_2.downloaded     = "Test"
      fixture_2.report         = "Test"
      fixture_2.path           = "Test"
      fixture_2.stage_log      = "Test"
      fixture_2.post_proc_time = "Test"
      fixture_2.name           = "Test"
      fixture_2.url            = "Test"
      fixture_2.bytes          = "Test"
      fixture_2.url_info       = "Test"
      fixture_2.storage        = "Test"

      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_7
      @fixture.action_line    = "Test"
      @fixture.show_details   = "Test"
      @fixture.script_log     = "Test"
      @fixture.meta           = "Test"
      @fixture.loaded         = "Test"
      @fixture.id             = "Test"
      @fixture.category       = "False"
      @fixture.filename       = "Test"
      @fixture.pp             = "Test"
      @fixture.completeness   = "Test"
      @fixture.fail_message   = "Test"
      @fixture.nzb_name       = "Test"
      @fixture.download_time  = "Test"
      @fixture.script_line    = "Test"
      @fixture.completed      = "Test"
      @fixture.downloaded     = "Test"
      @fixture.report         = "Test"
      @fixture.path           = "Test"
      @fixture.stage_log      = "Test"
      @fixture.post_proc_time = "Test"
      @fixture.name           = "Test"
      @fixture.url            = "Test"
      @fixture.bytes          = "Test"
      @fixture.url_info       = "Test"
      @fixture.storage        = "Test"

      fixture_2 = SabnzbdPlusModel::HistorySlot.new
      fixture_2.action_line    = "Test"
      fixture_2.show_details   = "Test"
      fixture_2.script_log     = "Test"
      fixture_2.meta           = "Test"
      fixture_2.loaded         = "Test"
      fixture_2.id             = "Test"
      fixture_2.category       = "Test"
      fixture_2.filename       = "Test"
      fixture_2.pp             = "Test"
      fixture_2.completeness   = "Test"
      fixture_2.fail_message   = "Test"
      fixture_2.nzb_name       = "Test"
      fixture_2.download_time  = "Test"
      fixture_2.script_line    = "Test"
      fixture_2.completed      = "Test"
      fixture_2.downloaded     = "Test"
      fixture_2.report         = "Test"
      fixture_2.path           = "Test"
      fixture_2.stage_log      = "Test"
      fixture_2.post_proc_time = "Test"
      fixture_2.name           = "Test"
      fixture_2.url            = "Test"
      fixture_2.bytes          = "Test"
      fixture_2.url_info       = "Test"
      fixture_2.storage        = "Test"

      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_8
      @fixture.action_line    = "Test"
      @fixture.show_details   = "Test"
      @fixture.script_log     = "Test"
      @fixture.meta           = "Test"
      @fixture.loaded         = "Test"
      @fixture.id             = "Test"
      @fixture.category       = "Test"
      @fixture.filename       = "False"
      @fixture.pp             = "Test"
      @fixture.completeness   = "Test"
      @fixture.fail_message   = "Test"
      @fixture.nzb_name       = "Test"
      @fixture.download_time  = "Test"
      @fixture.script_line    = "Test"
      @fixture.completed      = "Test"
      @fixture.downloaded     = "Test"
      @fixture.report         = "Test"
      @fixture.path           = "Test"
      @fixture.stage_log      = "Test"
      @fixture.post_proc_time = "Test"
      @fixture.name           = "Test"
      @fixture.url            = "Test"
      @fixture.bytes          = "Test"
      @fixture.url_info       = "Test"
      @fixture.storage        = "Test"

      fixture_2 = SabnzbdPlusModel::HistorySlot.new
      fixture_2.action_line    = "Test"
      fixture_2.show_details   = "Test"
      fixture_2.script_log     = "Test"
      fixture_2.meta           = "Test"
      fixture_2.loaded         = "Test"
      fixture_2.id             = "Test"
      fixture_2.category       = "Test"
      fixture_2.filename       = "Test"
      fixture_2.pp             = "Test"
      fixture_2.completeness   = "Test"
      fixture_2.fail_message   = "Test"
      fixture_2.nzb_name       = "Test"
      fixture_2.download_time  = "Test"
      fixture_2.script_line    = "Test"
      fixture_2.completed      = "Test"
      fixture_2.downloaded     = "Test"
      fixture_2.report         = "Test"
      fixture_2.path           = "Test"
      fixture_2.stage_log      = "Test"
      fixture_2.post_proc_time = "Test"
      fixture_2.name           = "Test"
      fixture_2.url            = "Test"
      fixture_2.bytes          = "Test"
      fixture_2.url_info       = "Test"
      fixture_2.storage        = "Test"

      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_9
      @fixture.action_line    = "Test"
      @fixture.show_details   = "Test"
      @fixture.script_log     = "Test"
      @fixture.meta           = "Test"
      @fixture.loaded         = "Test"
      @fixture.id             = "Test"
      @fixture.category       = "Test"
      @fixture.filename       = "Test"
      @fixture.pp             = "Fail"
      @fixture.completeness   = "Test"
      @fixture.fail_message   = "Test"
      @fixture.nzb_name       = "Test"
      @fixture.download_time  = "Test"
      @fixture.script_line    = "Test"
      @fixture.completed      = "Test"
      @fixture.downloaded     = "Test"
      @fixture.report         = "Test"
      @fixture.path           = "Test"
      @fixture.stage_log      = "Test"
      @fixture.post_proc_time = "Test"
      @fixture.name           = "Test"
      @fixture.url            = "Test"
      @fixture.bytes          = "Test"
      @fixture.url_info       = "Test"
      @fixture.storage        = "Test"

      fixture_2 = SabnzbdPlusModel::HistorySlot.new
      fixture_2.action_line    = "Test"
      fixture_2.show_details   = "Test"
      fixture_2.script_log     = "Test"
      fixture_2.meta           = "Test"
      fixture_2.loaded         = "Test"
      fixture_2.id             = "Test"
      fixture_2.category       = "Test"
      fixture_2.filename       = "Test"
      fixture_2.pp             = "Test"
      fixture_2.completeness   = "Test"
      fixture_2.fail_message   = "Test"
      fixture_2.nzb_name       = "Test"
      fixture_2.download_time  = "Test"
      fixture_2.script_line    = "Test"
      fixture_2.completed      = "Test"
      fixture_2.downloaded     = "Test"
      fixture_2.report         = "Test"
      fixture_2.path           = "Test"
      fixture_2.stage_log      = "Test"
      fixture_2.post_proc_time = "Test"
      fixture_2.name           = "Test"
      fixture_2.url            = "Test"
      fixture_2.bytes          = "Test"
      fixture_2.url_info       = "Test"
      fixture_2.storage        = "Test"

      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_from_hash
      history = {
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

      actual = SabnzbdPlusModel::HistorySlot.from_hash(history)
      expected = SabnzbdPlusModel::HistorySlot.new
      expected.action_line = ""
      expected.show_details = "True"
      expected.script_log = ""
      expected.meta = nil
      expected.fail_message = ""
      expected.loaded = false
      expected.id = 19
      expected.size = "389.45 MB"
      expected.category = "tv"
      expected.pp = "D"
      expected.completeness = 0
      expected.script = ""
      expected.nzb_name = "Ubuntu.10.10.nzb"
      expected.download_time = 7284
      expected.storage = "/home/wab/SABnzbd+/Complete/Software/Ubuntu.10.10"
      expected.status = "Completed"
      expected.script_line = ""
      expected.completed = 1289106460
      expected.nzo_id = "SABnzbd_nzo__09l_P"
      expected.downloaded = 408371029
      expected.report = ""
      expected.path = "/Ubuntu.10.10"
      expected.post_proc_time = 0
      expected.name = "Ubuntu.10.10"
      expected.url = ""
      expected.bytes = 408371029
      expected.url_info = ""
      expected.stage_log= []
      expected.stage_log[0] = StageLog.new
      expected.stage_log[0].actions = ["Downloaded in 2 hours 1 minute 24 seconds at an average of 54.75 KB/s"]
      expected.stage_log[0].name = "Download"

      assert_equal(expected, actual)
    end
  end
end

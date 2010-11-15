$:.unshift File.join(File.dirname(__FILE__),'..','..')

require 'test/unit'
require 'lib/sabnzbd_plus/api'
require 'lib/sabnzbd_plus/model/stage_log'
require 'lib/sabnzbd_plus/model/queue_slot'
require 'lib/sabnzbd_plus/model/history_slot'
require 'lib/sabnzbd_plus/model/slot'
require 'test/sabnzbd_plus/model/api/caller/test'
require 'json'

module SabnzbdPlus
  class ApiTest < Test::Unit::TestCase
    def setup
      @caller   = SabnzbdPlusModelApiCaller::Test.new
      api      = SabnzbdPlusModelApi::Api.new(@caller)
      mapper   = SabnzbdPlusModel::Mapper.new(api)
      @fixture = SabnzbdPlus::Api.new(mapper)
    end

    def test_current_queue
      @caller.fixture_name = "queue_empty"

      actual = @fixture.current_queue
      
      expected = SabnzbdPlusModel::Queue.new
      expected.cache_limit        = nil
      expected.active_lang        = "us-en"
      expected.session            = "48e93e8b1aaf946f541cc5118a531f48"
      expected.slots              = []
      expected.speed              = "0 "
      expected.size               = "0B"
      expected.limit              = 0
      expected.start              = 0
      expected.disk_space_total_2 = "140.49"
      expected.darwin             = false
      expected.last_warning       = "2010-11-07 14:55:07,829\nWARNING\nYou have no credit on your Newzbin account"
      expected.have_warnings      = "5"
      expected.no_of_slots        = 0
      expected.pause_int          = "0"
      expected.categories         = [
        "None",
        "anime",
        "apps",
        "books",
        "consoles",
        "emulation",
        "games",
        "misc",
        "movies",
        "music",
        "pda",
        "resources",
        "tv",
        "unknown"
      ]
      expected.disk_space_total_1 = "140.49"
      expected.mb                 = "0.00"
      expected.newzbin_details    = true
      expected.load_avg           = "0.63, 0.56, 0.57"
      expected.cache_max          = "0"
      expected.speed_limit        = "25"
      expected.web_dir            = "/usr/share/sabnzbdplus/interfaces/smpl/templates"
      expected.paused             = false
      expected.is_verbose         = false
      expected.restart_req        = false
      expected.power_options      = true
      expected.help_uri           = "http://wiki.sabnzbd.org/"
      expected.uptime             = "36m"
      expected.refresh_rate       = "30"
      expected.version            = "0.5.5RC2"
      expected.color_scheme       = "white.css"
      expected.new_release        = ""
      expected.nt                 = false
      expected.status             = "Idle"
      expected.finish             = 0
      expected.cache_art          = "0"
      expected.paused_all         = false
      expected.finish_action      = nil
      expected.size_left          = "0B"
      expected.cache_size         = "0B"
      expected.mb_left            = "0.00"
      expected.disk_space_2       = "111.26"
      expected.disk_space_1       = "111.26"
      expected.scripts            = []
      expected.time_left          = "0:00:00"
      expected.nzb_quota          = ""
      expected.eta                = "unknown"
      expected.kb_per_sec         = "0.00"
      expected.new_rel_url        = ""
      expected.queue_details      = "0"

      assert_equal(actual, expected)
    end

    def test_unannounced_added
      @caller.fixture_name = "unannounced_added"
      actual = @fixture.unannounced_added
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
      
      actual = @fixture.unannounced_added
      assert_equal([], actual)
    end

    def test_unannounced_complete
      @caller.fixture_name = "unannounced_complete"
      actual = @fixture.unannounced_complete

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

      actual = @fixture.unannounced_complete
      assert_equal([], actual)
    end

    def test_unannounced_active
      @caller.fixture_name = "unannounced_active"
      actual = @fixture.unannounced_active

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

      actual = @fixture.unannounced_active
      assert_equal([], actual)
    end
  end
end

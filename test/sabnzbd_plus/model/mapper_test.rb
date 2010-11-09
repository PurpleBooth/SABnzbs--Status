$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..'))

require 'test/unit'
require 'test/sabnzbd_plus/model/api/caller/test'
require 'lib/sabnzbd_plus/model/api/api'
require 'lib/sabnzbd_plus/model/queue'
require 'lib/sabnzbd_plus/model/history'
require 'lib/sabnzbd_plus/model/mapper'

module SabnzbdPlusModelTest
  class Mapper < Test::Unit::TestCase

    def setup
      @caller = SabnzbdPlusModelApiCaller::Test.new
      api = SabnzbdPlusModelApi::Api.new(@caller)
      @fixture = SabnzbdPlusModel::Mapper.new(api)
    end

    def test_current_queue
      queue = {
        "active_lang" => "us-en",
        "session" => "48e93e8b1aaf946f541cc5118a531f48",
        "slots" => [],
        "speed" => "0 ",
        "size" => "0B",
        "limit" => 0,
        "start" => 0,
        "diskspacetotal2" => "140.49",
        "darwin" => false,
        "last_warning" => "2010-11-07 14:55:07,829\nWARNING\nYou have no credit on your Newzbin account",
        "have_warnings" => "5",
        "noofslots" => 0,
        "pause_int" => "0",
        "categories" => [
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
          "unknown"],
        "diskspacetotal1" => "140.49",
        "mb" => "0.00",
        "newzbinDetails" => true,
        "loadavg" => "0.63, 0.56, 0.57",
        "cache_max" => "0",
        "speedlimit" => "25",
        "webdir" => "/usr/share/sabnzbdplus/interfaces/smpl/templates",
        "paused" => false,
        "isverbose" => false,
        "restart_req" => false,
        "power_options" => true,
        "helpuri" => "http://wiki.sabnzbd.org/",
        "uptime" => "36m",
        "refresh_rate" => "30",
        "version" => "0.5.5RC2",
        "color_scheme" => "white.css",
        "new_release" => "",
        "nt" => false,
        "status" => "Idle",
        "finish" => 0,
        "cache_art" => "0",
        "paused_all" => false,
        "finishaction" => nil,
        "sizeleft" => "0B",
        "cache_size" => "0B",
        "mbleft" => "0.00",
        "diskspace2" => "111.26",
        "diskspace1" => "111.26",
        "scripts" => [],
        "timeleft" => "0:00:00",
        "nzb_quota" => "",
        "eta" => "unknown",
        "kbpersec" => "0.00",
        "new_rel_url" => "",
        "queue_details" => "0"
      }

      @caller.fixture_name = "queue_empty"
      actual = @fixture.current_queue
      expected = SabnzbdPlusModel::Queue.from_hash(queue)

      assert_equal(expected, actual)
    end

    def test_history
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

      @caller.fixture_name = "ubuntu"

      actual = @fixture.history
      expected = SabnzbdPlusModel::History.from_hash(history)

      assert_equal(expected, actual)
    end
  end
end

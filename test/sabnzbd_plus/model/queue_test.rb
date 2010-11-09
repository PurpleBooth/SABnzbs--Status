$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..'))

require 'test/unit'
require 'lib/sabnzbd_plus/model/queue'
require 'test/sabnzbd_plus/model/api/caller/test'

module SabnzbdPlusModel
  class QueueTest < Test::Unit::TestCase
    def setup
      @fixture = SabnzbdPlusModel::Queue.new
    end

    def test_initialize
      assert_equal([], @fixture.slots)
    end
    
    def test_compare_true
      @fixture.categories      = "Test"
      @fixture.scripts         = "Test"
      @fixture.slots           = "Test"
      @fixture.refresh_rate    = "Test"
      @fixture.is_verbose      = "Test"
      @fixture.start           = "Test"
      @fixture.status          = "Test"
      @fixture.finish          = "Test"
      @fixture.newzbin_details = "Test"
      @fixture.limit           = "Test"
      @fixture.queue_details   = "Test"

      fixture_2 = SabnzbdPlusModel::Queue.new
      fixture_2.categories      = "Test"
      fixture_2.scripts         = "Test"
      fixture_2.slots           = "Test"
      fixture_2.refresh_rate    = "Test"
      fixture_2.is_verbose      = "Test"
      fixture_2.start           = "Test"
      fixture_2.status          = "Test"
      fixture_2.finish          = "Test"
      fixture_2.newzbin_details = "Test"
      fixture_2.limit           = "Test"
      fixture_2.queue_details   = "Test"

      assert_equal(true, @fixture == fixture_2)
    end

    def test_compare_false_1
      @fixture.categories      = "False"
      @fixture.scripts         = "Test"
      @fixture.slots           = "Test"
      @fixture.refresh_rate    = "Test"
      @fixture.is_verbose      = "Test"
      @fixture.start           = "Test"
      @fixture.status          = "Test"
      @fixture.finish          = "Test"
      @fixture.newzbin_details = "Test"
      @fixture.limit           = "Test"
      @fixture.queue_details   = "Test"

      fixture_2 = SabnzbdPlusModel::Queue.new
      fixture_2.categories      = "Test"
      fixture_2.scripts         = "Test"
      fixture_2.slots           = "Test"
      fixture_2.refresh_rate    = "Test"
      fixture_2.is_verbose      = "Test"
      fixture_2.start           = "Test"
      fixture_2.status          = "Test"
      fixture_2.finish          = "Test"
      fixture_2.newzbin_details = "Test"
      fixture_2.limit           = "Test"
      fixture_2.queue_details   = "Test"

      assert_equal(false, @fixture == fixture_2)
    end

    def test_compare_false_2
      @fixture.categories      = "Test"
      @fixture.scripts         = "False"
      @fixture.slots           = "Test"
      @fixture.refresh_rate    = "Test"
      @fixture.is_verbose      = "Test"
      @fixture.start           = "Test"
      @fixture.status          = "Test"
      @fixture.finish          = "Test"
      @fixture.newzbin_details = "Test"
      @fixture.limit           = "Test"
      @fixture.queue_details   = "Test"

      fixture_2 = SabnzbdPlusModel::Queue.new
      fixture_2.categories      = "Test"
      fixture_2.scripts         = "Test"
      fixture_2.slots           = "Test"
      fixture_2.refresh_rate    = "Test"
      fixture_2.is_verbose      = "Test"
      fixture_2.start           = "Test"
      fixture_2.status          = "Test"
      fixture_2.finish          = "Test"
      fixture_2.newzbin_details = "Test"
      fixture_2.limit           = "Test"
      fixture_2.queue_details   = "Test"

      assert_equal(false, @fixture == fixture_2)
    end

    def test_compare_false_3
      @fixture.categories      = "Test"
      @fixture.scripts         = "Test"
      @fixture.slots           = "False"
      @fixture.refresh_rate    = "Test"
      @fixture.is_verbose      = "Test"
      @fixture.start           = "Test"
      @fixture.status          = "Test"
      @fixture.finish          = "Test"
      @fixture.newzbin_details = "Test"
      @fixture.limit           = "Test"
      @fixture.queue_details   = "Test"

      fixture_2 = SabnzbdPlusModel::Queue.new
      fixture_2.categories      = "Test"
      fixture_2.scripts         = "Test"
      fixture_2.slots           = "Test"
      fixture_2.refresh_rate    = "Test"
      fixture_2.is_verbose      = "Test"
      fixture_2.start           = "Test"
      fixture_2.status          = "Test"
      fixture_2.finish          = "Test"
      fixture_2.newzbin_details = "Test"
      fixture_2.limit           = "Test"
      fixture_2.queue_details   = "Test"

      assert_equal(false, @fixture == fixture_2)
    end

    def test_compare_false_4
      @fixture.categories      = "Test"
      @fixture.scripts         = "Test"
      @fixture.slots           = "Test"
      @fixture.refresh_rate    = "False"
      @fixture.is_verbose      = "Test"
      @fixture.start           = "Test"
      @fixture.status          = "Test"
      @fixture.finish          = "Test"
      @fixture.newzbin_details = "Test"
      @fixture.limit           = "Test"
      @fixture.queue_details   = "Test"

      fixture_2 = SabnzbdPlusModel::Queue.new
      fixture_2.categories      = "Test"
      fixture_2.scripts         = "Test"
      fixture_2.slots           = "Test"
      fixture_2.refresh_rate    = "Test"
      fixture_2.is_verbose      = "Test"
      fixture_2.start           = "Test"
      fixture_2.status          = "Test"
      fixture_2.finish          = "Test"
      fixture_2.newzbin_details = "Test"
      fixture_2.limit           = "Test"
      fixture_2.queue_details   = "Test"

      assert_equal(false, @fixture == fixture_2)
    end

    def test_compare_false_5
      @fixture.categories      = "Test"
      @fixture.scripts         = "Test"
      @fixture.slots           = "Test"
      @fixture.refresh_rate    = "Test"
      @fixture.is_verbose      = "False"
      @fixture.start           = "Test"
      @fixture.status          = "Test"
      @fixture.finish          = "Test"
      @fixture.newzbin_details = "Test"
      @fixture.limit           = "Test"
      @fixture.queue_details   = "Test"

      fixture_2 = SabnzbdPlusModel::Queue.new
      fixture_2.categories      = "Test"
      fixture_2.scripts         = "Test"
      fixture_2.slots           = "Test"
      fixture_2.refresh_rate    = "Test"
      fixture_2.is_verbose      = "Test"
      fixture_2.start           = "Test"
      fixture_2.status          = "Test"
      fixture_2.finish          = "Test"
      fixture_2.newzbin_details = "Test"
      fixture_2.limit           = "Test"
      fixture_2.queue_details   = "Test"

      assert_equal(false, @fixture == fixture_2)
    end

    def test_compare_false_6
      @fixture.categories      = "Test"
      @fixture.scripts         = "Test"
      @fixture.slots           = "Test"
      @fixture.refresh_rate    = "Test"
      @fixture.is_verbose      = "Test"
      @fixture.start           = "False"
      @fixture.status          = "Test"
      @fixture.finish          = "Test"
      @fixture.newzbin_details = "Test"
      @fixture.limit           = "Test"
      @fixture.queue_details   = "Test"

      fixture_2 = SabnzbdPlusModel::Queue.new
      fixture_2.categories      = "Test"
      fixture_2.scripts         = "Test"
      fixture_2.slots           = "Test"
      fixture_2.refresh_rate    = "Test"
      fixture_2.is_verbose      = "Test"
      fixture_2.start           = "Test"
      fixture_2.status          = "Test"
      fixture_2.finish          = "Test"
      fixture_2.newzbin_details = "Test"
      fixture_2.limit           = "Test"
      fixture_2.queue_details   = "Test"

      assert_equal(false, @fixture == fixture_2)
    end

    def test_compare_false_7
      @fixture.categories      = "Test"
      @fixture.scripts         = "Test"
      @fixture.slots           = "Test"
      @fixture.refresh_rate    = "Test"
      @fixture.is_verbose      = "Test"
      @fixture.start           = "Test"
      @fixture.status          = "False"
      @fixture.finish          = "Test"
      @fixture.newzbin_details = "Test"
      @fixture.limit           = "Test"
      @fixture.queue_details   = "Test"

      fixture_2 = SabnzbdPlusModel::Queue.new
      fixture_2.categories      = "Test"
      fixture_2.scripts         = "Test"
      fixture_2.slots           = "Test"
      fixture_2.refresh_rate    = "Test"
      fixture_2.is_verbose      = "Test"
      fixture_2.start           = "Test"
      fixture_2.status          = "Test"
      fixture_2.finish          = "Test"
      fixture_2.newzbin_details = "Test"
      fixture_2.limit           = "Test"
      fixture_2.queue_details   = "Test"

      assert_equal(false, @fixture == fixture_2)
    end

    def test_compare_false_8
      @fixture.categories      = "Test"
      @fixture.scripts         = "Test"
      @fixture.slots           = "Test"
      @fixture.refresh_rate    = "Test"
      @fixture.is_verbose      = "Test"
      @fixture.start           = "Test"
      @fixture.status          = "Test"
      @fixture.finish          = "False"
      @fixture.newzbin_details = "Test"
      @fixture.limit           = "Test"
      @fixture.queue_details   = "Test"

      fixture_2 = SabnzbdPlusModel::Queue.new
      fixture_2.categories      = "Test"
      fixture_2.scripts         = "Test"
      fixture_2.slots           = "Test"
      fixture_2.refresh_rate    = "Test"
      fixture_2.is_verbose      = "Test"
      fixture_2.start           = "Test"
      fixture_2.status          = "Test"
      fixture_2.finish          = "Test"
      fixture_2.newzbin_details = "Test"
      fixture_2.limit           = "Test"
      fixture_2.queue_details   = "Test"

      assert_equal(false, @fixture == fixture_2)
    end

    def test_compare_false_9
      @fixture.categories      = "Test"
      @fixture.scripts         = "Test"
      @fixture.slots           = "Test"
      @fixture.refresh_rate    = "Test"
      @fixture.is_verbose      = "Test"
      @fixture.start           = "Test"
      @fixture.status          = "Test"
      @fixture.finish          = "Test"
      @fixture.newzbin_details = "False"
      @fixture.limit           = "Test"
      @fixture.queue_details   = "Test"

      fixture_2 = SabnzbdPlusModel::Queue.new
      fixture_2.categories      = "Test"
      fixture_2.scripts         = "Test"
      fixture_2.slots           = "Test"
      fixture_2.refresh_rate    = "Test"
      fixture_2.is_verbose      = "Test"
      fixture_2.start           = "Test"
      fixture_2.status          = "Test"
      fixture_2.finish          = "Test"
      fixture_2.newzbin_details = "Test"
      fixture_2.limit           = "Test"
      fixture_2.queue_details   = "Test"

      assert_equal(false, @fixture == fixture_2)
    end

    def test_compare_false_10
      @fixture.categories      = "Test"
      @fixture.scripts         = "Test"
      @fixture.slots           = "Test"
      @fixture.refresh_rate    = "Test"
      @fixture.is_verbose      = "Test"
      @fixture.start           = "Test"
      @fixture.status          = "Test"
      @fixture.finish          = "Test"
      @fixture.newzbin_details = "Test"
      @fixture.limit           = "False"
      @fixture.queue_details   = "Test"

      fixture_2 = SabnzbdPlusModel::Queue.new
      fixture_2.categories      = "Test"
      fixture_2.scripts         = "Test"
      fixture_2.slots           = "Test"
      fixture_2.refresh_rate    = "Test"
      fixture_2.is_verbose      = "Test"
      fixture_2.start           = "Test"
      fixture_2.status          = "Test"
      fixture_2.finish          = "Test"
      fixture_2.newzbin_details = "Test"
      fixture_2.limit           = "Test"
      fixture_2.queue_details   = "Test"

      assert_equal(false, @fixture == fixture_2)
    end

    def test_compare_false_11
      @fixture.categories      = "Test"
      @fixture.scripts         = "False"
      @fixture.slots           = "Test"
      @fixture.refresh_rate    = "Test"
      @fixture.is_verbose      = "Test"
      @fixture.start           = "Test"
      @fixture.status          = "Test"
      @fixture.finish          = "Test"
      @fixture.newzbin_details = "Test"
      @fixture.limit           = "Test"
      @fixture.queue_details   = "False"

      fixture_2 = SabnzbdPlusModel::Queue.new
      fixture_2.categories      = "Test"
      fixture_2.scripts         = "Test"
      fixture_2.slots           = "Test"
      fixture_2.refresh_rate    = "Test"
      fixture_2.is_verbose      = "Test"
      fixture_2.start           = "Test"
      fixture_2.status          = "Test"
      fixture_2.finish          = "Test"
      fixture_2.newzbin_details = "Test"
      fixture_2.limit           = "Test"
      fixture_2.queue_details   = "Test"

      assert_equal(false, @fixture == fixture_2)
    end

    def test_verbose?
      @fixture.is_verbose = "Testing"

      expected = "Testing"
      actual = @fixture.verbose?

      assert_equal(expected, actual)
    end

    def test_from_hash
      queue = {
        "active_lang" => "us-en",
        "session" => "48e93e8b1aaf946f541cc5118a531f48",
        "slots" => [
          {
            "status" => "Downloading",
            "index" => 0,
            "eta" => "21:30 Mon 08 Nov",
            "timeleft" => "0:11:09",
            "avg_age" => "19h",
            "script" => "None",
            "msgid" => "",
            "verbosity" => "",
            "mb" => "208.46",
            "sizeleft" => "20.44 MB",
            "filename" => "Ubuntu.10.10",
            "priority" => "Normal",
            "cat" => "tv",
            "mbleft" => "20.44",
            "percentage" => "90",
            "nzo_id" => "SABnzbd_nzo_XePxXI",
            "unpackopts" => "3",
            "size" => "208.46 MB"
          }
        ],
        "speed"  => "31.25 K",
        "size" => "208.46 MB",
        "limit" => 0,
        "start" => 0,
        "diskspacetotal2" => "140.49",
        "darwin" => false,
        "last_warning" => "",
        "have_warnings" => "0",
        "noofslots" => 1,
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
          "unknown"
        ],
        "diskspacetotal1" => "140.49",
        "mb" => "208.46",
        "newzbinDetails" => true,
        "loadavg" => "1.55, 1.29, 1.31",
        "cache_max" => "0",
        "speedlimit" => "25",
        "webdir" => "/usr/share/sabnzbdplus/interfaces/smpl/templates",
        "paused" => false,
        "isverbose" => false,
        "restart_req" => false,
        "power_options" => true,
        "helpuri" => "http://wiki.sabnzbd.org/",
        "uptime" => "1d",
        "refresh_rate" => "30",
        "version" => "0.5.5RC2",
        "color_scheme" => "white.css",
        "new_release" => "",
        "nt" => false,
        "status" => "Downloading",
        "finish" => 0,
        "cache_art" => "0",
        "paused_all" => false,
        "finishaction" => nil,
        "sizeleft" => "20.44 MB",
        "cache_size" => "0B",
        "mbleft" => "20.44",
        "diskspace2" => "109.60",
        "diskspace1" => "109.60",
        "scripts" => [],
        "timeleft" => "0:11:09",
        "nzb_quota" => "",
        "eta" => "21:30 Mon 08 Nov",
        "kbpersec" => "31.25",
        "new_rel_url" => "",
        "queue_details" => "0"
      }

      actual = SabnzbdPlusModel::Queue.from_hash(queue)

      slot = SabnzbdPlusModel::QueueSlot.new
      slot.status = "Downloading"
      slot.index = 0
      slot.eta = "21:30 Mon 08 Nov"
      slot.time_left = "0:11:09"
      slot.avg_age = "19h"
      slot.script = "None"
      slot.msg_id = ""
      slot.verbosity = ""
      slot.mb = "208.46"
      slot.size_left = "20.44 MB"
      slot.filename = "Ubuntu.10.10"
      slot.priority = "Normal"
      slot.cat = "tv"
      slot.mb_left = "20.44"
      slot.percentage = "90"
      slot.nzo_id = "SABnzbd_nzo_XePxXI"
      slot.unpack_opts = "3"
      slot.size = "208.46 MB"

      expected = SabnzbdPlusModel::Queue.new
      expected.active_lang = "us-en"
      expected.session = "48e93e8b1aaf946f541cc5118a531f48"
      expected.slots = [slot]
      expected.speed  = "31.25 K"
      expected.size = "208.46 MB"
      expected.limit = 0
      expected.start = 0
      expected.disk_space_total_2 = "140.49"
      expected.darwin = false
      expected.last_warning = ""
      expected.have_warnings = "0"
      expected.no_of_slots = 1
      expected.pause_int = "0"
      expected.categories = [
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
      expected.mb = "208.46"
      expected.newzbin_details = true
      expected.load_avg = "1.55, 1.29, 1.31"
      expected.cache_max = "0"
      expected.speed_limit = "25"
      expected.web_dir = "/usr/share/sabnzbdplus/interfaces/smpl/templates"
      expected.paused = false
      expected.is_verbose = false
      expected.restart_req = false
      expected.power_options = true
      expected.help_uri = "http://wiki.sabnzbd.org/"
      expected.uptime = "1d"
      expected.refresh_rate = "30"
      expected.version = "0.5.5RC2"
      expected.color_scheme = "white.css"
      expected.new_release = ""
      expected.nt = false
      expected.status = "Downloading"
      expected.finish = 0
      expected.cache_art = "0"
      expected.paused_all = false
      expected.finish_action = nil
      expected.size_left = "20.44 MB"
      expected.cache_size = "0B"
      expected.mb_left = "20.44"
      expected.disk_space_2 = "109.60"
      expected.disk_space_1 = "109.60"
      expected.scripts = []
      expected.time_left = "0:11:09"
      expected.nzb_quota = ""
      expected.eta = "21:30 Mon 08 Nov"
      expected.kb_per_sec = "31.25"
      expected.new_rel_url = ""
      expected.queue_details = "0"
      expected.cache_limit = nil

      assert_equal(expected, actual)
    end
  end
end

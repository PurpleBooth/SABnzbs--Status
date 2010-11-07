$:.unshift File.join(File.dirname(__FILE__),'..','..')

require 'test/unit'
require 'lib/sabnzbd_plus/api/current_queue'
require 'test/sabnzbd_plus/model/api/caller/test'

module SabnzbdPlusApi
  class CurrentQueueTest < Test::Unit::TestCase
    def setup
      caller   = SabnzbdPlusModelApiCaller::Test.new
      api      = SabnzbdPlusModelApi::Api.new(caller)
      mapper   = SabnzbdPlusModel::Mapper.new(api)
      @fixture = SabnzbdPlusApi::CurrentQueue.new(mapper)
    end

    def test_current_queue
      actual = @fixture.process

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

  end
end

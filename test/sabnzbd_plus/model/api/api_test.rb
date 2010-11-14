$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..','..'))

require 'test/unit'
require 'lib/sabnzbd_plus/model/api/api'
require 'test/sabnzbd_plus/model/api/caller/test'

module SabnzbdPlusModelApi
  class ApiTest < Test::Unit::TestCase
    def setup
      @caller = SabnzbdPlusModelApiCaller::Test.new
      @caller.fixture_name = "empty"

      @fixture = SabnzbdPlusModelApi::Api.new(@caller)
    end

    def test_qstatus
      expected = @fixture.qstatus
      actual = {}

      assert_equal(expected, actual)
    end

    def test_queue_1
      @caller.fixture_name = "queue_empty"

      expected = @fixture.queue
      actual = {"queue"=>
  {"queue_details"=>"0",
   "finishaction"=>nil,
   "speedlimit"=>"25",
   "cache_art"=>"0",
   "finish"=>0,
   "loadavg"=>"0.63, 0.56, 0.57",
   "newzbinDetails"=>true,
   "size"=>"0B",
   "slots"=>[],
   "kbpersec"=>"0.00",
   "timeleft"=>"0:00:00",
   "session"=>"48e93e8b1aaf946f541cc5118a531f48",
   "new_rel_url"=>"",
   "color_scheme"=>"white.css",
   "webdir"=>"/usr/share/sabnzbdplus/interfaces/smpl/templates",
   "nzb_quota"=>"",
   "helpuri"=>"http://wiki.sabnzbd.org/",
   "isverbose"=>false,
   "diskspacetotal1"=>"140.49",
   "paused_all"=>false,
   "restart_req"=>false,
   "diskspacetotal2"=>"140.49",
   "nt"=>false,
   "version"=>"0.5.5RC2",
   "refresh_rate"=>"30",
   "start"=>0,
   "eta"=>"unknown",
   "paused"=>false,
   "have_warnings"=>"5",
   "speed"=>"0 ",
   "diskspace1"=>"111.26",
   "mbleft"=>"0.00",
   "new_release"=>"",
   "uptime"=>"36m",
   "power_options"=>true,
   "categories"=>
    ["None",
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
   "pause_int"=>"0",
   "diskspace2"=>"111.26",
   "status"=>"Idle",
   "cache_max"=>"0",
   "noofslots"=>0,
   "darwin"=>false,
   "limit"=>0,
   "active_lang"=>"us-en",
   "scripts"=>[],
   "cache_size"=>"0B",
   "sizeleft"=>"0B",
   "mb"=>"0.00",
   "last_warning"=>
    "2010-11-07 14:55:07,829\nWARNING\nYou have no credit on your Newzbin account"}}

      assert_equal(expected, actual)
    end

    def test_queue_2
      expected = @fixture.queue "1"
      actual = {}

      assert_equal(expected, actual)
    end

    def test_queue_3
      expected = @fixture.queue(nil,"2")
      actual = {}

      assert_equal(expected, actual)
    end

    def test_queue_3
      expected = @fixture.queue({:name => nil, :value=> nil, :start => "3"})
      actual = {}

      assert_equal(expected, actual)
    end

    def test_history_1
      expected = @fixture.history("1")
      actual = {}

      assert_equal(expected, actual)
    end
    
    def test_history_2
      expected = @fixture.history({:name => nil, :value => "2"})
      actual = {}

      assert_equal(expected, actual)
    end
    
    def test_history_3
      expected = @fixture.history({:name => nil, :value => nil, :start => "3"})
      actual = {}

      assert_equal(expected, actual)
    end
    
    def test_history_4
      expected = @fixture.history({:name => nil, :value => nil, :start => nil, :limit => "4"})
      actual = {}

      assert_equal(expected, actual)
    end

    def test_version
      expected = @fixture.version
      actual = {}

      assert_equal(expected, actual)
    end

    def test_warnings
      expected = @fixture.warnings
      actual = {}

      assert_equal(expected, actual)
    end

    def test_get_cats
      expected = @fixture.get_cats
      actual = {}

      assert_equal(expected, actual)
    end

    def test_get_scripts
      expected = @fixture.get_scripts
      actual = {}

      assert_equal(expected, actual)
    end

    def test_restart
      expected = @fixture.restart
      actual = "ok\n"

      assert_equal(expected, actual)
    end

    def test_switch
      expected = @fixture.switch({:value => "test 1", :value => "test 2"})
      actual = {}

      assert_equal(expected, actual)
    end

    def test_pause
      expected = @fixture.pause
      actual = {}

      assert_equal(expected, actual)
    end

    def test_config
      expected = @fixture.config({:name => "Test", :value => "tseT"})
      actual = {}

      assert_equal(expected, actual)
    end

    def test_resume
      expected = @fixture.resume
      actual = {}

      assert_equal(expected, actual)
    end

    def test_shutdown
      expected = @fixture.shutdown
      actual = {}

      assert_equal(expected, actual)
    end

    def test_addurl_1
      expected = @fixture.addurl({:name => "Test 1", :nzbname => "Test 2"})
      actual = {}

      assert_equal(expected, actual)
    end

    def test_addurl_2
      expected = @fixture.addurl({:name => "Test 1", :nzbname => "Test 2", :pp => "Test 3"})
      actual = {}

      assert_equal(expected, actual)
    end

    def test_addurl_3
      expected = @fixture.addurl({:name => "Test 1", :nzbname => "Test 2", :pp => "Test 3", :script => "Test 4"})
      actual = {}

      assert_equal(expected, actual)
    end

    def test_addurl_4
      expected = @fixture.addurl({:name => "Test 1", :nzbname => "Test 2", :pp => "Test 3", :script => "Test 4", :cat => "Test 5"})
      actual = {}

      assert_equal(expected, actual)
    end

    def test_addurl_5
      expected = @fixture.addurl({:name => "Test 1", :nzbname => "Test 2", :pp => "Test 3", :script => "Test 4", :cat => "Test 5", :priority => "Test 6"})
      actual = {}

      assert_equal(expected, actual)
    end

    def test_addid_1
      expected = @fixture.addid({:name => "Test 1"})
      actual = {}

      assert_equal(expected, actual)
    end

    def test_addid_2
      expected = @fixture.addid({:name => "Test 1", :pp => "Test 2"})
      actual = {}

      assert_equal(expected, actual)
    end

    def test_addid_3
      expected = @fixture.addid({:name => "Test 1", :pp => "Test 2", :script => "Test 3"})
      actual = {}

      assert_equal(expected, actual)
    end

    def test_addid_4
      expected = @fixture.addid({:name => "Test 1", :pp => "Test 2", :script => "Test 3", :cat => "Test 4"})
      actual = {}

      assert_equal(expected, actual)
    end

    def test_addid_5
      expected = @fixture.addid({:name => "Test 1", :pp => "Test 2", :script => "Test 3", :cat => "Test 4", :priority => "Test 5"})
      actual = {}

      assert_equal(expected, actual)
    end

    def test_addlocalfile_1
      expected = @fixture.addlocalfile(:name => "Test 1")
      actual = {}

      assert_equal(expected, actual)
    end

    def test_addlocalfile_2
      expected = @fixture.addlocalfile(:name => "Test 1", :pp => "Test 2")
      actual = {}

      assert_equal(expected, actual)
    end

    def test_addlocalfile_3
      expected = @fixture.addlocalfile(:name => "Test 1", :pp => "Test 2", :script => "Test 3")
      actual = {}

      assert_equal(expected, actual)
    end

    def test_addlocalfile_4
      expected = @fixture.addlocalfile(:name => "Test 1", :pp => "Test 2", :script => "Test 3", :cat => "Test 4")
      actual = {}

      assert_equal(expected, actual)
    end

    def test_addlocalfile_5
      expected = @fixture.addlocalfile(:name => "Test 1", :pp => "Test 2", :script => "Test 3", :cat => "Test 4", :priority => "Test 5")
      actual = {}

      assert_equal(expected, actual)
    end

    def test_change_script
      expected = @fixture.change_script({:value => "Test 1", :value2 => "Test 2"})
      actual = {}

      assert_equal(expected, actual)
    end

    def test_change_cat
      expected = @fixture.change_cat({:value => "Test 1", :value2 => "Test 2"})
      actual = {}

      assert_equal(expected, actual)
    end

    def test_change_opts
      expected = @fixture.change_opts({:value => "Test 1", :value2 => "Test 2"})
      actual = {}

      assert_equal(expected, actual)
    end

    def test_get_files
      expected = @fixture.get_files("Test 1")
      actual = {}

      assert_equal(expected, actual)
    end

    def test_retry
      expected = @fixture.retry("Test 1")
      actual = {}

      assert_equal(expected, actual)
    end
  end
end

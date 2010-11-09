$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..'))

require 'test/unit'
require 'lib/sabnzbd_plus/model/queue_slot'
require 'test/sabnzbd_plus/model/api/caller/test'

module SabnzbdPlusModel
  class QueueSlotTest < Test::Unit::TestCase
    def setup
      @fixture = SabnzbdPlusModel::QueueSlot.new
    end
    
    def test_compare_true
      @fixture.index       = "Test"
      @fixture.eta         = "Test"
      @fixture.time_left   = "Test"
      @fixture.avg_age     = "Test"
      @fixture.msg_id      = "Test"
      @fixture.verbosity   = "Test"
      @fixture.mb          = "Test"
      @fixture.filename   = "Test"
      @fixture.priority    = "Test"
      @fixture.cat         = "Test"
      @fixture.mb_left     = "Test"
      @fixture.percentage  = "Test"
      @fixture.unpack_opts = "Test"


      fixture_2 = SabnzbdPlusModel::QueueSlot.new
      fixture_2.index       = "Test"
      fixture_2.eta         = "Test"
      fixture_2.time_left   = "Test"
      fixture_2.avg_age     = "Test"
      fixture_2.msg_id      = "Test"
      fixture_2.verbosity   = "Test"
      fixture_2.mb          = "Test"
      fixture_2.filename   = "Test"
      fixture_2.priority    = "Test"
      fixture_2.cat         = "Test"
      fixture_2.mb_left     = "Test"
      fixture_2.percentage  = "Test"
      fixture_2.unpack_opts = "Test"


      assert_equal(true, @fixture == fixture_2)
      assert_equal(true, @fixture.eql?(fixture_2))
    end

    def test_compare_false_1
      @fixture.index       = "False"
      @fixture.eta         = "Test"
      @fixture.time_left   = "Test"
      @fixture.avg_age     = "Test"
      @fixture.msg_id      = "Test"
      @fixture.verbosity   = "Test"
      @fixture.mb          = "Test"
      @fixture.filename   = "Test"
      @fixture.priority    = "Test"
      @fixture.cat         = "Test"
      @fixture.mb_left     = "Test"
      @fixture.percentage  = "Test"
      @fixture.unpack_opts = "Test"


      fixture_2 = SabnzbdPlusModel::QueueSlot.new
      fixture_2.index       = "Test"
      fixture_2.eta         = "Test"
      fixture_2.time_left   = "Test"
      fixture_2.avg_age     = "Test"
      fixture_2.msg_id      = "Test"
      fixture_2.verbosity   = "Test"
      fixture_2.mb          = "Test"
      fixture_2.filename   = "Test"
      fixture_2.priority    = "Test"
      fixture_2.cat         = "Test"
      fixture_2.mb_left     = "Test"
      fixture_2.percentage  = "Test"
      fixture_2.unpack_opts = "Test"


      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_2
      @fixture.index       = "Test"
      @fixture.eta         = "False"
      @fixture.time_left   = "Test"
      @fixture.avg_age     = "Test"
      @fixture.msg_id      = "Test"
      @fixture.verbosity   = "Test"
      @fixture.mb          = "Test"
      @fixture.filename   = "Test"
      @fixture.priority    = "Test"
      @fixture.cat         = "Test"
      @fixture.mb_left     = "Test"
      @fixture.percentage  = "Test"
      @fixture.unpack_opts = "Test"


      fixture_2 = SabnzbdPlusModel::QueueSlot.new
      fixture_2.index       = "Test"
      fixture_2.eta         = "Test"
      fixture_2.time_left   = "Test"
      fixture_2.avg_age     = "Test"
      fixture_2.msg_id      = "Test"
      fixture_2.verbosity   = "Test"
      fixture_2.mb          = "Test"
      fixture_2.filename   = "Test"
      fixture_2.priority    = "Test"
      fixture_2.cat         = "Test"
      fixture_2.mb_left     = "Test"
      fixture_2.percentage  = "Test"
      fixture_2.unpack_opts = "Test"


      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_3
      @fixture.index       = "Test"
      @fixture.eta         = "Test"
      @fixture.time_left   = "False"
      @fixture.avg_age     = "Test"
      @fixture.msg_id      = "Test"
      @fixture.verbosity   = "Test"
      @fixture.mb          = "Test"
      @fixture.filename   = "Test"
      @fixture.priority    = "Test"
      @fixture.cat         = "Test"
      @fixture.mb_left     = "Test"
      @fixture.percentage  = "Test"
      @fixture.unpack_opts = "Test"


      fixture_2 = SabnzbdPlusModel::QueueSlot.new
      fixture_2.index       = "Test"
      fixture_2.eta         = "Test"
      fixture_2.time_left   = "Test"
      fixture_2.avg_age     = "Test"
      fixture_2.msg_id      = "Test"
      fixture_2.verbosity   = "Test"
      fixture_2.mb          = "Test"
      fixture_2.filename   = "Test"
      fixture_2.priority    = "Test"
      fixture_2.cat         = "Test"
      fixture_2.mb_left     = "Test"
      fixture_2.percentage  = "Test"
      fixture_2.unpack_opts = "Test"


      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_4
      @fixture.index       = "Test"
      @fixture.eta         = "Test"
      @fixture.time_left   = "Test"
      @fixture.avg_age     = "False"
      @fixture.msg_id      = "Test"
      @fixture.verbosity   = "Test"
      @fixture.mb          = "Test"
      @fixture.filename   = "Test"
      @fixture.priority    = "Test"
      @fixture.cat         = "Test"
      @fixture.mb_left     = "Test"
      @fixture.percentage  = "Test"
      @fixture.unpack_opts = "Test"


      fixture_2 = SabnzbdPlusModel::QueueSlot.new
      fixture_2.index       = "Test"
      fixture_2.eta         = "Test"
      fixture_2.time_left   = "Test"
      fixture_2.avg_age     = "Test"
      fixture_2.msg_id      = "Test"
      fixture_2.verbosity   = "Test"
      fixture_2.mb          = "Test"
      fixture_2.filename   = "Test"
      fixture_2.priority    = "Test"
      fixture_2.cat         = "Test"
      fixture_2.mb_left     = "Test"
      fixture_2.percentage  = "Test"
      fixture_2.unpack_opts = "Test"


      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_5
      @fixture.index       = "Test"
      @fixture.eta         = "Test"
      @fixture.time_left   = "Test"
      @fixture.avg_age     = "Test"
      @fixture.msg_id      = "False"
      @fixture.verbosity   = "Test"
      @fixture.mb          = "Test"
      @fixture.filename   = "Test"
      @fixture.priority    = "Test"
      @fixture.cat         = "Test"
      @fixture.mb_left     = "Test"
      @fixture.percentage  = "Test"
      @fixture.unpack_opts = "Test"


      fixture_2 = SabnzbdPlusModel::QueueSlot.new
      fixture_2.index       = "Test"
      fixture_2.eta         = "Test"
      fixture_2.time_left   = "Test"
      fixture_2.avg_age     = "Test"
      fixture_2.msg_id      = "Test"
      fixture_2.verbosity   = "Test"
      fixture_2.mb          = "Test"
      fixture_2.filename   = "Test"
      fixture_2.priority    = "Test"
      fixture_2.cat         = "Test"
      fixture_2.mb_left     = "Test"
      fixture_2.percentage  = "Test"
      fixture_2.unpack_opts = "Test"


      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_6
      @fixture.index       = "Test"
      @fixture.eta         = "Test"
      @fixture.time_left   = "Test"
      @fixture.avg_age     = "Test"
      @fixture.msg_id      = "Test"
      @fixture.verbosity   = "False"
      @fixture.mb          = "Test"
      @fixture.filename   = "Test"
      @fixture.priority    = "Test"
      @fixture.cat         = "Test"
      @fixture.mb_left     = "Test"
      @fixture.percentage  = "Test"
      @fixture.unpack_opts = "Test"


      fixture_2 = SabnzbdPlusModel::QueueSlot.new
      fixture_2.index       = "Test"
      fixture_2.eta         = "Test"
      fixture_2.time_left   = "Test"
      fixture_2.avg_age     = "Test"
      fixture_2.msg_id      = "Test"
      fixture_2.verbosity   = "Test"
      fixture_2.mb          = "Test"
      fixture_2.filename   = "Test"
      fixture_2.priority    = "Test"
      fixture_2.cat         = "Test"
      fixture_2.mb_left     = "Test"
      fixture_2.percentage  = "Test"
      fixture_2.unpack_opts = "Test"


      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_7
      @fixture.index       = "Test"
      @fixture.eta         = "Test"
      @fixture.time_left   = "Test"
      @fixture.avg_age     = "Test"
      @fixture.msg_id      = "Test"
      @fixture.verbosity   = "Test"
      @fixture.mb          = "False"
      @fixture.filename   = "Test"
      @fixture.priority    = "Test"
      @fixture.cat         = "Test"
      @fixture.mb_left     = "Test"
      @fixture.percentage  = "Test"
      @fixture.unpack_opts = "Test"


      fixture_2 = SabnzbdPlusModel::QueueSlot.new
      fixture_2.index       = "Test"
      fixture_2.eta         = "Test"
      fixture_2.time_left   = "Test"
      fixture_2.avg_age     = "Test"
      fixture_2.msg_id      = "Test"
      fixture_2.verbosity   = "Test"
      fixture_2.mb          = "Test"
      fixture_2.filename   = "Test"
      fixture_2.priority    = "Test"
      fixture_2.cat         = "Test"
      fixture_2.mb_left     = "Test"
      fixture_2.percentage  = "Test"
      fixture_2.unpack_opts = "Test"


      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_8
      @fixture.index       = "Test"
      @fixture.eta         = "Test"
      @fixture.time_left   = "Test"
      @fixture.avg_age     = "Test"
      @fixture.msg_id      = "Test"
      @fixture.verbosity   = "Test"
      @fixture.mb          = "Test"
      @fixture.filename   = "False"
      @fixture.priority    = "Test"
      @fixture.cat         = "Test"
      @fixture.mb_left     = "Test"
      @fixture.percentage  = "Test"
      @fixture.unpack_opts = "Test"


      fixture_2 = SabnzbdPlusModel::QueueSlot.new
      fixture_2.index       = "Test"
      fixture_2.eta         = "Test"
      fixture_2.time_left   = "Test"
      fixture_2.avg_age     = "Test"
      fixture_2.msg_id      = "Test"
      fixture_2.verbosity   = "Test"
      fixture_2.mb          = "Test"
      fixture_2.filename   = "Test"
      fixture_2.priority    = "Test"
      fixture_2.cat         = "Test"
      fixture_2.mb_left     = "Test"
      fixture_2.percentage  = "Test"
      fixture_2.unpack_opts = "Test"


      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_9
      @fixture.index       = "Test"
      @fixture.eta         = "Test"
      @fixture.time_left   = "Test"
      @fixture.avg_age     = "Test"
      @fixture.msg_id      = "Test"
      @fixture.verbosity   = "Test"
      @fixture.mb          = "Test"
      @fixture.filename   = "Test"
      @fixture.priority    = "False"
      @fixture.cat         = "Test"
      @fixture.mb_left     = "Test"
      @fixture.percentage  = "Test"
      @fixture.unpack_opts = "Test"


      fixture_2 = SabnzbdPlusModel::QueueSlot.new
      fixture_2.index       = "Test"
      fixture_2.eta         = "Test"
      fixture_2.time_left   = "Test"
      fixture_2.avg_age     = "Test"
      fixture_2.msg_id      = "Test"
      fixture_2.verbosity   = "Test"
      fixture_2.mb          = "Test"
      fixture_2.filename   = "Test"
      fixture_2.priority    = "Test"
      fixture_2.cat         = "Test"
      fixture_2.mb_left     = "Test"
      fixture_2.percentage  = "Test"
      fixture_2.unpack_opts = "Test"


      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_10
      @fixture.index       = "Test"
      @fixture.eta         = "Test"
      @fixture.time_left   = "Test"
      @fixture.avg_age     = "Test"
      @fixture.msg_id      = "Test"
      @fixture.verbosity   = "Test"
      @fixture.mb          = "Test"
      @fixture.filename   = "Test"
      @fixture.priority    = "Test"
      @fixture.cat         = "False"
      @fixture.mb_left     = "Test"
      @fixture.percentage  = "Test"
      @fixture.unpack_opts = "Test"


      fixture_2 = SabnzbdPlusModel::QueueSlot.new
      fixture_2.index       = "Test"
      fixture_2.eta         = "Test"
      fixture_2.time_left   = "Test"
      fixture_2.avg_age     = "Test"
      fixture_2.msg_id      = "Test"
      fixture_2.verbosity   = "Test"
      fixture_2.mb          = "Test"
      fixture_2.filename   = "Test"
      fixture_2.priority    = "Test"
      fixture_2.cat         = "Test"
      fixture_2.mb_left     = "Test"
      fixture_2.percentage  = "Test"
      fixture_2.unpack_opts = "Test"


      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_11
      @fixture.index       = "Test"
      @fixture.eta         = "Test"
      @fixture.time_left   = "Test"
      @fixture.avg_age     = "Test"
      @fixture.msg_id      = "Test"
      @fixture.verbosity   = "Test"
      @fixture.mb          = "Test"
      @fixture.filename   = "Test"
      @fixture.priority    = "Test"
      @fixture.cat         = "Test"
      @fixture.mb_left     = "False"
      @fixture.percentage  = "Test"
      @fixture.unpack_opts = "Test"


      fixture_2 = SabnzbdPlusModel::QueueSlot.new
      fixture_2.index       = "Test"
      fixture_2.eta         = "Test"
      fixture_2.time_left   = "Test"
      fixture_2.avg_age     = "Test"
      fixture_2.msg_id      = "Test"
      fixture_2.verbosity   = "Test"
      fixture_2.mb          = "Test"
      fixture_2.filename   = "Test"
      fixture_2.priority    = "Test"
      fixture_2.cat         = "Test"
      fixture_2.mb_left     = "Test"
      fixture_2.percentage  = "Test"
      fixture_2.unpack_opts = "Test"


      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_12
      @fixture.index       = "Test"
      @fixture.eta         = "Test"
      @fixture.time_left   = "Test"
      @fixture.avg_age     = "Test"
      @fixture.msg_id      = "Test"
      @fixture.verbosity   = "Test"
      @fixture.mb          = "Test"
      @fixture.filename   = "Test"
      @fixture.priority    = "Test"
      @fixture.cat         = "Test"
      @fixture.mb_left     = "Test"
      @fixture.percentage  = "False"
      @fixture.unpack_opts = "Test"


      fixture_2 = SabnzbdPlusModel::QueueSlot.new
      fixture_2.index       = "Test"
      fixture_2.eta         = "Test"
      fixture_2.time_left   = "Test"
      fixture_2.avg_age     = "Test"
      fixture_2.msg_id      = "Test"
      fixture_2.verbosity   = "Test"
      fixture_2.mb          = "Test"
      fixture_2.filename   = "Test"
      fixture_2.priority    = "Test"
      fixture_2.cat         = "Test"
      fixture_2.mb_left     = "Test"
      fixture_2.percentage  = "Test"
      fixture_2.unpack_opts = "Test"


      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_compare_false_13
      @fixture.index       = "Test"
      @fixture.eta         = "Test"
      @fixture.time_left   = "Test"
      @fixture.avg_age     = "Test"
      @fixture.msg_id      = "Test"
      @fixture.verbosity   = "Test"
      @fixture.mb          = "Test"
      @fixture.filename   = "Test"
      @fixture.priority    = "Test"
      @fixture.cat         = "Test"
      @fixture.mb_left     = "Test"
      @fixture.percentage  = "Test"
      @fixture.unpack_opts = "False"


      fixture_2 = SabnzbdPlusModel::QueueSlot.new
      fixture_2.index       = "Test"
      fixture_2.eta         = "Test"
      fixture_2.time_left   = "Test"
      fixture_2.avg_age     = "Test"
      fixture_2.msg_id      = "Test"
      fixture_2.verbosity   = "Test"
      fixture_2.mb          = "Test"
      fixture_2.filename   = "Test"
      fixture_2.priority    = "Test"
      fixture_2.cat         = "Test"
      fixture_2.mb_left     = "Test"
      fixture_2.percentage  = "Test"
      fixture_2.unpack_opts = "Test"


      assert_equal(false, @fixture == fixture_2)
      assert_equal(false, @fixture.eql?(fixture_2))
    end

    def test_from_hash
      queue = {
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

      actual = SabnzbdPlusModel::QueueSlot.from_hash(queue)
      
      expected = SabnzbdPlusModel::QueueSlot.new
      expected.status = "Downloading"
      expected.index = 0
      expected.eta = "21:30 Mon 08 Nov"
      expected.time_left = "0:11:09"
      expected.avg_age = "19h"
      expected.script = "None"
      expected.msg_id = ""
      expected.verbosity = ""
      expected.mb = "208.46"
      expected.size_left = "20.44 MB"
      expected.filename = "Ubuntu.10.10"
      expected.priority = "Normal"
      expected.cat = "tv"
      expected.mb_left = "20.44"
      expected.percentage = "90"
      expected.nzo_id = "SABnzbd_nzo_XePxXI"
      expected.unpack_opts = "3"
      expected.size = "208.46 MB"

      assert_equal(expected, actual)
    end

    def test_name
      @fixture.name = "Name Name Test Test"

      assert_equal("Name Name Test Test", @fixture.name)
    end
  end
end

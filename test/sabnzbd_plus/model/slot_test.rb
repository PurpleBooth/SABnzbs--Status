$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..'))

require 'test/unit'
require 'lib/sabnzbd_plus/model/slot'
require 'test/sabnzbd_plus/model/api/caller/test'

module SabnzbdPlusModel
  class SlotTest < Test::Unit::TestCase
    def setup
      @fixture = SabnzbdPlusModel::Slot.new
    end
    
    def test_initialize
      assert_equal(nil, @fixture.size)
      assert_equal(nil, @fixture.script)
      assert_equal(nil, @fixture.status)
      assert_equal(nil, @fixture.nzo_id)
    end

    def test_factory_queue_slot
      expected = QueueSlot.new
      expected.filename = ""
      assert_equal(expected, HistorySlot.factory({"filename"=>""}))
    end

    def test_factory_history_slot
      expected = HistorySlot.new
      expected.name = ""
      assert_equal(expected, HistorySlot.factory({"name"=>""}))
    end

    def test_factory_slot
      expected = Slot.new
      assert_equal(expected, HistorySlot.factory({}))
    end

    def test_from_hash

      actual = Slot.from_hash({"size"=> "Test", "script" => "Test", "status" => "Test", "nzo_id" => "Test"})
      expected = Slot.new

      expected.size            = "Test"
      expected.script          = "Test"
      expected.status          = "Test"
      expected.nzo_id          = "Test"
      
      assert_equal(expected, actual)
    end

    def test_equal_true  
      expected_2 = Slot.new
      expected_2.size            = "Test"
      expected_2.script          = "Test"
      expected_2.status          = "Test"
      expected_2.nzo_id          = "Test"
      
      expected_1 = Slot.new
      expected_1.size            = "Test"
      expected_1.script          = "Test"
      expected_1.status          = "Test"
      expected_1.nzo_id          = "Test"
      
      assert(expected_1 == expected_2)
      assert(expected_1.eql?(expected_2))
    end

    def test_equal_failure_1
      expected_2 = Slot.new
      expected_2.size            = "False"
      expected_2.script          = "Test"
      expected_2.status          = "Test"
      expected_2.nzo_id          = "Test"

      expected_1 = Slot.new
      expected_1.size            = "Test"
      expected_1.script          = "Test"
      expected_1.status          = "Test"
      expected_1.nzo_id          = "Test"

      assert !(expected_1 == expected_2)
      assert !(expected_1.eql?(expected_2))
    end

    def test_equal_failure_2
      expected_2 = Slot.new
      expected_2.size            = "Test"
      expected_2.script          = "False"
      expected_2.status          = "Test"
      expected_2.nzo_id          = "Test"

      expected_1 = Slot.new
      expected_1.size            = "Test"
      expected_1.script          = "Test"
      expected_1.status          = "Test"
      expected_1.nzo_id          = "Test"

      assert !(expected_1 == expected_2)
      assert !(expected_1.eql?(expected_2))
    end

    def test_equal_failure_3
      expected_2 = Slot.new
      expected_2.size            = "Test"
      expected_2.script          = "Test"
      expected_2.status          = "False"
      expected_2.nzo_id          = "Test"

      expected_1 = Slot.new
      expected_1.size            = "Test"
      expected_1.script          = "Test"
      expected_1.status          = "Test"
      expected_1.nzo_id          = "Test"

      assert !(expected_1 == expected_2)
      assert !(expected_1.eql?(expected_2))
    end

    def test_equal_failure_4
      expected_2 = Slot.new
      expected_2.size            = "Test"
      expected_2.script          = "Test"
      expected_2.status          = "Test"
      expected_2.nzo_id          = "False"

      expected_1 = Slot.new
      expected_1.size            = "Test"
      expected_1.script          = "Test"
      expected_1.status          = "Test"
      expected_1.nzo_id          = "Test"

      assert !(expected_1 == expected_2)
      assert !(expected_1.eql?(expected_2))
    end

  end
end

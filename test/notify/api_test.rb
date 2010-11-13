# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'test/unit'

$:.unshift File.join(File.dirname(__FILE__),'..','..')
require 'lib/notify/api'
require 'test/notify/test/test_notifier'


module Notify
  class ApiTest < Test::Unit::TestCase
    def setup
      notifier = NotifyTest::TestNotifier.new
      @fixture = Notify::Api.new(notifier)
    end

    def test_added_nzb
      actual = @fixture.added_nzb({:name => "Test"})
      expected = "Added job " + "Test"

      assert_equal(expected, actual)
    end

    def test_completed_nzb
      actual = @fixture.completed_nzb({:name => "Test Name", :status => "Test Status"})
      expected = "Job " + "Test Name" + " " + "Test Status"

      assert_equal(expected, actual)
    end

    def test_current_status
      actual = @fixture.current_status({:name => "Test Name",:mb_left => "100",:mb => "991",:kb_per_sec => "1212",:timeleft => "Testing"})
      expected = "Test Name" + " ["+"100"+"MB/" + "991" + "MB @ "+"1212"+"KB/S "+"Testing"+" timeleft]"

      assert_equal(expected, actual)
    end
  end
end

# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','..','lib')

require 'test/unit'
require 'notify/api/current_status'

module NotifyApi
  class CurrentStatusTest < Test::Unit::TestCase

    def test_current_status
      fixture = NotifyApi::CurrentStatus.new
      fixture.name = "Test Name"
      fixture.mb_left = "Test MB Left"
      fixture.mb = "Test MB"
      fixture.kb_per_sec = "Test KB Per Sec"
      fixture.timeleft = "Test Timeleft"

      actual = fixture.process
      expected = "Test Name" + " ["+"Test MB Left"+"MB/" + "Test MB" + "MB @ "+"Test KB Per Sec"+"KB/S "+"Test Timeleft"+" timeleft]"

      assert_equal(expected, actual)
    end
  end
end

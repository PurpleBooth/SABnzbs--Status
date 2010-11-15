# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','..','lib')

require 'test/unit'
require 'notify/api/started_nzb'

module NotifyApi
  class StartedNzbTest < Test::Unit::TestCase

    def test_started_nzb
      fixture = NotifyApi::StartedNzb.new(NotifyTest::TestNotifier.new)
      fixture.name = "Test Name"
      fixture.mb_left = "Test MB Left"
      fixture.mb = "Test MB"
      fixture.time_left = "Test Timeleft"

      actual = fixture.process
      expected = "Downloading Test Name" + " ["+"Test MB Left"+"MB/" + "Test MB" + "MB "+"Test Timeleft"+" timeleft]"

      assert_equal(expected, actual)
    end
  end
end

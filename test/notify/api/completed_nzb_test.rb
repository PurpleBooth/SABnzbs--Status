# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','..','lib')

require 'test/unit'
require 'notify/api/completed_nzb'

module NotifyApi
  class CompletedNzbTest < Test::Unit::TestCase

    def test_completed_nzb
      fixture = NotifyApi::CompletedNzb.new(NotifyTest::TestNotifier.new)
      fixture.name = "Test Name"
      fixture.status = "Test Status"

      actual = fixture.process
      expected = "Job " + "Test Name" + " " + "Test Status"

      assert_equal(expected, actual)
    end
  end
end

# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','..','lib')

require 'test/unit'
require 'notify/api/added_nzb'

module NotifyApi
  class AddedNzbTest < Test::Unit::TestCase

    def test_added_nzb
      fixture = NotifyApi::AddedNzb.new(NotifyTest::TestNotifier.new)
      fixture.name = "Test"

      actual = fixture.process
      expected = "Added job " + "Test"

      assert_equal(expected, actual)
    end
  end
end

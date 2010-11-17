# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','..','lib')

require 'test/unit'
require 'notify/lib_notify/lib_notify'

module NotifyLibNotify
  class LibNotifyTest < Test::Unit::TestCase
    def setup
      @fixture = NotifyLibNotify::LibNotify.new
    end

    def test_icon
      actual = @fixture.icon
      expected = File.expand_path(File.dirname(__FILE__) + '/../../../resources/images/favicon.ico')

      assert_equal(expected, actual)
    end
  end
end

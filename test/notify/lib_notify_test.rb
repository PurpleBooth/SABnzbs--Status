# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'notify/lib_notify'

module Notify
  class LibNotifyTest < Test::Unit::TestCase
    def setup
     @fixture = LibNotify.new
    end

    def test_instansiable
      assert_instance_of LibNotify, LibNotify.new, "LibNotify is instansible"
    end
  end
end

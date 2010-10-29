# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'sabnzbd_plus_model/sabnzbd_plus_api'

module SabnzbdPlusModel
  class SabnzbdPlusApiTest < Test::Unit::TestCase
    def setup
     @fixture = SabnzbdPlusApi.new
    end

    def test_instansiable
      assert_instance_of SabnzbdPlusApi, SabnzbdPlusApi.new, "SabnzbdPlusModel is instansible"
    end
  end
end

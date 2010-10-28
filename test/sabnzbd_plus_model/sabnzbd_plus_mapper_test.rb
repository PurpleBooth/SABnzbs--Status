# To change this template, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'sabnzbd_plus_model/sabnzbd_plus_mapper'

module SabnzbdPlusModel
  class SabnzbdPlusMapperTest < Test::Unit::TestCase
    def setup
     @fixture = SabnzbdPlusMapper.new
    end

    def test_instansiable
      assert_instance_of SabnzbdPlusMapper, SabnzbdPlusMapper.new, "SabnzbdPlusModel is instansible"
    end
  end
end

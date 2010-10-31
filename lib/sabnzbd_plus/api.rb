# To change this template, choose Tools | Templates
# and open the template in the editor.
require File.dirname(__FILE__) + '/sabnzbd_plus_model/mapper'
require File.dirname(__FILE__) + '/sabnzbd_plus_model/slot'
require File.dirname(__FILE__) + '/sabnzbd_plus_model/queue'
require File.dirname(__FILE__) + '/sabnzbd_plus_model/api'

module SabnzbdPlus
  class Api
    def self.current_queue
      return SabnzbdPlusModel::Mapper.new.current_queue
    end

    def self.unannounced_added

    end

    def self.unannounced_history

    end


  end
end

# To change this template, choose Tools | Templates
# and open the template in the editor.
require File.dirname(__FILE__) + '/sabnzbd_plus_model/mapper'
require File.dirname(__FILE__) + '/sabnzbd_plus_model/verbose'
require File.dirname(__FILE__) + '/sabnzbd_plus_model/slot'
require File.dirname(__FILE__) + '/sabnzbd_plus_model/queue_slot'
require File.dirname(__FILE__) + '/sabnzbd_plus_model/stage_log'
require File.dirname(__FILE__) + '/sabnzbd_plus_model/history_slot'
require File.dirname(__FILE__) + '/sabnzbd_plus_model/history'
require File.dirname(__FILE__) + '/sabnzbd_plus_model/queue'
require File.dirname(__FILE__) + '/sabnzbd_plus_model/api'
require File.dirname(__FILE__) + '/sabnzbd_plus_api/current_queue'
require File.dirname(__FILE__) + '/sabnzbd_plus_api/unannounced_added'

module SabnzbdPlus
  class Api
    def self.current_queue
      return SabnzbdPlusApi::CurrentQueue.new.process
    end

    def self.unannounced_added
      return SabnzbdPlusApi::UnannouncedAdded.new.process
    end

    def self.unannounced_complete

    end


  end
end

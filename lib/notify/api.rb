# To change this template, choose Tools | Templates
# and open the template in the editor.
require File.dirname(__FILE__) + '/notify_api/added_nzb'
require File.dirname(__FILE__) + '/notify_api/completed_nzb'
require File.dirname(__FILE__) + '/notify_api/current_status'
require File.dirname(__FILE__) + '/notify_lib_notify/lib_notify'

module Notify
  class Api
    def initialize
      
    end

    def self.current_status(name, mb_left, mb, kb_per_sec, timeleft)
      announcer = NotifyApi::CurrentStatus.new
      announcer.name = name
      announcer.mb_left = mb_left
      announcer.mb = mb
      announcer.kb_per_sec = kb_per_sec
      announcer.timeleft = timeleft
      announcer.process
    end

    def self.added_nzb(name)
      announcer = NotifyApi::AddedNzb.new
      announcer.name = name
      announcer.process
    end

    def self.completed_nzb(name, status)
      announcer = NotifyApi::CompletedNzb.new
      announcer.name = name
      announcer.status = status
      announcer.process
    end
  end
end

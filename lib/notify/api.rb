$:.unshift File.join(File.expand_path(File.dirname(__FILE__)),'..','..','lib')

require 'notify/api/added_nzb'
require 'notify/api/completed_nzb'
require 'notify/api/current_status'
require 'notify/lib_notify/lib_notify'


module Notify
  class Api
    attr_accessor :notifier

    def initialize(notifier = NotifyLibNotify::LibNotify.new)
      self.notifier = notifier
    end

    def current_status(name, mb_left, mb, kb_per_sec, timeleft)
      announcer = NotifyApi::CurrentStatus.new(self.notifier)
      announcer.name = name
      announcer.mb_left = mb_left
      announcer.mb = mb
      announcer.kb_per_sec = kb_per_sec
      announcer.timeleft = timeleft
      announcer.process
    end

    def added_nzb(name)
      announcer = NotifyApi::AddedNzb.new(self.notifier)
      announcer.name = name
      announcer.process
    end

    def completed_nzb(name, status)
      announcer = NotifyApi::CompletedNzb.new(self.notifier)
      announcer.name = name
      announcer.status = status
      announcer.process
    end
  end
end

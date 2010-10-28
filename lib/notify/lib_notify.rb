# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'rnotify'

module Notify
  class LibNotify
    def initialize
      
    end

    def send(summary, msg, icon)
      notify = Notify::Notification.new(summary, msg, icon)
      notify.show
    end
  end
end

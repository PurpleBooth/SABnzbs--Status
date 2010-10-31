#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/notify/lib_notify'
require File.dirname(__FILE__) + '/sabnzbd_plus/api'

CHECK_EVERY_SECONDS = 60*5
## Tick Tock
while true
  queue = SabnzbdPlus::Api.current_queue
  
  queue.slots.each { |slot|
    announce = slot.filename + " ["+slot.mb_left+"MB/" + slot.mb + "MB @ "+queue.kb_per_sec+"KB/S ("+slot.timeleft+" timeleft)]"
    puts announce
    Notify::LibNotify.new.send announce
  }
  
  sleep CHECK_EVERY_SECONDS
end

#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/notify/lib_notify'
require File.dirname(__FILE__) + '/sabnzbd_plus/api'
require 'pp'


CHECK_EVERY_SECONDS = 60*5
## Tick Tock
while true
  added = SabnzbdPlus::Api.unannounced_added

  added.each { |slot|
    announce = "Added job " + slot.name
    puts announce
    Notify::LibNotify.new.send announce
  }

  queue = SabnzbdPlus::Api.current_queue
  
  queue.slots.each { |slot|
    announce = slot.name + " ["+slot.mb_left+"MB/" + slot.mb + "MB @ "+queue.kb_per_sec+"KB/S ("+slot.timeleft+" timeleft)]"
    puts announce
    Notify::LibNotify.new.send announce
  }

  complete = SabnzbdPlus::Api.unannounced_complete

  complete.each { |slot|
    announce = "Job " + slot.name + " " + slot.status
    puts announce
    Notify::LibNotify.new.send announce
  }
  
  sleep CHECK_EVERY_SECONDS
end

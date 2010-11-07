#!/usr/bin/env ruby

$:.unshift File.join(File.expand_path(File.dirname(__FILE__)))
require 'notify/api'
require 'sabnzbd_plus/api'

CHECK_EVERY_SECONDS = 60*5
## Tick Tock
while true
  added = SabnzbdPlus::Api.unannounced_added

  added.each { |slot|
    Notify::Api.new.added_nzb slot.name
  }

  queue = SabnzbdPlus::Api.current_queue
  
  queue.slots.each { |slot|
    Notify::Api.new.current_status(slot.name, slot.mb_left, slot.mb, queue.kb_per_sec, slot.timeleft)
  }

  complete = SabnzbdPlus::Api.unannounced_complete

  complete.each { |slot|
    Notify::Api.new.completed_nzb(slot.name, slot.status)
  }
  
  sleep CHECK_EVERY_SECONDS
end

#!/usr/bin/env ruby
# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.dirname(__FILE__) + '/notify/lib_notify'
require File.dirname(__FILE__) + '/sabnzbd_plus_model/sabnzbd_plus_mapper'
require File.dirname(__FILE__) + '/sabnzbd_plus_model/sabnzbd_plus_slot'
require File.dirname(__FILE__) + '/sabnzbd_plus_model/sabnzbd_plus_queue'
require File.dirname(__FILE__) + '/sabnzbd_plus_model/sabnzbd_plus_api'

## Tick Tock
while true

  queue = SabnzbdPlusModel::SabnzbdPlusMapper.new.current_queue
  queue.slots.each { |slot|
    puts slot.filename + " ["+slot.mb_left+"MB/" + slot.mb + "MB @ "+queue.kb_per_sec+"KB/S ("+slot.timeleft+" timeleft)]"
    Notify::LibNotify.new.send slot.filename + " ["+slot.mb_left+"MB/" + slot.mb + "MB @ "+queue.kb_per_sec+"KB/S ("+slot.timeleft+" timeleft)]"
  }
  
  sleep 60*5
end

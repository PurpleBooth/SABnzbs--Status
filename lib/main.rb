#!/usr/bin/env ruby
# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'notify/lib_notify'
require 'sabnzbd_plus_model/sabnzbd_plus_mapper'
require 'sabnzbd_plus_model/sabnzbd_plus_slot'
require 'sabnzbd_plus_model/sabnzbd_plus_api'

SabnzbdPlusModel::SabnzbdPlusMapper.new.eachSlots { |slot|
  puts slot.filename + " " + slot.percentage + "%"
  Notify::LibNotify.new.send(slot.filename + " " + slot.percentage + "%")
}

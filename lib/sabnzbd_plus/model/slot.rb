$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..','..','lib'))

module SabnzbdPlusModel
  class Slot

    attr_accessor :size, :script, :status, :nzo_id

    def initialize
      self.size   = nil
      self.script = nil
      self.status = nil
      self.nzo_id = nil
    end

    def self.factory(slot)
      if(slot.has_key?("filename"))
        return QueueSlot.from_hash(slot)
      elsif(slot.has_key?("name"))
        return HistorySlot.from_hash(slot)
      end

      return self.from_hash(slot)
    end

    def self.from_hash(slot)
      item = self.new

      item.size            = slot["size"]
      item.script          = slot["script"]
      item.status          = slot["status"]
      item.nzo_id          = slot["nzo_id"]

      return item
    end

    def ==(item)
      unless(
        item.size   == self.size &&
        item.script == self.script &&
        item.status == self.status &&
        item.nzo_id == self.nzo_id)

        return false
      end

      return true
    end

    def eql?(item)
      return (item.class == self.class && self == item)
    end
  end
end

# We require here so we don't get problems with ruby thinking we haven't defined
# slot yet when these files get included. Nightmare.
require 'sabnzbd_plus/model/history_slot'
require 'sabnzbd_plus/model/queue_slot'
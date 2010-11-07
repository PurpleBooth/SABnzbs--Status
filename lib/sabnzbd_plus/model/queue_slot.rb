$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..','..','lib'))

require 'sabnzbd_plus/model/slot'

module SabnzbdPlusModel
  class QueueSlot < Slot
    attr_accessor :index, :eta, :timeleft, :avg_age, :msg_id
    attr_accessor :verbosity, :mb, :filename, :priority, :cat, :mb_left
    attr_accessor :percentage, :unpack_opts

    def initialize
      
    end

    def self.from_hash(slot)
      item = super slot
      item.index       = slot["index"]
      item.eta         = slot["eta"]
      item.time_left   = slot["timeleft"]
      item.avg_age     = slot["avg_age"]
      item.msg_id      = slot["msgid"]
      item.verbosity   = slot["verbosity"]
      item.mb          = slot["mb"]
      item.filename    = slot["filename"]
      item.priority    = slot["priority"]
      item.cat         = slot["cat"]
      item.mb_left     = slot["mbleft"]
      item.percentage  = slot["percentage"]
      item.unpack_opts = slot["unpackopts"]

      return item
    end

    def name
      return self.filename
    end

    def name=(name)
      self.filename = name
    end

    def ==(item)
      unless(
        item.index       == self.index &&
        item.eta         == self.eta &&
        item.time_left   == self.time_left &&
        item.avg_age     == self.avg_age &&
        item.msg_id      == self.msg_id &&
        item.verbosity   == self.verbosity &&
        item.mb          == self.mb &&
        item.file_name   == self.file_name &&
        item.priority    == self.priority &&
        item.cat         == self.cat &&
        item.mb_left     == self.mb_left &&
        item.percentage  == self.percentage &&
        item.unpack_opts == self.unpack_opts &&
        item.actions     == self.actions)

        return false
      end

      return super item
    end

    def eql?(item)
      return (item.class == self.class && self == item)
    end
  end
end

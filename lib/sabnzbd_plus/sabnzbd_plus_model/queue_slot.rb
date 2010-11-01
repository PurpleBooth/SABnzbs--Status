
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
      item.timeleft    = slot["timeleft"]
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
  end
end


module SabnzbdPlusModel
  class SabnzbdPlusSlot
    attr_accessor :status, :index, :eta, :timeleft, :avg_age, :script, :msgid
    attr_accessor :verbosity, :mb, :filename, :priority, :cat, :mbleft
    attr_accessor :percentage, :nzo_id, :unpackopts, :size

    def initialize
      
    end

    def self.from_hash(slot)
      item = self.new
      item.status     = slot["status"]
      item.index      = slot["index"]
      item.eta        = slot["eta"]
      item.timeleft   = slot["timeleft"]
      item.avg_age    = slot["avg_age"]
      item.script     = slot["script"]
      item.msgid      = slot["msgid"]
      item.verbosity  = slot["verbosity"]
      item.mb         = slot["mb"]
      item.filename   = slot["filename"]
      item.priority   = slot["priority"]
      item.cat        = slot["cat"]
      item.mbleft     = slot["mbleft"]
      item.percentage = slot["percentage"]
      item.nzo_id     = slot["nzo_id"]
      item.unpackopts = slot["unpackopts"]
      item.size       = slot["size"]

      return item
    end
  end
end

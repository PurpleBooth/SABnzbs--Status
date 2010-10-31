
module SabnzbdPlusModel
  class Slot
    attr_accessor :status, :index, :eta, :timeleft, :avg_age, :script, :msg_id
    attr_accessor :verbosity, :mb, :filename, :priority, :cat, :mb_left
    attr_accessor :percentage, :nzo_id, :unpack_opts, :size

    def initialize
      
    end

    def self.from_hash(slot)
      item = self.new
      item.status      = slot["status"]
      item.index       = slot["index"]
      item.eta         = slot["eta"]
      item.timeleft    = slot["timeleft"]
      item.avg_age     = slot["avg_age"]
      item.script      = slot["script"]
      item.msg_id      = slot["msgid"]
      item.verbosity   = slot["verbosity"]
      item.mb          = slot["mb"]
      item.filename    = slot["filename"]
      item.priority    = slot["priority"]
      item.cat         = slot["cat"]
      item.mb_left     = slot["mbleft"]
      item.percentage  = slot["percentage"]
      item.nzo_id      = slot["nzo_id"]
      item.unpack_opts = slot["unpackopts"]
      item.size        = slot["size"]

      return item
    end
  end
end

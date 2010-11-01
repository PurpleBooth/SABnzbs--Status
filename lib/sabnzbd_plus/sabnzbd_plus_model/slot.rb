# To change this template, choose Tools | Templates
# and open the template in the editor.

module SabnzbdPlusModel
  class Slot
    attr_accessor :size, :script, :status, :nzo_id

    def initialize
      
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
  end
end

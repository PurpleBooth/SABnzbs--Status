# To change this template, choose Tools | Templates
# and open the template in the editor.

module NotifyApi
  class CurrentStatus
    attr_accessor :name, :mb_left, :mb, :kb_per_sec, :timeleft

    def initialize
      
    end

    def process
      announce = self.name + " ["+self.mb_left+"MB/" + self.mb + "MB @ "+self.kb_per_sec+"KB/S "+self.timeleft+" timeleft]"
      puts announce
      NotifyLibNotify::LibNotify.new.send announce
    end
  end
end

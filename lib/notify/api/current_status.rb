
module NotifyApi
  class CurrentStatus
    attr_accessor :name, :mb_left, :mb, :kb_per_sec, :timeleft
    attr_accessor :notifier

    def initialize(notifier = NotifyLibNotify::LibNotify.new)
      self.notifier = notifier
    end

    def process
      announce = self.name + " ["+self.mb_left+"MB/" + self.mb + "MB @ "+self.kb_per_sec+"KB/S "+self.timeleft+" timeleft]"

      self.notifier.send announce

      return announce
    end
  end
end

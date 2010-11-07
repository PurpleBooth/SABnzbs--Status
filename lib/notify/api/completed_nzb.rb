
module NotifyApi
  class CompletedNzb
    attr_accessor :name, :status
    attr_accessor :notifier

    def initialize(notifier = NotifyLibNotify::LibNotify.new)
      self.notifier = notifier
    end

    def process
      announce = "Job " + self.name + " " + self.status

      self.notifier.send announce

      return announce
    end
  end
end

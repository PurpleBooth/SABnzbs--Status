
module NotifyApi
  class AddedNzb
    attr_accessor :name
    attr_accessor :notifier

    def initialize(notifier = NotifyLibNotify::LibNotify.new)
      self.notifier = notifier
    end

    def process
      announce = "Added job " + self.name
      
      self.notifier.send announce

      return announce
    end
  end
end

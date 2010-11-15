# Classes for creating an abstraction layer for notifications
module NotifyApi

  # Announce that a file has been completed
  class CompletedNzb

    # @return [String]
    attr_accessor :name

    # @return [String]
    attr_accessor :status
    
    # @return [NotifyLibNotify::LibNotify]
    attr_accessor :notifier

    # Set the notification library to use, defaults to libnotify
    # @param [NotifyLibNotify::LibNotify] notifier
    def initialize(notifier = NotifyLibNotify::LibNotify.new)
      self.notifier = notifier
    end

    # Announce the job completion name with the name set in the class
    # Returns the message announced
    #
    # @see NotifyLibNotify::LibNotify#notify
    # @see NotifyApi::AddedNzb#name
    # @see NotifyApi::AddedNzb#status
    # @return [String]
    def process
      announce = "Job " + self.name + " " + self.status

      self.notifier.notify(announce)

      return announce
    end
  end
end

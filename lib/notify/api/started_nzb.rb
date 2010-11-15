# Classes for creating an abstraction layer for notifications
module NotifyApi
  # Announce the current speed, mb left, kb per sec, and time left
  class StartedNzb

    # @return [String] Name of the current download
    attr_accessor :name
    
    # @return [String] :mb_left MB left to download
    attr_accessor :mb_left

    # @return [String] :mb Total MB of file
    attr_accessor :mb

    # @return [String] :timeleft The time left in the download
    attr_accessor :time_left

    # @return [NotifyLibNotify::LibNotify]
    attr_accessor :notifier

    # Set the notification library to use, defaults to libnotify
    # @param [NotifyLibNotify::LibNotify] notifier
    def initialize(notifier = NotifyLibNotify::LibNotify.new)
      self.notifier = notifier
    end

    # Announce the job status with the name set in the class
    # Returns the message announced
    #
    # @see NotifyLibNotify::LibNotify#send
    # @see NotifyApi::CurrentStatus#name
    # @see NotifyApi::CurrentStatus#mb_left
    # @see NotifyApi::CurrentStatus#mb
    # @see NotifyApi::CurrentStatus#kb_per_sec
    # @see NotifyApi::CurrentStatus#time_left
    # @return [String]
    def process
      announce = "Downloading " + self.name + " ["+self.mb_left+"MB/" + self.mb + "MB "+self.time_left+" timeleft]"

      self.notifier.notify(announce)

      return announce
    end
  end
end

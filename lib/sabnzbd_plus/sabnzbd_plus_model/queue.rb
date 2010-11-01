
module SabnzbdPlusModel
  class Queue < Verbose
    attr_accessor :categories, :scripts, :slots, :refresh_rate, :is_verbose
    attr_accessor :start, :status, :finish, :newzbin_details, :limit
    attr_accessor :queue_details

    def initialize
      self.slots = []
    end

    def self.from_hash(queue)
      item = super queue
      item.categories         = queue["categories"]
      item.scripts            = queue["scripts"]

      queue["slots"].each { |slot|
        item.slots = item.slots << QueueSlot.from_hash(slot)
      }

      item.refresh_rate       = queue["refresh_rate"]
      item.is_verbose         = queue["isvebose"]
      item.start              = queue["start"]
      item.status             = queue["status"]
      item.finish             = queue["finish"]
      item.newzbin_details    = queue["newzbinDetails"]
      item.limit              = queue["limit"]
      item.queue_details      = queue["queue_details"]

      return item
    end

    def verbose?
      return self.is_verbose
    end
  end
end

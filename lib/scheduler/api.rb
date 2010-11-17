# Launches requests and notifications asynchronously
module Scheduler
  # Contains the clock ticker and the main activity
  class Api
    # Number of seconds to pause between triggering
    SCHEDULER_API_CHECK_EVERY_SECONDS = 60*5

    # Set the SABnzbd+ API, Notify API, Configuration
    def initialize(sabnzbd_plus_api = SabnzbdPlus::Api.new,
                   notify_api = Notify::Api.new,
                   config = Config::Config.new["notify_for"],
                   log = Log::Log.new)

      @sabnzbd_plus_api = sabnzbd_plus_api
      @notify_api = notify_api
      @config = config
      @log = log
    end

    # Spawn a new detached process that itself triggers off the methods listed
    # in the configuration file every X seconds
    #
    # @see Scheduler::Api#added
    # @see Scheduler::Api#active
    # @see Scheduler::Api#current
    # @see Scheduler::Api#complete
    # @see Scheduler::Api#SCHEDULER_API_CHECK_EVERY_SECONDS
    def clock
      @config.each do |method|
        Process.detach(fork {
          @log.log("Scheduler", "Api", "Detaching "+method)
          
          loop do
            self.send(method)
            sleep SCHEDULER_API_CHECK_EVERY_SECONDS
          end
        }) unless (method == "clock" || !self.respond_to?(method))
      end
    end

    # Triggers a new process that displays a message every time SABnzbd+
    # gets a new NZB added to it that has never been seen before (In the history
    # or in the queue)
    #
    # @see SabnzbdPlus::Api#unannounced_added
    # @see Notify::Api#added_nzb
    def added
      @sabnzbd_plus_api.unannounced_added.each do |slot|
        @notify_api.added_nzb({:name => slot.name})
      end
    end

    # Triggers a new process that displays a message every time SABnzbd+
    # gets a NZB in the queue moving to downloading from any other status
    #
    # @see SabnzbdPlus::Api#unannounced_active
    # @see Notify::Api#started_nzb
    def active
      @sabnzbd_plus_api.unannounced_active.each do |slot|
        @notify_api.started_nzb({:name => slot.name, :mb_left => slot.mb_left, :mb => slot.mb, :time_left => slot.time_left})
      end
    end

    # Triggers a new process that displays a message every time SABnzbd+
    # queries the queue and lists all the items in it
    #
    # @see SabnzbdPlus::Api#current_status
    # @see Notify::Api#current_status
    def current
      @log.log("Scheduler", "Api", "current tick")
      queue = @sabnzbd_plus_api.current_queue

      queue.slots.each do |slot|
        @notify_api.current_status({:name => slot.name, :mb_left => slot.mb_left, :mb => slot.mb, :kb_per_sec => queue.kb_per_sec, :time_left => slot.time_left})
      end
    end

    # Triggers a new process that displays a message every time SABnzbd+
    # sees an item in the history for the first time
    #
    # @see SabnzbdPlus::Api#unannounced_complete
    # @see Notify::Api#completed_nzb
    def complete
      @sabnzbd_plus_api.unannounced_complete.each do |slot|
        @notify_api.completed_nzb({:name => slot.name, :status => slot.status})
      end
    end
  end
end

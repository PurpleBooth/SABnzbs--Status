# To change this template, choose Tools | Templates
# and open the template in the editor.

module Scheduler
  class Api
    SCHEDULER_API_CHECK_EVERY_SECONDS = 60*5

    def initialize(sabnzbd_plus_api = SabnzbdPlus::Api.new, notify_api = Notify::Api.new, config = Config::Config.new["notify_for"])
      @sabnzbd_plus_api = sabnzbd_plus_api
      @notify_api = notify_api
      @config = config
    end

    def clock
      Process.detach(fork {
        loop do
          @config.each { |method|
            Process.detach(fork {
              self.send(method)
            }) unless (method == "clock" || !self.respond_to?(method))
          }

          sleep SCHEDULER_API_CHECK_EVERY_SECONDS
        end
      })
    end

    def added
      @sabnzbd_plus_api.unannounced_added.each { |slot|
        @notify_api.added_nzb({:name => slot.name})
      }
    end

    def active
      @sabnzbd_plus_api.unannounced_active.each { |slot|
        @notify_api.started_nzb({:name => slot.name, :mb_left => slot.mb_left, :mb => slot.mb, :time_left => slot.time_left})
      }
    end

    def current
      queue = @sabnzbd_plus_api.current_queue

      queue.slots.each { |slot|
        @notify_api.current_status({:name => slot.name, :mb_left => slot.mb_left, :mb => slot.mb, :kb_per_sec => queue.kb_per_sec, :time_left => slot.time_left})
      }
    end

    def complete
      @sabnzbd_plus_api.unannounced_complete.each { |slot|
        @notify_api.completed_nzb({:name => slot.name, :status => slot.status})
      }
    end
  end
end

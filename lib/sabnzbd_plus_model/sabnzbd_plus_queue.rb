# To change this template, choose Tools | Templates
# and open the template in the editor.

module SabnzbdPlusModel
  class SabnzbdPlusQueue
    attr_accessor :cache_limit, :categories, :scripts, :paused, :new_rel_url
    attr_accessor :restart_req, :slots, :help_uri, :uptime, :refresh_rate
    attr_accessor :is_verbose, :start, :version, :disk_space_total_2
    attr_accessor :color_scheme, :darwin, :nt, :status, :last_warning
    attr_accessor :have_warnings, :cache_art, :finish_action, :no_of_slots
    attr_accessor :cache_size, :finish, :new_release, :pause_int, :mb_left
    attr_accessor :disk_space_2, :disk_space_1, :disk_space_total_1, :time_left
    attr_accessor :mb, :newzbin_details, :eta, :nzb_quota, :load_avg, :limit
    attr_accessor :kb_per_sec, :speed_limit, :web_dir, :queue_details

    def initialize
      self.slots = []
    end

    def self.from_hash(queue)
      item = self.new
      item.cache_limit        = queue["cache_limit"]
      item.categories         = queue["categories"]
      item.scripts            = queue["scripts"]
      item.paused             = queue["paused"]
      item.new_rel_url        = queue["new_rel_url"]
      item.restart_req        = queue["restart_req"]

      queue["slots"].each { |slot|
        item.slots = item.slots << SabnzbdPlusSlot.from_hash(slot)
      }

      item.help_uri           = queue["helpuri"]
      item.uptime             = queue["uptime"]
      item.refresh_rate       = queue["refresh_rate"]
      item.is_verbose         = queue["isvebose"]
      item.start              = queue["start"]
      item.version            = queue["version"]
      item.disk_space_total_2 = queue["diskspacetotal2"]
      item.color_scheme       = queue["color_scheme"]
      item.darwin             = queue["darwin"]
      item.nt                 = queue["nt"]
      item.status             = queue["status"]
      item.last_warning       = queue["last_warning"]
      item.have_warnings      = queue["have_warnings"]
      item.cache_art          = queue["cache_art"]
      item.finish_action      = queue["finishaction"]
      item.no_of_slots        = queue["noofslots"]
      item.cache_size         = queue["cache_size"]
      item.finish             = queue["finish"]
      item.new_release        = queue["new_release"]
      item.pause_int          = queue["pause_int"]
      item.mb_left            = queue["mbleft"]
      item.disk_space_2       = queue["diskspace2"]
      item.disk_space_1       = queue["diskspace1"]
      item.disk_space_total_1 = queue["diskspacetotal1"]
      item.time_left          = queue["timeleft"]
      item.mb                 = queue["mb"]
      item.newzbin_details    = queue["newzbinDetails"]
      item.eta                = queue["eta"]
      item.nzb_quota          = queue["nzb_quota"]
      item.load_avg           = queue["loadavg"]
      item.limit              = queue["limit"]
      item.kb_per_sec         = queue["kbpersec"]
      item.speed_limit        = queue["speedlimit"]
      item.web_dir            = queue["webdir"]
      item.queue_details      = queue["queue_details"]

      return item
    end
  end
end

# To change this template, choose Tools | Templates
# and open the template in the editor.

module SabnzbdPlusModel
  class Verbose

    attr_accessor :cache_limit, :paused, :new_rel_url, :restart_req, :slots
    attr_accessor :help_uri, :uptime, :version, :disk_space_total_2
    attr_accessor :color_scheme, :darwin, :nt, :status, :last_warning
    attr_accessor :have_warnings, :cache_art, :finish_action, :no_of_slots
    attr_accessor :cache_size, :new_release, :pause_int, :mb_left, :disk_space_2
    attr_accessor :disk_space_1, :disk_space_total_1, :time_left, :mb, :eta
    attr_accessor :nzb_quota, :load_avg, :kb_per_sec, :speed_limit, :web_dir

    def initialize
      
    end

    def self.from_hash(response)
      item = self.new
      item.cache_limit        = response["cache_limit"]
      item.paused             = response["paused"]
      item.new_rel_url        = response["new_rel_url"]
      item.restart_req        = response["restart_req"]

      response["slots"].each{ |slot|
        item.slots = item.slots << Slot.factory(slot)
      }

      item.help_uri           = response["helpuri"]
      item.uptime             = response["uptime"]
      item.version            = response["version"]
      item.disk_space_total_2 = response["diskspacetotal2"]
      item.color_scheme       = response["color_scheme"]
      item.darwin             = response["darwin"]
      item.nt                 = response["nt"]
      item.status             = response["status"]
      item.last_warning       = response["last_warning"]
      item.have_warnings      = response["have_warnings"]
      item.cache_art          = response["cache_art"]
      item.finish_action      = response["finishaction"]
      item.no_of_slots        = response["noofslots"]
      item.cache_size         = response["cache_size"]
      item.new_release        = response["new_release"]
      item.pause_int          = response["pause_int"]
      item.mb_left            = response["mbleft"]
      item.disk_space_2       = response["diskspace2"]
      item.disk_space_1       = response["diskspace1"]
      item.disk_space_total_1 = response["diskspacetotal1"]
      item.time_left          = response["timeleft"]
      item.mb                 = response["mb"]
      item.eta                = response["eta"]
      item.nzb_quota          = response["nzb_quota"]
      item.load_avg           = response["loadavg"]
      item.kb_per_sec         = response["kbpersec"]
      item.speed_limit        = response["speedlimit"]
      item.web_dir            = response["webdir"]

      return item
    end
  end
end

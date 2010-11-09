$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..','..','lib'))

require 'sabnzbd_plus/model/slot'

module SabnzbdPlusModel
  class Verbose

    attr_accessor :cache_limit, :paused, :new_rel_url, :restart_req, :slots
    attr_accessor :help_uri, :uptime, :version, :disk_space_total_2
    attr_accessor :color_scheme, :darwin, :nt, :status, :last_warning
    attr_accessor :have_warnings, :cache_art, :finish_action, :no_of_slots
    attr_accessor :cache_size, :new_release, :pause_int, :mb_left, :disk_space_2
    attr_accessor :disk_space_1, :disk_space_total_1, :time_left, :mb, :eta
    attr_accessor :nzb_quota, :load_avg, :kb_per_sec, :speed_limit, :web_dir
    attr_accessor :active_lang, :session, :speed, :size, :cache_max
    attr_accessor :power_options, :paused_all, :size_left, :is_verbose

    def initialize
      self.slots = []
      self.cache_limit        = nil
      self.paused             = nil
      self.new_rel_url        = nil
      self.restart_req        = nil
      self.is_verbose         = nil
      self.help_uri           = nil
      self.uptime             = nil
      self.version            = nil
      self.disk_space_total_2 = nil
      self.color_scheme       = nil
      self.darwin             = nil
      self.nt                 = nil
      self.status             = nil
      self.last_warning       = nil
      self.have_warnings      = nil
      self.cache_art          = nil
      self.finish_action      = nil
      self.no_of_slots        = nil
      self.cache_size         = nil
      self.new_release        = nil
      self.pause_int          = nil
      self.mb_left            = nil
      self.disk_space_2       = nil
      self.disk_space_1       = nil
      self.disk_space_total_1 = nil
      self.time_left          = nil
      self.mb                 = nil
      self.eta                = nil
      self.nzb_quota          = nil
      self.load_avg           = nil
      self.kb_per_sec         = nil
      self.speed_limit        = nil
      self.web_dir            = nil
      self.active_lang        = nil
      self.session            = nil
      self.speed              = nil
      self.size               = nil
      self.cache_max          = nil
      self.power_options      = nil
      self.paused_all         = nil
      self.size_left          = nil
    end

    def self.from_hash(response)
      item = self.new
      item.cache_limit        = response["cache_limit"]
      item.paused             = response["paused"]
      item.new_rel_url        = response["new_rel_url"]
      item.restart_req        = response["restart_req"]

      unless response["slots"].nil?
        response["slots"].each{ |slot|
          item.slots = item.slots << Slot.factory(slot)
        }
      end

      item.is_verbose         = response["isverbose"]
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
      item.active_lang        = response["active_lang"]
      item.session            = response["session"]
      item.speed              = response["speed"]
      item.size               = response["size"]
      item.cache_max          = response["cache_max"]
      item.power_options      = response["power_options"]
      item.paused_all         = response["paused_all"]
      item.size_left          = response["sizeleft"]

      return item
    end

    def ==(item)
      unless(
        item.is_verbose         == self.is_verbose &&
        item.cache_limit        == self.cache_limit &&
        item.paused             == self.paused &&
        item.new_rel_url        == self.new_rel_url &&
        item.restart_req        == self.restart_req &&
        item.slots              == self.slots &&
        item.help_uri           == self.help_uri &&
        item.uptime             == self.uptime &&
        item.version            == self.version &&
        item.disk_space_total_2 == self.disk_space_total_2 &&
        item.color_scheme       == self.color_scheme &&
        item.darwin             == self.darwin &&
        item.nt                 == self.nt &&
        item.status             == self.status &&
        item.last_warning       == self.last_warning &&
        item.have_warnings      == self.have_warnings &&
        item.cache_art          == self.cache_art &&
        item.finish_action      == self.finish_action &&
        item.no_of_slots        == self.no_of_slots &&
        item.cache_size         == self.cache_size &&
        item.new_release        == self.new_release &&
        item.pause_int          == self.pause_int &&
        item.mb_left            == self.mb_left &&
        item.disk_space_2       == self.disk_space_2 &&
        item.disk_space_1       == self.disk_space_1 &&
        item.disk_space_total_1 == self.disk_space_total_1 &&
        item.time_left          == self.time_left &&
        item.mb                 == self.mb &&
        item.eta                == self.eta &&
        item.nzb_quota          == self.nzb_quota &&
        item.load_avg           == self.load_avg &&
        item.kb_per_sec         == self.kb_per_sec &&
        item.speed_limit        == self.speed_limit &&
        item.web_dir            == self.web_dir &&
        item.active_lang        == self.active_lang &&
        item.session            == self.session &&
        item.speed              == self.speed &&
        item.size               == self.size &&
        item.cache_max          == self.cache_max &&
        item.power_options      == self.power_options &&
        item.paused_all         == self.paused_all &&
        item.size_left          == self.size_left)

        return false
      end

      return true
    end

    def eql?(item)
      return (item.class == self.class && self == item)
    end
  end
end

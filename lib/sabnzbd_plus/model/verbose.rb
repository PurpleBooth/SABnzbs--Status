$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..','..','lib'))

require 'sabnzbd_plus/model/slot'
require 'sabnzbd_plus/model/response'

# Abstraction layer for interacting with SABnzbd+
module SabnzbdPlusModel
  # Basic response from Queue or History requests
  class Verbose < Response
    # @return [String]
    attr_accessor :cache_limit
    # @return [String]
    attr_accessor :paused
    # @return [String]
    attr_accessor :new_rel_url
    # @return [String]
    attr_accessor :restart_req
    # @return [Array<SabnzbdPlusModel::Slot>]
    attr_accessor :slots
    # @return [String]
    attr_accessor :help_uri
    # @return [String]
    attr_accessor :uptime
    # @return [String]
    attr_accessor :version
    # @return [String]
    attr_accessor :disk_space_total_2
    # @return [String]
    attr_accessor :color_scheme
    # @return [String]
    attr_accessor :darwin
    # @return [String]
    attr_accessor :nt
    # @return [String]
    attr_accessor :status
    # @return [String]
    attr_accessor :last_warning
    # @return [String]
    attr_accessor :have_warnings
    # @return [String]
    attr_accessor :cache_art
    # @return [String]
    attr_accessor :finish_action
    # @return [String]
    attr_accessor :no_of_slots
    # @return [String]
    attr_accessor :cache_size
    # @return [String]
    attr_accessor :new_release
    # @return [String]
    attr_accessor :pause_int
    # @return [String]
    attr_accessor :mb_left
    # @return [String]
    attr_accessor :disk_space_2
    # @return [String]
    attr_accessor :disk_space_1
    # @return [String]
    attr_accessor :disk_space_total_1
    # @return [String]
    attr_accessor :time_left
    # @return [String]
    attr_accessor :mb
    # @return [String]
    attr_accessor :eta
    # @return [String]
    attr_accessor :nzb_quota
    # @return [String]
    attr_accessor :load_avg
    # @return [String]
    attr_accessor :kb_per_sec
    # @return [String]
    attr_accessor :speed_limit
    # @return [String]
    attr_accessor :web_dir
    # @return [String]
    attr_accessor :active_lang
    # @return [String]
    attr_accessor :session
    # @return [String]
    attr_accessor :speed
    # @return [String]
    attr_accessor :size
    # @return [String]
    attr_accessor :cache_max
    # @return [String]
    attr_accessor :power_options
    # @return [String]
    attr_accessor :paused_all
    # @return [String]
    attr_accessor :size_left
    # @return [String]
    attr_accessor :is_verbose

    # Initialise the object
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

    # Set the attributes from a hash into the attributes of this object, so
    # @example
    #   {"total_size" => "bla"}
    # is equivalent to
    # @example
    #   total_size = "bla"
    #
    # @param [Hash<String, Hash>, Hash<String, String>]
    # @return [SabnzbdPlusModel::Verbose]
    def self.from_hash(response)
      item = super response

      unless response["slots"].nil?
        item.slots = []

        response["slots"].each{ |slot|
          item.slots = item.slots << Slot.factory(slot)
        }
      end

      return item
    end

    # Get the parameter mapping that maps the SABnzbd+ API parameter names to
    # their Rubyish equivalent
    #
    # @return [Hash<String, Label>]
    def self.parameter_mapping
      return {
        "isverbose"       => :is_verbose,
        "helpuri"         => :help_uri,
        "diskspacetotal2" => :disk_space_total_2,
        "finishaction"    => :finish_action,
        "noofslots"       => :no_of_slots,
        "mbleft"          => :mb_left,
        "diskspace2"      => :disk_space_2,
        "diskspace1"      => :disk_space_1,
        "diskspacetotal1" => :disk_space_total_1,
        "timeleft"        => :time_left,
        "loadavg"         => :load_avg,
        "kbpersec"        => :kb_per_sec,
        "speedlimit"      => :speed_limit,
        "webdir"          => :web_dir,
        "sizeleft"        => :size_left,
      }
    end

    # Compare this object with another slot object comparing only the
    # values in it's attributes.
    #
    # @param [SabnzbdPlusModel::Verbose] item
    # @return [Boolean]
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
  end
end

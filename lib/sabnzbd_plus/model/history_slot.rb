$:.unshift File.join(File.dirname(__FILE__),'..','..','..','lib')

require 'sabnzbd_plus/model/slot'
require 'sabnzbd_plus/model/stage_log'

# Abstraction layer for interacting with SABnzbd+
module SabnzbdPlusModel
  # Represents a single item in the slot field of a history
  class HistorySlot < Slot
    # @return [String]
    attr_accessor :action_line

    # @return [String] "False"/"True"
    attr_accessor :show_details

    # @return [String]
    attr_accessor :script_log

    # @return [String]
    attr_accessor :meta

    # @return [Boolean]
    attr_accessor :loaded

    # @return [String]
    attr_accessor :id

    # @return [String]
    attr_accessor :category

    # @return [String]
    attr_accessor :pp

    # @return [Integer]
    attr_accessor :completeness

    # @return [String]
    attr_accessor :fail_message

    # @return [String]
    attr_accessor :nzb_name

    # @return [Integer]
    attr_accessor :download_time

    # @return [String]
    attr_accessor :storage

    # @return [String]
    attr_accessor :script_line

    # @return [String]
    attr_accessor :filename
    
    # @return [Integer]
    attr_accessor :completed
    
    # @return [Integer]
    attr_accessor :downloaded

    # @return [String]
    attr_accessor :report

    # @return [String]
    attr_accessor :path

    # @return [SabnzbdPlusModel::StageLog]
    attr_accessor :stage_log

    # @return [Integer]
    attr_accessor :post_proc_time

    # @return [String]
    attr_accessor :name

    # @return [String]
    attr_accessor :url
    
    # @return [Integer]
    attr_accessor :bytes

    # @return [String]
    attr_accessor :url_info

    # Set the stage_log to an empty array
    def initialize
      self.stage_log = []
    end

    # Initialize a history slot from an hash
    #
    # @param [Hash] slot
    # @return [SabnzbdPlusModel::HistorySlot]
    def self.from_hash(slot)
      item = super(slot)

      if slot.key? "stage_log"
        item.stage_log = []

        slot["stage_log"].each { |log|
          item.stage_log = item.stage_log << StageLog.from_hash(log)
        }
      end

      return item
    end

    # Get the parameter mapping that maps the SABnzbd+ API parameter names to
    # their Rubyish equivalent
    #
    # @return [Hash<String, Label>]
    def self.parameter_mapping
      return super.merge({
          "postproc_time" => :post_proc_time
        })
    end

    # Compare this object with another slot object comparing only the
    # values in it's attributes.
    #
    # @param [SabnzbdPlusModel::HistorySlot] item
    # @return [Boolean]
    def ==(item)
      unless (self.action_line == item.action_line &&
        self.show_details == item.show_details &&
        self.script_log == item.script_log &&
        self.meta == item.meta &&
        self.loaded == item.loaded &&
        self.id == item.id &&
        self.category == item.category &&
        self.pp  == item.pp &&
        self.completeness == item.completeness &&
        self.fail_message == item.fail_message &&
        self.nzb_name == item.nzb_name &&
        self.download_time == item.download_time &&
        self.storage == item.storage &&
        self.script_line == item.script_line &&
        self.filename == item.filename &&
        self.completed == item.completed &&
        self.downloaded == item.downloaded &&
        self.report == item.report &&
        self.path == item.path &&
        self.stage_log == item.stage_log &&
        self.post_proc_time == item.post_proc_time &&
        self.name == item.name &&
        self.url == item.url &&
        self.bytes == item.bytes &&
        self.url_info == item.url_info)

        return false
      end

      return super(item)
    end
  end
end

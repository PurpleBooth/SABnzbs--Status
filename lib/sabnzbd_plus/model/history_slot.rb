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

    # Compare this object with another history slot object comparing only the
    # values in it's attributes.
    #
    # @see SabnzbdPlusModel::Slot#==
    # @param [SabnzbdPlusModel::HistorySlot] item
    # @return [Boolean]
    def ==(item)
      unless(
        item.action_line    == self.action_line &&
        item.show_details   == self.show_details &&
        item.script_log     == self.script_log &&
        item.meta           == self.meta &&
        item.loaded         == self.loaded &&
        item.id             == self.id &&
        item.category       == self.category &&
        item.filename       == self.filename &&
        item.pp             == self.pp &&
        item.completeness   == self.completeness &&
        item.fail_message   == self.fail_message &&
        item.nzb_name       == self.nzb_name &&
        item.download_time  == self.download_time &&
        item.script_line    == self.script_line &&
        item.completed      == self.completed &&
        item.downloaded     == self.downloaded &&
        item.report         == self.report &&
        item.path           == self.path &&
        item.stage_log      == self.stage_log &&
        item.post_proc_time == self.post_proc_time &&
        item.name           == self.name &&
        item.url            == self.url &&
        item.bytes          == self.bytes &&
        item.url_info       == self.url_info &&
        item.storage        == self.storage)

        return false
      end

      return super item
    end
  end
end

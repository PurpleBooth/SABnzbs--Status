$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..','..','lib'))

require 'sabnzbd_plus/model/slot'

# Abstraction layer for interacting with SABnzbd+
module SabnzbdPlusModel
  # A single queue slot item returned by SAB
  class QueueSlot < Slot
    # @return [String]
    attr_accessor :index

    # @return [String]
    attr_accessor :eta

    # @return [String]
    attr_accessor :time_left

    # @return [String]
    attr_accessor :avg_age

    # @return [String]
    attr_accessor :msg_id

    # @return [String]
    attr_accessor :verbosity

    # @return [String]
    attr_accessor :mb

    # @return [String]
    attr_accessor :filename

    # @return [String]
    attr_accessor :priority

    # @return [String]
    attr_accessor :cat

    # @return [String]
    attr_accessor :mb_left

    # @return [String]
    attr_accessor :percentage

    # @return [String]
    attr_accessor :unpack_opts

    # @return [String]
    attr_accessor :size_left

    # Get the parameter mapping that maps the SABnzbd+ API parameter names to
    # their Rubyish equivalent
    #
    # @return [Hash<String, Label>]
    def self.parameter_mapping
      return super.merge({
          "msgid" => :msg_id,
          "mbleft" => :mb_left,
          "unpackopts" => :unpack_opts,
          "sizeleft" => :size_left,
          "timeleft" => :time_left
        })
    end

    # Maps filename onto Name, so history and queue have a common name.
    #
    # @see SabnzbdPlusModel::QueueSlot#filename
    # @return [String]
    def name
      return self.filename
    end

    # Maps filename onto Name, so history and queue have a common name.
    #
    # @see SabnzbdPlusModel::QueueSlot#filename
    # @param [String] name
    def name=(name)
      self.filename = name
    end

    # Compare this object with another queue object comparing only the
    # values in it's attributes.
    #
    # @see SabnzbdPlusModel::Slot#==
    # @param [SabnzbdPlusModel::QueueSlot] item
    # @return [Boolean]
    def ==(item)
      unless(
        item.index       == self.index &&
        item.eta         == self.eta &&
        item.time_left   == self.time_left &&
        item.avg_age     == self.avg_age &&
        item.msg_id      == self.msg_id &&
        item.verbosity   == self.verbosity &&
        item.mb          == self.mb &&
        item.filename    == self.filename &&
        item.priority    == self.priority &&
        item.cat         == self.cat &&
        item.mb_left     == self.mb_left &&
        item.percentage  == self.percentage &&
        item.unpack_opts == self.unpack_opts)

        return false
      end

      return super item
    end

  end
end

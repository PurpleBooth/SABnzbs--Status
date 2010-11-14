$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..','..','lib'))

# Abstraction layer for interacting with SABnzbd+
module SabnzbdPlusModel
  # Single slot that could be returned by the API
  class Slot

    # @return [String]
    attr_accessor :size

    # @return [String]
    attr_accessor :script

    # @return [String]
    attr_accessor :status

    # @return [String]
    attr_accessor :nzo_id

    # Initialise the object
    def initialize
      self.size   = nil
      self.script = nil
      self.status = nil
      self.nzo_id = nil
    end

    # From a Hash create the appropriate QueueSlot, HistorySlot, or Slot
    #
    # @see SabnzbdPlusModel::QueueSlot#from_hash
    # @see SabnzbdPlusModel::HistorySlot#from_hash
    # @see SabnzbdPlusModel::Slot#from_hash
    # @param [Hash] slot
    # @return [Slot]
    def self.factory(slot)
      if(slot.has_key?("filename"))
        return QueueSlot.from_hash(slot)
      elsif(slot.has_key?("name"))
        return HistorySlot.from_hash(slot)
      end

      return self.from_hash(slot)
    end

    # Initialize a slot from an hash
    #
    # @param [Hash] slot
    # @return [SabnzbdPlusModel::Slot]
    def self.from_hash(slot)
      item = self.new

      slot.each { |key, value|
        unless self.parameter_mapping.key? key
          item.send(key.to_s+"=", value)
        else
          item.send(self.parameter_mapping[key].to_s+"=", value)
        end
      }

      return item
    end

    # Compare this object with another slot object comparing only the
    # values in it's attributes.
    #
    # @param [SabnzbdPlusModel::Slot] item
    # @return [Boolean]
    def ==(item)
      unless(
        item.size   == self.size &&
        item.script == self.script &&
        item.status == self.status &&
        item.nzo_id == self.nzo_id)

        return false
      end

      return true
    end

    # Get the parameter mapping that maps the SABnzbd+ API parameter names to
    # their Rubyish equivalent
    #
    # @return [Hash<String, Label>]
    def self.parameter_mapping
      return {}
    end
  end
end

# We require here so we don't get problems with ruby thinking we haven't defined
# slot yet when these files get included. Nightmare.
require 'sabnzbd_plus/model/history_slot'
require 'sabnzbd_plus/model/queue_slot'
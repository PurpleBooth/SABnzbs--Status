$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..','..','lib'))

require 'sabnzbd_plus/model/verbose'

# Abstraction layer for interacting with SABnzbd+
module SabnzbdPlusModel
  # Queue object returned by the SAB API
  class Queue < Verbose
    # @return [Array<String>]
    attr_accessor :categories

    # @return [Array<String>]
    attr_accessor :scripts

    # @return [Array<SabnzbdPlusModel::Slot>]
    attr_accessor :slots

    # @return [String]
    attr_accessor :refresh_rate

    # @return [Boolean]
    attr_accessor :is_verbose

    # @return [Integer]
    attr_accessor :start

    # @return [String]
    attr_accessor :status

    # @return [Integer]
    attr_accessor :finish

    # @return [Boolean]
    attr_accessor :newzbin_details

    # @return [Integer]
    attr_accessor :limit

    # @return [String]
    attr_accessor :queue_details

    # Initialize the default values
    def initialize
      self.slots = []
      self.categories = nil
      self.scripts = nil
      self.slots = nil
      self.refresh_rate = nil
      self.is_verbose = nil
      self.start = nil
      self.status = nil
      self.finish = nil
      self.newzbin_details = nil
      self.limit = nil
      self.queue_details = nil

      super
    end

    # Alias for is_verbose
    # @see SabnzbdPlusModel::Verbose#is_verbose
    # @return [Boolean]
    def verbose?
      return self.is_verbose
    end

    # Get the parameter mapping that maps the SABnzbd+ API parameter names to
    # their Rubyish equivalent
    #
    # @return [Hash<String, Label>]
    def self.parameter_mapping
      return super.merge({
          "newzbinDetails" => :newzbin_details
        })
    end

    # Compare this object with another queue object comparing only the
    # values in it's attributes.
    #
    # @see SabnzbdPlusModel::Verbose#==
    # @param [SabnzbdPlusModel::Verbose] item
    # @return [Boolean]
    def ==(item)
      unless(
        item.categories      == self.categories &&
        item.scripts         == self.scripts &&
        item.slots           == self.slots &&
        item.refresh_rate    == self.refresh_rate &&
        item.is_verbose      == self.is_verbose &&
        item.start           == self.start &&
        item.status          == self.status &&
        item.finish          == self.finish &&
        item.newzbin_details == self.newzbin_details &&
        item.limit           == self.limit &&
        item.queue_details   == self.queue_details)

        return false
      end

      return super item
    end
  end
end

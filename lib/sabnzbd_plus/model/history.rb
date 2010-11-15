$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..','..','lib'))

require 'sabnzbd_plus/model/verbose'

# Abstraction layer for interacting with SABnzbd+
module SabnzbdPlusModel
  # History slots and additional status information from SABnzbd+
  class History < Verbose
    # @return [String] Total size of downloaded files
    attr_accessor :total_size

    # @return [String] Total size of files downloaded this month
    attr_accessor :month_size

    # @return [String] Total size of files downloaded this week
    attr_accessor :week_size

    # @return [String] Colour scheme being used by the current template
    attr_accessor :color_scheme

    # Set the slots to an empty, and other values to nil then call the parent
    # initialiser
    #
    # @see SabnzbdPlusModel::Verbose#initialize
    def initialize
      self.slots = []
      self.total_size = nil
      self.month_size = nil
      self.week_size = nil
      self.color_scheme = nil

      super
    end

    # Compare this object with another slot object comparing only the
    # values in it's attributes.
    #
    # @param [SabnzbdPlusModel::Verbose] item
    # @return [Boolean]
    def ==(item)
      unless (self.slots == item.slots &&
        self.total_size == item.total_size &&
        self.month_size == item.month_size &&
        self.week_size == item.week_size &&
        self.color_scheme == item.color_scheme)

        return false
      end

      return super(item)
    end
  end
end

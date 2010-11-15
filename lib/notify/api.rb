$:.unshift File.join(File.expand_path(File.dirname(__FILE__)),'..','..','lib')

require 'notify/api/added_nzb'
require 'notify/api/completed_nzb'
require 'notify/api/current_status'
require 'notify/lib_notify/lib_notify'

# Classes for creating an abstraction layer for notifications
module Notify
  # Make various notifications regarding the state of SABnzbd
  class Api
    protected

    # Call an API method after setting the parameters provided in the hash
    # provided on it
    # 
    # @param [Label, String] api_method
    # @param [Hash] options
    def call_method(api_method, options = {})
      class_name = api_method.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
      api_method = NotifyApi.const_get(class_name).new(self.notifier)

      options.each { |key, value|
        api_method.send(key.to_s+"=", value)
      }

      return api_method.process
    end

    public

    # @return [NotifyLibNotify::LibNotify]
    attr_accessor :notifier

    # Set the notifier to use. Defaults to LibNotify
    #
    # @see NotifyLibNotify::LibNotify
    def initialize(notifier = NotifyLibNotify::LibNotify.new)
      self.notifier = notifier
    end

    # Announce the current speed, mb left, kb per sec, and time left
    #
    # @param [Hash] options the options to create a announcement with
    # @option options [String] :name Name of the current download
    # @option options [String] :mb_left MB left to download
    # @option options [String] :mb Total MB of file
    # @option options [String] :kb_per_sec Current speed of NZB
    # @option options [String] :time_left The time left in the download
    # @see NotifyApi::CurrentStatus
    def current_status(options = {})
      self.call_method(:current_status, options)
    end

    # Announce that a file has been added
    #
    # @param [Hash] options the options to create a announcement with
    # @option options [String] :name
    # @see NotifyApi::AddedNzb
    def added_nzb(options = {})
      self.call_method(:added_nzb, options)
    end

    # Announce that a file has been completed
    #
    # @param [Hash] options the options to create a announcement with
    # @option options [String] :name
    # @option options [String] :status
    # @see NotifyApi::CompletedNzb
    def completed_nzb(options = {})
      self.call_method(:completed_nzb, options)
    end
  end
end

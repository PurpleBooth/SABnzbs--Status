$:.unshift File.join(File.expand_path(File.dirname(__FILE__)),'..','..','lib')

require 'sabnzbd_plus/api/current_queue'
require 'sabnzbd_plus/api/unannounced_added'
require 'sabnzbd_plus/api/unannounced_complete'
require 'sabnzbd_plus/model/mapper'

# Abstraction layer for interacting with SABnzbd+
module SabnzbdPlus

  # Get status information about SABnzbd+ that needs to be announced
  class Api
    protected

    # Call an API method instantiating a new instance of it if it has not yet
    # been called.
    #
    # @param [Label, String] api_method
    # @return [Verbose, Slot]
    def call_method(api_method)
      unless @api.key?(api_method)
        class_name = api_method.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }

        @api[api_method] = SabnzbdPlusApi.const_get(class_name).new(@mapper)
      end

      return @api[api_method].process
    end
    
    public

    # Set up the mapper
    #
    # @param [SabnzbdPlusModel::Mapper] mapper Defaults to new instance of SabnzbdPlusModel::Mapper
    # @see SabnzbdPlusModel::Mapper
    def initialize(mapper = SabnzbdPlusModel::Mapper.new)
      @api = {}
      @mapper = mapper
    end

    # Get the current items that are being processed by SABnzbd+
    #
    # @see SabnzbdPlusApi::CurrentQueue
    # @return [Verbose]
    def current_queue
      return self.call_method "current_queue"
    end

    # Get all of the slots which are active or in history and that have not yet
    # been announced
    #
    # @see SabnzbdPlusApi::UnannouncedAdded
    # @return [Slot]
    def unannounced_added
      return self.call_method "unannounced_added"
    end

    # Get all of the slots which are in history and that have not yet been
    # announced
    #
    # @see SabnzbdPlusApi::UnannouncedComplete
    # @return [Slot]
    def unannounced_complete
      return self.call_method "unannounced_complete"
    end
  end
end

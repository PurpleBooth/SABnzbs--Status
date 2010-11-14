$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..','..','lib'))

require 'sabnzbd_plus/model/api/api'
require 'sabnzbd_plus/model/queue'
require 'sabnzbd_plus/model/history'

# Abstraction layer for interacting with SABnzbd+
module SabnzbdPlusModel
  # Map API calls into useful data getting methods, that return objects
  class Mapper

    public

    # Set the API
    #
    # @param [SabnzbdPlusModelApi::Api] api Defaults to new
    def initialize(api = SabnzbdPlusModelApi::Api.new)
      @api = api
    end

    # Get the current items in the queue
    #
    # @return [SabnzbdPlusModel::Queue]
    def current_queue
      query = @api.queue
      return Queue.from_hash(query["queue"])
    end

    # Get the current items in the history
    #
    # @return [SabnzbdPlusModel::History]
    def history
      query = @api.history
      return History.from_hash(query["history"])
    end
  end
end

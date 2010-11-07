$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..','..','lib'))

require 'sabnzbd_plus/model/api/api'
require 'sabnzbd_plus/model/queue'
require 'sabnzbd_plus/model/history'

module SabnzbdPlusModel
  class Mapper

    public
    def initialize(api = SabnzbdPlusModelApi::Api.new)
      @api = api
    end

    def current_queue
      query = @api.queue
      return Queue.from_hash(query["queue"])
    end

    def history
      query = @api.history
      return History.from_hash(query["history"])
    end
  end
end

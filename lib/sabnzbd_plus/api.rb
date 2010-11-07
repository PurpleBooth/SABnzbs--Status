$:.unshift File.join(File.expand_path(File.dirname(__FILE__)),'..','..','lib')

require 'sabnzbd_plus/api/current_queue'
require 'sabnzbd_plus/api/unannounced_added'
require 'sabnzbd_plus/api/unannounced_complete'
require 'sabnzbd_plus/model/mapper'

module SabnzbdPlus
  class Api
    protected

    def initialize(mapper = SabnzbdPlusModel::Mapper.new)
      @api = {}
      @mapper = mapper
    end

    def call_method(api_method)
      unless @api.key?(api_method)
        class_name = api_method.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }

        @api[api_method] = SabnzbdPlusApi.const_get(class_name).new(@mapper)
      end

      return @api[api_method].process
    end
    
    public

    def current_queue
      return self.call_method "current_queue"
    end

    def unannounced_added
      return self.call_method "unannounced_added"
    end

    def unannounced_complete
      return self.call_method "unannounced_complete"
    end
  end
end

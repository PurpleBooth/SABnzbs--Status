$:.unshift File.join(File.dirname(__FILE__),'..','..','..','..','..','lib')

require 'log/log'
require 'net/http'
require 'uri'
require 'cgi'
require 'json'
require 'config/config'

# Abstraction layer for interacting with SABnzbd+
module SabnzbdPlusModelApiCaller
  # Make a call to the SABnzbd+ API via the JSON RPC interface
  class HttpJson
    public

    # Configuration to use.
    #
    # @param [Config::Config] config
    def initialize(config = Config::Config.new["sabnzbd_plus"]["model"]["api"]["caller"]["http_json"])
      @config = config
    end

    # Call an API method
    #
    # @param [String] method
    # @param [String] params
    # @param [String] api_key Defaults to configuration value
    #
    # @return [Hash<String, String>, Hash<String, Boolean>, Hash<String, Integer>, Hash<String, Hash>]
    def call(method, params, api_key = @config["api_key"])
      url = URI.parse(@config["api_endpoint"]);
      params[:mode] = method
      params[:apikey] = api_key
      params[:output] = @config["api_output"]

      parameterised_path = "#{url.path}?".concat(params.collect { |key,value| "#{key}=#{CGI::escape(value.to_s)}" }.join('&'))

      response = Net::HTTP.get(url.host, parameterised_path, url.port)

      begin
         return JSON.parse(response)
      rescue JSON::ParserError => exception
        return response
      end
    end
  end
end

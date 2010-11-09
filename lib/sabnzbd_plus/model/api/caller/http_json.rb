$:.unshift File.join(File.dirname(__FILE__),'..','..','..','..','..','lib')

require 'net/http'
require 'uri'
require 'cgi'
require 'json'
require 'config/config'

module SabnzbdPlusModelApiCaller
  class HttpJson
    public

    def initialize
      @config = Config::Config.instance["sabnzbd_plus"]["model"]["api"]["caller"]["http_json"]
    end

    def call(method, params, api_key = @config["api_key"])
      url = URI.parse(@config["api_endpoint"]);
      params[:mode] = method
      params[:apikey] = api_key
      params[:output] = @config["api_output"]

      parameterised_path = "#{url.path}?".concat(params.collect { |key,value| "#{key}=#{CGI::escape(value.to_s)}" }.join('&'))

      response = Net::HTTP.get(url.host, parameterised_path, url.port)

      return JSON.parse response
    end
  end
end

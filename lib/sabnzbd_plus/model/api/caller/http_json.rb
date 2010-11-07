require 'net/http'
require 'uri'
require 'cgi'
require 'json'

module SabnzbdPlusModelApiCaller
  class HttpJson
    protected

    API_KEY = "48e93e8b1aaf946f541cc5118a531f48"
    API_ENDPOINT = "http://127.0.0.1:8880/api";
    API_JSON_OUTPUT = "json"

    public

    def initialize
      
    end

    def call(method, params, api_key = API_KEY)
      url = URI.parse(API_ENDPOINT);
      params[:mode] = method
      params[:apikey] = api_key
      params[:output] = API_JSON_OUTPUT

      parameterised_path = "#{url.path}?".concat(params.collect { |key,value| "#{key}=#{CGI::escape(value.to_s)}" }.join('&'))

      response = Net::HTTP.get(url.host, parameterised_path, url.port)

      my_file = File.new("/tmp/"+method, "w+")
      my_file.puts response

      return JSON.parse response
    end
  end
end

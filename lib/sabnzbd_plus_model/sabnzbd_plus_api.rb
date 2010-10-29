require 'net/http'
require 'uri'
require 'cgi'
require 'json'

module SabnzbdPlusModel
  class SabnzbdPlusApi
    API_KEY = "48e93e8b1aaf946f541cc5118a531f48"
    API_ENDPOINT = "http://127.0.0.1:8880/api";
    API_JSON_OUTPUT = "json"

    def initialize
      
    end

    def call(method, params, api_key = API_KEY)
      url = URI.parse(API_ENDPOINT);
      params[:mode] = method
      params[:apikey] = api_key
      params[:output] = API_JSON_OUTPUT
      
      parameterised_path = "#{url.path}?".concat(params.collect { |key,value| "#{key}=#{CGI::escape(value.to_s)}" }.join('&'))
      raw_json = Net::HTTP.get url.host, parameterised_path, url.port

      return JSON.parse raw_json
    end

    def qstatus
      return self.call("qstatus", {})
    end

    def queue(name=nil, value=nil, value2 = nil)
      params = {}
      params[:name] = name unless name.nil?
      params[:value] = value unless value.nil?
      params[:value2] = value2 unless value2.nil?

      return self.call("queue", params)
    end

    def history(start=nil, limit=nil, name = nil, value = nil)
      params = {}
      params[:start] = start unless start.nil?
      params[:limit] = limit unless limit.nil?
      params[:name] = name unless name.nil?
      params[:value] = value unless value.nil?

      return self.call("history", params)
    end

    def version
      return self.call("version", {})
    end

    def warnings
      return self.call("warnings", {})
    end

    def get_cats
      return self.call("get_cats", {})
    end

    def get_scripts
      return self.call("get_scripts", {})
    end

    def restart
      return self.call("restart", {})
    end

    def switch(value, value2)
      params = {}
      params[:value] = value unless value.nil?
      params[:value2] = value2 unless value2.nil?

      return self.call("switch", params)
    end

    def pause
      return self.call("pause", {})
    end

    def config(name, value)
      params = {}
      params[:name] = name
      params[:value] = value

      return self.call("config", params)
    end

    def resume
      return self.call("resume", {})
    end

    def shutdown
      return self.call("shutdown", {})
    end

    def addurl(name, nzbname, pp = nil, script = nil, cat = nil, priority = nil)
      params = {}
      params[:name] = name
      params[:nzbname] = nzbname
      params[:pp] = pp unless pp.nil?
      params[:script] = script unless script.nil?
      params[:cat] = cat unless cat.nil?
      params[:priority] = priority unless priority.nil?

      return self.call("addurl", params)
    end

    def addid(name, pp = nil, script = nil, cat = nil, priority = nil)
      params = {}
      params[:name] = name
      params[:pp] = pp unless pp.nil?
      params[:script] = script unless script.nil?
      params[:cat] = cat unless cat.nil?
      params[:priority] = priority unless priority.nil?

      return self.call("addid", params)
    end

    def addlocalfile(name, pp = nil, script = nil, cat = nil, priority = nil)
      params = {}
      params[:name] = name
      params[:pp] = pp unless pp.nil?
      params[:script] = script unless script.nil?
      params[:cat] = cat unless cat.nil?
      params[:priority] = priority unless priority.nil?

      return self.call("addlocalfile", params)
    end

    def change_script(value, value2)
      params = {}
      params[:value] = value unless value.nil?
      params[:value2] = value2 unless value2.nil?

      return self.call("change_script", params)
    end

    def change_cat(value, value2)
      params = {}
      params[:value] = value unless value.nil?
      params[:value2] = value2 unless value2.nil?

      return self.call("change_cat", params)
    end

    def change_opts(value, value2)
      params = {}
      params[:value] = value unless value.nil?
      params[:value2] = value2 unless value2.nil?

      return self.call("change_opts", params)
    end

    def get_files(value)
      params = {}
      params[:value] = value unless value.nil?

      return self.call("get_files", params)
    end

    def retry(value)
      params = {}
      params[:value] = value unless value.nil?

      return self.call("retry", params)
    end
  end
end

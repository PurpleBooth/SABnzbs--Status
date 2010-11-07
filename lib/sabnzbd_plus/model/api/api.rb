$:.unshift File.expand_path(File.join(File.dirname(__FILE__),'..','..','..','..','lib'))

require 'sabnzbd_plus/model/api/caller/http_json'

module SabnzbdPlusModelApi
  class Api
    def initialize(caller = SabnzbdPlusModelApiCaller::HttpJson.new)
      @caller = caller
    end

    def qstatus
      return @caller.call("qstatus", {})
    end

    def queue(name=nil, value=nil, value2 = nil)
      params = {}
      params[:name] = name unless name.nil?
      params[:value] = value unless value.nil?
      params[:value2] = value2 unless value2.nil?

      return @caller.call("queue", params)
    end

    def history(start=nil, limit=nil, name = nil, value = nil)
      params = {}
      params[:start] = start unless start.nil?
      params[:limit] = limit unless limit.nil?
      params[:name] = name unless name.nil?
      params[:value] = value unless value.nil?

      return @caller.call("history", params)
    end

    def version
      return @caller.call("version", {})
    end

    def warnings
      return @caller.call("warnings", {})
    end

    def get_cats
      return @caller.call("get_cats", {})
    end

    def get_scripts
      return @caller.call("get_scripts", {})
    end

    def restart
      return @caller.call("restart", {})
    end

    def switch(value, value2)
      params = {}
      params[:value] = value unless value.nil?
      params[:value2] = value2 unless value2.nil?

      return @caller.call("switch", params)
    end

    def pause
      return @caller.call("pause", {})
    end

    def config(name, value)
      params = {}
      params[:name] = name
      params[:value] = value

      return @caller.call("config", params)
    end

    def resume
      return @caller.call("resume", {})
    end

    def shutdown
      return @caller.call("shutdown", {})
    end

    def addurl(name, nzbname, pp = nil, script = nil, cat = nil, priority = nil)
      params = {}
      params[:name] = name
      params[:nzbname] = nzbname
      params[:pp] = pp unless pp.nil?
      params[:script] = script unless script.nil?
      params[:cat] = cat unless cat.nil?
      params[:priority] = priority unless priority.nil?

      return @caller.call("addurl", params)
    end

    def addid(name, pp = nil, script = nil, cat = nil, priority = nil)
      params = {}
      params[:name] = name
      params[:pp] = pp unless pp.nil?
      params[:script] = script unless script.nil?
      params[:cat] = cat unless cat.nil?
      params[:priority] = priority unless priority.nil?

      return @caller.call("addid", params)
    end

    def addlocalfile(name, pp = nil, script = nil, cat = nil, priority = nil)
      params = {}
      params[:name] = name
      params[:pp] = pp unless pp.nil?
      params[:script] = script unless script.nil?
      params[:cat] = cat unless cat.nil?
      params[:priority] = priority unless priority.nil?

      return @caller.call("addlocalfile", params)
    end

    def change_script(value, value2)
      params = {}
      params[:value] = value unless value.nil?
      params[:value2] = value2 unless value2.nil?

      return @caller.call("change_script", params)
    end

    def change_cat(value, value2)
      params = {}
      params[:value] = value unless value.nil?
      params[:value2] = value2 unless value2.nil?

      return @caller.call("change_cat", params)
    end

    def change_opts(value, value2)
      params = {}
      params[:value] = value unless value.nil?
      params[:value2] = value2 unless value2.nil?

      return @caller.call("change_opts", params)
    end

    def get_files(value)
      params = {}
      params[:value] = value unless value.nil?

      return @caller.call("get_files", params)
    end

    def retry(value)
      params = {}
      params[:value] = value unless value.nil?

      return @caller.call("retry", params)
    end
  end
end

$:.unshift File.join(File.dirname(__FILE__),'..','..','..','..','..')

require 'json'
require 'digest/sha2'
require 'config/config'

module SabnzbdPlusModelApiCaller
  class Test
    public

    def initialize
      @config = Config::Config.instance["sabnzbd_plus"]["model"]["api"]["caller"]["test"]
    end

    def call(method, params, api_key = @config["api_key"])
      unique = {:method => method, :params => params, :api_key => api_key}.to_json
      digest = Digest::SHA2.new(512).hexdigest(unique)
      path   = File.join(File.expand_path(@config["fixtures_directory"]), method, digest + ".json")

      unless File.exists? path
        raise FixtureNotFoundException, "Could not find fixture ["+path+"]"
      end

      fixture = ""

      File.open(path) do |file|
        line = file.gets

        while line
          fixture = fixture + line
          line = file.gets
        end
      end

      return JSON.parse(fixture)
    end
  end
end
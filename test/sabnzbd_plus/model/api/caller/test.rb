$:.unshift File.join(File.dirname(__FILE__),'..','..','..','..','..')

require 'json'
require 'digest/sha2'
require 'config/config'

module SabnzbdPlusModelApiCaller
  class Test


    attr_accessor :fixture_name

    def initialize(config = Config::Config.new["sabnzbd_plus"]["model"]["api"]["caller"]["test"])
      @config = config
      self.fixture_name = nil
    end

    def call(method, params, api_key = @config["api_key"])
      unique = {:method => method, :params => params, :api_key => api_key}.to_json

      if self.fixture_name.nil?
        self.fixture_name = Digest::SHA2.new(512).hexdigest(unique)
      end

      Log::Log.new.log("SabnzbdPlusModelApiCaller", "Test","Loading fixture for request \"" +unique+"\"")
      path   = File.join(File.expand_path(@config["fixtures_directory"]), method, self.fixture_name + ".json")

      unless File.exists? path
        Log::Log.new.log("SabnzbdPlusModelApiCaller", "Test","Could not find fixture \""+path+"\"")
        raise FixtureNotFoundException, "Could not find fixture ["+path+"]"
      end

      Log::Log.new.log("SabnzbdPlusModelApiCaller", "Test","Loading fixture \""+path+"\"")

      fixture = ""

      File.open(path) do |file|
        line = file.gets

        while line
          fixture = fixture + line
          line = file.gets
        end
      end

      begin
         return JSON.parse(fixture)
      rescue JSON::ParserError => exception
        return fixture
      end
    end
  end
end
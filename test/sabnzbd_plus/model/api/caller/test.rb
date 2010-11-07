require 'json'
require 'digest/sha2'

module SabnzbdPlusModelApiCaller
  class Test
    protected

    API_KEY = "Mock API Key"
    FIXTURES_DIRECTORY = File.expand_path(File.join(File.dirname(__FILE__),'..','..','..','..','fixtures','SABnzbd+'))
    

    public

    def call(method, params, api_key = API_KEY)
      unique = {:method => method, :params => params, :api_key => api_key}.to_json
      digest = Digest::SHA2.new(512).hexdigest(unique)
      path   = File.join(File.expand_path(FIXTURES_DIRECTORY), method, digest + ".json")

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
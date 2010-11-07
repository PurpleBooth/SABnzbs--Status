require 'yaml'

module Config
  class Config
    CONFIG_FILE = File.expand_path(File.join(File.dirname(__FILE__),'..','..','configuration', 'main.yml'))

    @@configuration = nil

    def self.instance
      @@configuration = Config.new if @@configuration.nil?

      return @@configuration
    end

    def initialize
      @config = self.load
    end

    def [](key)
      return @config[key];
    end

    def []=(key, value)
      @config[key]= value;
      self.save();
    end

    def save
      File.open(CONFIG_FILE, 'w') { |file_handle| 
        YAML.dump(@config, file_handle) 
      }

      self.load()
    end

    def load
      @config = YAML.load_file(Config::CONFIG_FILE)
    end
  end
end

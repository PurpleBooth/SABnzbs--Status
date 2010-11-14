require 'yaml'

# Classes responsible for accessing the configuration
module Config
  # Access and manipulate the configuration file for this project
  class Config
    # Absolute path the the configuration file to manipulate
    CONFIG_FILE = File.expand_path(File.join(File.dirname(__FILE__),'..','..','configuration', 'main.yml'))

    # Load the configuration file
    # @see Config#load
    def initialize()
      @config = self.load
    end

    # Get a value with the given key from the configuration
    #
    # @return [String, YAML]
    def [](key)
      return @config[key];
    end

    # Set a key value pair in the configuration then saves the configuration
    #
    # @see Config#save
    # @param [String] key
    # @param [String] value
    def []=(key, value)
      @config[key]= value;
      self.save();
    end

    # Write the configuration to a YAML file and reload the configuration from
    # the file
    # 
    # @see Config#load
    def save
      File.open(CONFIG_FILE, 'w') { |file_handle| 
        YAML.dump(@config, file_handle) 
      }

      self.load()
    end

    # Load the configuration from file
    def load
      @config = YAML.load_file(Config::CONFIG_FILE)
    end
  end
end

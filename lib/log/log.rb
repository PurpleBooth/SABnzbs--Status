require 'time'

module Log
  class Log
    def self.instance
      @@instance = self.new

      return @@instance
    end

    def initialize
      @config = Config::Config.instance["log"]["log"]
    end

    def log(module_name, class_name, message)
      File.open(@config["file"], 'a') { |file_handle|
        file_handle.puts "["+Time.now.iso8601+"]["+module_name+"]["+class_name+"] "+message
      }
    end
  end
end

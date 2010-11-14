require 'time'

# Classes for writing a log
module Log
  # Write an informative message about the state of the program to a file
  class Log

    # Set the configuration to use
    def initialize(config = Config::Config.new["log"]["log"])
      @config = config
    end

    # Write a line to a configuration which is like
    # [2010-11-13T11:55:00+00:00][SabnzbdPlusModelApiCaller][Test] Loading fixture for request "{"api_key":"Mock API Key","params":{},"method":"history"}"
    # Where [timestamp][module_name][class_name] message
    #
    # @param [String] module_name
    # @param [String] class_name
    # @param [String] message
    def log(module_name, class_name, message)
      File.open(@config["file"], 'a') { |file_handle|
        file_handle.puts "["+Time.now.iso8601+"]["+module_name+"]["+class_name+"] "+message
      }
    end
  end
end

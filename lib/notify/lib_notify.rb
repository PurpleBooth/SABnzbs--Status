require 'escape'

module Notify
  class LibNotify
    def initialize
      
    end

    def send(msg)
      announce = "notify-send -i "+Escape.shell_command(self.icon).to_s+" "+Escape.shell_command("SABnzbd+ Status").to_s+" "+ Escape.shell_command(msg).to_s
      system(announce)
    end

    def icon
      return File.dirname(File.expand_path(__FILE__)) + '/../../resources/images/favicon.ico'
    end
  end
end

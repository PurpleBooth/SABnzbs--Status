require 'escape'

module NotifyLibNotify
  class LibNotify
    def initialize
      
    end

    def send(msg)
      system(self.shell_command(msg))
    end

    def icon
      return File.dirname(File.expand_path(__FILE__)) + '/../../resources/images/favicon.ico'
    end

    def shell_command(msg)
      return "notify-send -i "+Escape.shell_command(self.icon).to_s+" "+Escape.shell_command("SABnzbd+ Status").to_s+" "+ Escape.shell_command(msg).to_s
    end
  end
end

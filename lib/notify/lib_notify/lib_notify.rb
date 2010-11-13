require 'escape'

module NotifyLibNotify
  class LibNotify

    NOTIFY_LIB_NOTIFY_ICON_DIRECTORY = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'resources', 'images'))

    def initialize(config = Config::Config.new["notify"]["lib_notify"])
      @config = config
    end

    def send(msg)
      system(self.shell_command(msg))
    end

    def icon
      return File.join(NOTIFY_LIB_NOTIFY_ICON_DIRECTORY, @config["icon"])
    end

    def shell_command(msg)
      return "notify-send -i "+Escape.shell_command(self.icon).to_s+" "+Escape.shell_command("SABnzbd+ Status").to_s+" "+ Escape.shell_command(msg).to_s
    end
  end
end

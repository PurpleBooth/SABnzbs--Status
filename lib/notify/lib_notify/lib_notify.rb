require 'escape'

# Classes for creating an abstraction layer for notifications
module NotifyLibNotify
  # Popup a notification using libnotify with the SABnzbd+ icon
  class LibNotify

    # Directory to look for icon in
    NOTIFY_LIB_NOTIFY_ICON_DIRECTORY = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'resources', 'images'))

    # Load the configuration, defaults to notify -> lib_notify
    def initialize(config = Config::Config.new["notify"]["lib_notify"])
      @config = config
    end

    # Execute the shell command, popping up the notification for the user
    #
    # @param [String] msg Message to display
    def send(msg)
      system(self.shell_command(msg))
    end

    # Get the full path to the icon to be used on the notification
    #
    # @return [String]
    def icon
      return File.join(NOTIFY_LIB_NOTIFY_ICON_DIRECTORY, @config["icon"])
    end

    # Get the shell command escaped and as a string that will be executed to
    # generate the pop-up.
    #
    # @return [String]
    def shell_command(msg)
      return "notify-send -i "+Escape.shell_command(self.icon).to_s+" "+Escape.shell_command("SABnzbd+ Status").to_s+" "+ Escape.shell_command(msg).to_s
    end
  end
end

require 'glib2'
require 'rnotify'

# Classes for creating an abstraction layer for notifications
module NotifyLibNotify
  # Popup a notification using libnotify with the SABnzbd+ icon
  class LibNotify

    # Directory to look for icon in
    NOTIFY_LIB_NOTIFY_ICON_DIRECTORY = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'resources', 'images'))

    # Load the configuration, defaults to notify -> lib_notify
    def initialize(config = Config::Config.new["notify"]["lib_notify"], log = Log::Log.new)
      @config = config
      @log = log
    end

    # Execute the shell command, popping up the notification for the user
    #
    # @param [String] msg Message to display
    def notify(msg)
      @log.log("NotifyLibNotify", "LibNotify", "Announcing \""+msg+"\"")
      
      process_id = fork do
        Notify.init("SABnzbd+ Status")
        notif = Notify::Notification.new("SABnzbd+ Status", msg, self.icon, nil)
        notif.timeout = 5000
        notif.show
        sleep 6
        notif.close
        Notify.uninit()
      end

      Process.detach(process_id)
    end

    # Get the full path to the icon to be used on the notification
    #
    # @return [String]
    def icon
      return File.join(NOTIFY_LIB_NOTIFY_ICON_DIRECTORY, @config["icon"])
    end
  end
end

# To change this template, choose Tools | Templates
# and open the template in the editor.

module Notify
  class LibNotify
    def initialize
      
    end

    def send(msg)
      system("notify-send", "SABnzbd+ Status", msg)
    end
  end
end

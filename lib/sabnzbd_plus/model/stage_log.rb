require 'sabnzbd_plus/model/response'

# Abstraction layer for interacting with SABnzbd+
module SabnzbdPlusModel
  # Log messages regarding the scripts exit status
  class StageLog < Response
    # @return [String]
    attr_accessor :name

    # @return [Array<String>]
    attr_accessor :actions

    # Initialise the object
    def initialize
      self.actions = []
      self.name    = nil
    end

    # Compare this object with another stage object comparing only the
    # values in it's attributes.
    #
    # @param [SabnzbdPlusModel::StageLog] item
    # @return [Boolean]
    def ==(item)
      unless(
        item.name    == self.name &&
        item.actions == self.actions)

        return false
      end

      return true
    end
    
  end
end

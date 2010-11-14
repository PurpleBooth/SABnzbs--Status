$:.unshift File.join(File.expand_path(File.dirname(__FILE__)),'..','..','lib')

require 'sabnzbd_plus/model/mapper'

# Abstraction layer for interacting with SABnzbd+
module SabnzbdPlusApi
  # Get all of the slots which are in history and that have not yet been
  # announced
  class UnannouncedComplete

    # Load the mapper, empty the list of announced nzo ids
    #
    # @param [SabnzbdPlusModel::Mapper] mapper defaults to new SabnzbdPlusModel::Mapper
    def initialize(mapper = SabnzbdPlusModel::Mapper.new)
      @announced_nzos = []
      @mapper = mapper
    end

    # Get all of the slots which are in history and that have not yet been
    # announced
    #
    # @see SabnzbdPlusModel::Model#history
    # @see SabnzbdPlusModel::HistorySlot
    # @return [Array<HistorySlot>]
    def process
      return_array = []
      history = @mapper.history
      
      history.slots.each { |slot|
        unless @announced_nzos.include? slot.nzo_id
          return_array = return_array << slot
          @announced_nzos = @announced_nzos << slot.nzo_id
        end
      }

      return return_array
    end
  end
end

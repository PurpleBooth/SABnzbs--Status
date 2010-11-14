# Abstraction layer for interacting with SABnzbd+
module SabnzbdPlusApi
  # Get all of the slots which are active or in history and that have not yet
  # been announced
  class UnannouncedAdded

    # Load the mapper, empty the list of announced nzo ids
    #
    # @param [SabnzbdPlusModel::Mapper] mapper defaults to new SabnzbdPlusModel::Mapper
    def initialize(mapper = SabnzbdPlusModel::Mapper.new)
      @mapper = mapper
      @announced_nzos = []
    end

    # Get all of the unannounced history and queue slots
    #
    # @see SabnzbdPlusModel::Mapper#current_queue
    # @see SabnzbdPlusModel::Mapper#history
    # @return [Array<Slot>]
    def process
      queue = @mapper.current_queue
      return_array = []

      queue.slots.each { |slot|
        unless @announced_nzos.include? slot.nzo_id
          return_array = return_array << slot
          @announced_nzos = @announced_nzos << slot.nzo_id
        end
      }

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

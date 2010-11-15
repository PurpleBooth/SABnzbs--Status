
# Abstraction layer for interacting with SABnzbd+
module SabnzbdPlusApi
  # Get the items in the current queue that haven't been announced yet that
  # have a status of Downloading
  #
  # Re-announces if the status changes from downloaded and then back again.
  class UnannouncedActive

    # Load the mapper
    #
    # @param [SabnzbdPlusModel::Mapper] mapper defaults to new SabnzbdPlusModel::Mapper
    def initialize(mapper = SabnzbdPlusModel::Mapper.new)
      @mapper = mapper
      @announced_nzos = []
    end

    # Get the items in the current queue that haven't been announced yet that
    # have a status of Downloading
    #
    # Re-announces if the status changes from downloaded and then back again.
    # 
    # @see SabnzbdPlusModel::Mapper#current_queue
    # @return [Array<Slot>]
    def process
      return_array = []

      @mapper.current_queue.slots.each { |slot|
        unless @announced_nzos.include? slot.nzo_id
          if slot.status == "Downloading"
            return_array = return_array << slot
            @announced_nzos << slot.nzo_id
          else
            @announced_nzos.delete slot.nzo_id
          end
        end
      }

      return return_array
    end
  end
end

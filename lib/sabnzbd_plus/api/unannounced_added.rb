# To change this template, choose Tools | Templates
# and open the template in the editor.

module SabnzbdPlusApi
  class UnannouncedAdded
    def initialize(mapper = SabnzbdPlusModel::Mapper.new)
      @mapper = mapper
      @announced_nzos = []
    end

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

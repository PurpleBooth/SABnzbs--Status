# To change this template, choose Tools | Templates
# and open the template in the editor.

module SabnzbdPlusApi
  class UnannouncedAdded
    @@announced_nzos = []

    def initialize
      
    end

    def process
      queue = SabnzbdPlusModel::Mapper.new.current_queue
      return_array = []

      queue.slots.each { |slot|
        unless @@announced_nzos.include? slot.nzo_id
          return_array = return_array << slot
          @@announced_nzos = @@announced_nzos << slot.nzo_id
        end
      }

      history = SabnzbdPlusModel::Mapper.new.history
      
      history.slots.each { |slot|
        unless @@announced_nzos.include? slot.nzo_id
          return_array = return_array << slot
          @@announced_nzos = @@announced_nzos << slot.nzo_id
        end
      }

      return return_array
    end
  end
end

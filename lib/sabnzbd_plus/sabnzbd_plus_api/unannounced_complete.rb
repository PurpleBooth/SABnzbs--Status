# To change this template, choose Tools | Templates
# and open the template in the editor.

module SabnzbdPlusApi
  class UnannouncedComplete
    @@announced_nzos = []

    def initialize
      
    end

    def process
      return_array = []
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

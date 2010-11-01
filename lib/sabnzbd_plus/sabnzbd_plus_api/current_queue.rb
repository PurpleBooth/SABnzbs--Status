# To change this template, choose Tools | Templates
# and open the template in the editor.

module SabnzbdPlusApi
  class CurrentQueue
    def initialize
      
    end

    def process
      return SabnzbdPlusModel::Mapper.new.current_queue
    end
  end
end

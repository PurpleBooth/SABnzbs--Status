# To change this template, choose Tools | Templates
# and open the template in the editor.

module SabnzbdPlusApi
  class CurrentQueue
    def initialize(mapper = SabnzbdPlusModel::Mapper.new)
      @mapper = mapper
    end

    def process
      return @mapper.current_queue
    end
  end
end

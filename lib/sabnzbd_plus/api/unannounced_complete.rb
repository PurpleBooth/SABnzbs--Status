$:.unshift File.join(File.expand_path(File.dirname(__FILE__)),'..','..','lib')

require 'sabnzbd_plus/model/mapper'

module SabnzbdPlusApi
  class UnannouncedComplete

    def initialize(mapper = SabnzbdPlusModel::Mapper.new)
      @announced_nzos = []
      @mapper = mapper
    end

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

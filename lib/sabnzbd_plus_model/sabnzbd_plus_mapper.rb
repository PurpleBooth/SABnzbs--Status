require 'pp'

module SabnzbdPlusModel
  class SabnzbdPlusMapper
    protected
    def api
      @api = SabnzbdPlusApi.new if @api.nil?
      return @api
    end

    public
    def initialize
      
    end

    def eachSlots
      query = self.api.queue

      query["queue"]["slots"].each { |slot|
        yield SabnzbdPlusSlot.from_hash(slot)
      }
    end
  end
end

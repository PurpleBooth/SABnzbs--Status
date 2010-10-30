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

    def current_queue
      query = self.api.queue
      return SabnzbdPlusQueue.from_hash(query["queue"])
    end
  end
end

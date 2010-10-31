
module SabnzbdPlusModel
  class Mapper
    protected
    def api
      @api = Api.new if @api.nil?
      return @api
    end

    public
    def initialize
      
    end

    def current_queue
      query = self.api.queue
      return Queue.from_hash(query["queue"])
    end
  end
end

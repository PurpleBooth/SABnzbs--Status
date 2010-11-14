
# Abstraction layer for interacting with SABnzbd+
module SabnzbdPlusApi
  # Get the current items that are being processed by SABnzbd+
  class CurrentQueue

    # Load the mapper
    #
    # @param [SabnzbdPlusModel::Mapper] mapper defaults to new SabnzbdPlusModel::Mapper
    def initialize(mapper = SabnzbdPlusModel::Mapper.new)
      @mapper = mapper
    end

    # Get the current queue
    #
    # @see SabnzbdPlusModel::Mapper#current_queue
    # @return [Array<Verbose>]
    def process
      return @mapper.current_queue
    end
  end
end

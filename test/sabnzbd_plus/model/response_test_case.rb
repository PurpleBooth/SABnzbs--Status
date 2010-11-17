

module SabnzbdPlusModel
  class ResponseTestCase < Response
    attr_accessor :test_data

    def initialize
      
    end

    def ==(item)
      return self.test_data == item.test_data
    end
  end
end

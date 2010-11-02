# To change this template, choose Tools | Templates
# and open the template in the editor.

module NotifyApi
  class AddedNzb
    attr_accessor :name, :status

    def initialize
      
    end

    def process
      announce = "Added job " + self.name
      puts announce
      NotifyLibNotify::LibNotify.new.send announce
    end
  end
end

# To change this template, choose Tools | Templates
# and open the template in the editor.

module NotifyApi
  class CompletedNzb
    attr_accessor :name, :status

    def initialize
      
    end

    def process
      announce = "Job " + self.name + " " + self.status
      puts announce
      NotifyLibNotify::LibNotify.new.send announce
    end
  end
end

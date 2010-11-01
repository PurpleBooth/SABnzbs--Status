# To change this template, choose Tools | Templates
# and open the template in the editor.

module SabnzbdPlusModel
  class StageLog
    attr_accessor :name, :actions

    def initialize
      self.actions = []
    end

    def self.from_hash(hash)
      item = self.new
      item.name    = hash['name']
      item.actions = hash['actions']

      return item
    end
  end
end

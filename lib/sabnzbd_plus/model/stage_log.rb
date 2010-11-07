
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

    def ==(item)
      unless(
        item.name    == self.name &&
        item.actions == self.actions)

        return false
      end

      return true
    end

    def eql?(item)
      return (item.class == self.class && self == item)
    end
  end
end

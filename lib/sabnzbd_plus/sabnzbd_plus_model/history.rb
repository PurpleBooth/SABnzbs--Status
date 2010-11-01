# To change this template, choose Tools | Templates
# and open the template in the editor.

module SabnzbdPlusModel
  class History < Verbose
    attr_accessor :total_size, :month_size, :week_size, :color_scheme

    def initialize
      self.slots = []
    end

    def self.from_hash(history)
      item = super history

      item.total_size         = history["total_size"]
      item.month_size         = history["month_size"]
      item.week_size          = history["week_size"]
      item.color_scheme       = history["color_scheme"]

      return item
    end
  end
end

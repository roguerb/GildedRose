module GildedRose
  class Operation < Array
    def by(value)
      self.push value
    end
  end
end

module GildedRose
  class QualityDownByOne < Rule
    def apply_rule?
      sell_in > 0
    end

    def value
      quality - 1
    end
  end
end
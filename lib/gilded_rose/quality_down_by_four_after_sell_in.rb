module GildedRose
  class QualityDownByFourAfterSellIn < Rule
    def apply_rule?
      sell_in <= 0
    end

    def value
      quality - 4
    end
  end
end
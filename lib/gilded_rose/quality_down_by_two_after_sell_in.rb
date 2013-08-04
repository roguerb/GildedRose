module GildedRose
  class QualityDownByTwoAfterSellIn < Rule
    def apply_rule?
      sell_in <= 0
    end

    def value
      quality - 2
    end
  end
end
module GildedRose
  class QualityUpByTwoWhenSellInBetweenSixAndTen < Rule
    def apply_rule?
      (6..10).include?(sell_in)
    end

    def value
      quality + 2
    end
  end
end
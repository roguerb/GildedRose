module GildedRose
  class QualityUpByThreeWhenSellInBetweenOneAndFive < Rule
    def apply_rule?
      (1..5).include?(sell_in)
    end

    def value
      quality + 3
    end
  end
end
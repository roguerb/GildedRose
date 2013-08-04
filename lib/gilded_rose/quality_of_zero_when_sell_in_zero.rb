module GildedRose
  class QualityOfZeroWhenSellInZero < Rule
    def apply_rule?
      sell_in <= 0
    end

    def value
      0
    end
  end
end
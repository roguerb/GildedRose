module GildedRose
  class QualityMaximumOfFifty < Rule
    # if rule is registed apply it no matter what
    def apply_rule?
      true
    end

    def value
      if quality > 50
        50
      else
        quality
      end
    end
  end
end
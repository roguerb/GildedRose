module GildedRose
  class QualityMinimumOfZero < Rule
    # if rule is registed apply it no matter what
    def apply_rule?
      true
    end

    def value
      if quality < 0
        0
      else
        quality
      end
    end
  end
end
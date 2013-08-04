module GildedRose
  class QualityNeverChanges < Rule
    def apply_rule?
      true
    end

    def value
      quality
    end
  end
end
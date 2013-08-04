module GildedRose
  class QualityUpByOne < Rule
    # if rule is registered this is the default, skip if others already applied
    def apply_rule?
      !@applied
    end

    def value
      quality + 1
    end
  end
end
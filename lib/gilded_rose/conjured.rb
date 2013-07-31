module GildedRose
  class Conjured < Product
    def update_quality
      if quality_in_range
        update_item_quality(negative calculate_quality_offset)
      end
    end

    def calculate_quality_offset
      @item.sell_in < 0 ? 4 : 2
    end
  end
end
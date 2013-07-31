module GildedRose
  class Brie < Product
    def update_quality
      if quality_in_range
        update_item_quality(+1)
      end
    end

    def quality_in_range
      @item.quality >= 0 && quality_max
    end
  end
end
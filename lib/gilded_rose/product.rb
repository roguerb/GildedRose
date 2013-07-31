module GildedRose

  class Product
    def initialize(item)
      @item = item
    end

    attr_accessor :item

    def update_quality
      if quality_in_range
        update_item_quality(negative calculate_quality_offset)
      end
    end

    def negative(value)
      -1 * value
    end

    def quality_in_range
      @item.quality > 0 && quality_max
    end

    def quality_max
      @item.quality < 50
    end

    def update_sell_in
      @item.sell_in -= 1
    end

    def update_item_quality(offset_amount)
      @item.quality += offset_amount
    end

    def calculate_quality_offset
      @item.sell_in < 0 ? 2 : 1
    end
  end
end
module GildedRose
  class Product
    attr_accessor :item

    def initialize(item)
      @item = item
      @settings = []
    end

    def update_item
      n ||= @item.sell_in > 0 ? 1 : 2
      @item.quality - n >= 0 ? @item.quality -= n : @item.quality = 0
      @item.sell_in -= 1
    end
  end
end

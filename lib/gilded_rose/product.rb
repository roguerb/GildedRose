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

    def increase(attribute)
      Operation.new([:increase, attribute])
    end

    def decrease(attribute)
      Operation.new([:decrease, attribute])
    end

    def set(attribute)
      Operation.new([:set, attribute])
    end
  end
end

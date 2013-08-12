module GildedRose
  class Product
    attr_accessor :item, :quality_ops, :sell_in_ops

    def initialize(item)
      @item = item

      build_quality_ops
      build_sell_in_ops
    end

    def update_item
      n ||= @item.sell_in > 0 ? 1 : 2
      @item.quality - n >= 0 ? @item.quality -= n : @item.quality = 0
      @item.sell_in -= 1
    end

    def build_quality_ops
      @quality_ops = [] << decrease(:quality).by(1).when(:sell_in).more_than(0)
      @quality_ops << decrease(:quality).by(2).when(:sell_in).less_than(1)
    end

    def build_sell_in_ops
      @sell_in_ops = [] << decrease(:sell_in).by(1).always
    end

    def increase(attribute)
      Operation.new(:increase, attribute)
    end

    def decrease(attribute)
      Operation.new(:decrease, attribute)
    end

    def set(attribute)
      Operation.new(:set, attribute)
    end
  end
end

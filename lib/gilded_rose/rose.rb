module GildedRose

  class Product
    def initialize(item)
      @item = item
    end

    attr_accessor :item

    def update_quality
      if quality_in_range
        update_item_quality(-calculate_quality_offset)
      end
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

  class Conjured < Product
    def update_quality
      if quality_in_range
        update_item_quality(-calculate_quality_offset)
      end
    end

    def calculate_quality_offset
      @item.sell_in < 0 ? 4 : 2
    end
  end

  class Sulfuras < Product
    def update_sell_in
      # do nothing
    end

    def update_quality
      # do nothing
    end
  end

  class Passes < Product
    def update_quality
      # TODO: in range check? make a test
      update_item_quality(calculate_quality_offset)
    end

    def calculate_quality_offset
      if item.sell_in <= 10 && item.sell_in > 5
        2
      elsif item.sell_in < 5 && item.sell_in > 0
        3
      elsif item.sell_in <= 0
        -item.quality # 0 final result
      else
        1
      end
    end
  end

  class ProductMapper
    PRODCT_ITEM_MAP = {
      "+5 Dexterity Vest" => Product,
      "Aged Brie" => Brie,
      "Elixir of the Mongoose" => Product,
      "Sulfuras, Hand of Ragnaros" => Sulfuras,
      "Backstage passes to a TAFKAL80ETC concert" => Passes,
      "Conjured Mana Cake" => Conjured
    }

    def self.build_from(item)
      PRODCT_ITEM_MAP[item.name].new(item)
    end
  end

  class Rose

    @items = []

    def initialize
      @items = []
      @items << Item.new("+5 Dexterity Vest", 10, 20)
      @items << Item.new("Aged Brie", 2, 0)
      @items << Item.new("Elixir of the Mongoose", 5, 7)
      @items << Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
      @items << Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
      @items << Item.new("Conjured Mana Cake", 3, 6)
    end

    def update_quality
      @items.each do |item|
        product = ProductMapper.build_from(item)
        product.update_sell_in
        product.update_quality
      end
    end

    def find(name)
      @items.detect { |item| item.name.downcase.include?(name) }
    end
  end
end

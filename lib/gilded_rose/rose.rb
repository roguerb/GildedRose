module GildedRose
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
      @items.each { |item| update_item(item) }
    end

    def update_item(item)
      return if item.name == "Sulfuras, Hand of Ragnaros"

      if (item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert")
        decrease_quality(item)
      else
        increase_quality(item)
        if (item.name == "Backstage passes to a TAFKAL80ETC concert")
          if (item.sell_in < 11)
            increase_quality(item)
          end
          if (item.sell_in < 6)
            increase_quality(item)
          end
        end
      end
      item.sell_in = item.sell_in - 1;
      if (item.sell_in < 0)
        if (item.name != "Aged Brie")
          if (item.name != "Backstage passes to a TAFKAL80ETC concert")
            decrease_quality(item)
          else
            item.quality = 0
          end
        else
          increase_quality(item)
        end
      end
    end

    def increase_quality(item)
      if (item.quality < 50)
        item.quality = item.quality + 1
      end
    end

    def decrease_quality(item)
      if (item.quality > 0)
        item.quality = item.quality - 1
      end
    end

    def find(name)
      @items.detect { |item| item.name.downcase.include?(name) }
    end
  end
end

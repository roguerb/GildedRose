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

      item.sell_in -= 1

      case item.name
      when "Aged Brie"
        increase_quality(item)
        if item.sell_in < 0
          increase_quality(item)
        end
      when "Backstage passes to a TAFKAL80ETC concert"
        if item.sell_in < 0
          item.quality = 0
        else
          increase_quality(item)
          if item.sell_in < 10
            increase_quality(item)
            if item.sell_in < 5
              increase_quality(item)
            end
          end
        end
      else
        decrease_quality(item)

        if item.sell_in < 0
          decrease_quality(item)
        end
      end
    end

    def increase_quality(item)
      item.quality += 1 if item.quality < 50
    end

    def decrease_quality(item)
      item.quality -= 1 if item.quality > 0
    end

    def find(name)
      @items.detect { |item| item.name.downcase.include?(name) }
    end
  end
end

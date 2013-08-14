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

      age_item(item)
      update_item_quality(item)
    end

    def update_item_quality(item)
      delta = 0

      case item.name
      when "Aged Brie"
        delta = item.sell_in < 0 ? 2 : 1
      when "Backstage passes to a TAFKAL80ETC concert"
        if item.sell_in < 0
          delta = -item.quality
        else
          delta = case
          when item.sell_in < 5 then 3
          when item.sell_in < 10 then 2
          else
            1
          end
        end
      else
        delta = item.sell_in < 0 ? -2 : -1
      end
      adjust_quality(item, delta)
    end

    def age_item(item)
      item.sell_in -= 1
    end

    def increase_quality(item)
      adjust_quality(item, 1)
    end

    def decrease_quality(item)
      adjust_quality(item, -1)
    end

    def adjust_quality(item, delta)
      item.quality = clamp(item.quality + delta, 0..50)
    end

    def clamp(value, range)
      return range.first if value < range.first
      return range.last if value > range.last
      value
    end

    def find(name)
      @items.detect { |item| item.name.downcase.include?(name) }
    end
  end
end

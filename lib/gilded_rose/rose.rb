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
      adjust_quality(item, quality_adjustment(item))
    end

    def age_item(item)
      item.sell_in -= 1
    end

    def quality_adjustment(item)
      case item.name
      when "Aged Brie"
        aged_brie_adjustment
      when /Conjured/
        standard_adjustment(item) * 2
      when /Backstage passes/
        backstage_passes_adjustment(item)
      else
        standard_adjustment(item)
      end
    end

    def aged_brie_adjustment
      1
    end

    def backstage_passes_adjustment(item)
      return -item.quality if item.sell_in < 0
      return 3 if item.sell_in < 5
      return 2 if item.sell_in < 10
      1
    end

    def standard_adjustment(item)
      item.sell_in < 0 ? -2 : -1
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

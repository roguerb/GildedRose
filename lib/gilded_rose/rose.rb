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

    def extend_item(item)
      item.extend Quality

      configuration = ItemMapper.configuration_for(item)
      item.extend configuration.sell_in
      item.rule_klasses = configuration.rules
    end

    def update_quality
      @items.each do |item|
        extend_item(item)
        item.update_sell_in
        item.update_quality
      end
    end

    def find(name)
      @items.detect { |item| item.name.downcase.include?(name) }
    end
  end
end

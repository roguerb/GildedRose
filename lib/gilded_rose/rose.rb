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

    @logic = {
      "+5 Dexterity Vest" => {
        [1..10] => -1,
        [-50..0] => -2
      },
      "Aged Brie" => {
        2 => 1
      }
    }

    def update_quality
      puts(logic["Aged Brie"][2])
      @item.each do |x|
        x.sell_in -= 1
        number = logic[x.name][x.sell_in]
        x.quality = (x.quality + number)
      end
    end

    def find(name)
      @items.detect { |item| item.name.downcase.include?(name) }
    end
  end

end

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

    def logic(key, value)
      hash = {
        "+5 Dexterity Vest" => {
          [1..10] => -1,
          [-50..0] => -2
        },
        "Aged Brie" => {
          [-50..2] => +1
        },
      }

      puts "Hey!"

      hash[key].each do
        |k,v|
        if k.include?(value)
          return v
        end
      end

      # case key
      # when "+5 Dexterity Vest"
      #   return -1
      # when "Aged Brie"
      #   return +1
      # when "Elixir of the Mongoose"
      #   case value
      #   when value > 1
      #     return -1
      #   when value <= 1
      #     return -2
      #   end
      # when "Sulfuras, Hand of Ragnaros"
      #   return 0
      # when "Backstage passes to a TAFKAL80ETC concert"
      #   case value
      #   when value > 10
      #     return -1
      #   when value <= 10 && value >= 5
      #     return -2
      #   when value < 5
      #     return -3
      #   end
      # when "Conjured Mana Cake"
      #   return -2
      # end
    end

    def update_quality
      logic("Aged Brie", 2);
      @item.each do |x|
        x.sell_in -= 1
        number = logic(x.name, x.sell_in)
        x.quality = (x.quality + number)
      end
    end

    def find(name)
      @items.detect { |item| item.name.downcase.include?(name) }
    end
  end
end

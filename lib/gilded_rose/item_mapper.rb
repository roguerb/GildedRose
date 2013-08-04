module GildedRose
  class ItemMapper
    CONFIG = {
      "+5 Dexterity Vest" => OpenStruct.new({ sell_in: SellInStandard, x: "Product" }),
      "Aged Brie" => OpenStruct.new({ sell_in: SellInStandard, x: "Brie" }),
      "Elixir of the Mongoose" => OpenStruct.new({ sell_in: SellInStandard, x: "Product" }),
      "Sulfuras, Hand of Ragnaros" => OpenStruct.new({ sell_in: SellInNever, x: "Sulfuras" }),
      "Backstage passes to a TAFKAL80ETC concert" => OpenStruct.new({ sell_in: SellInStandard, x: "Passes" }),
      "Conjured Mana Cake" => OpenStruct.new({ sell_in: SellInStandard, x: "Conjured" })
    }

    def self.configuration_for(item)
      CONFIG[item.name]
    end
  end
end
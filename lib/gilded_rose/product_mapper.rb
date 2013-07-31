module GildedRose
  class ProductMapper
    PRODUCT_ITEM_MAP = {
      "+5 Dexterity Vest" => Product,
      "Aged Brie" => Brie,
      "Elixir of the Mongoose" => Product,
      "Sulfuras, Hand of Ragnaros" => Sulfuras,
      "Backstage passes to a TAFKAL80ETC concert" => Passes,
      "Conjured Mana Cake" => Conjured
    }

    def self.build_from(item)
      PRODUCT_ITEM_MAP[item.name].new(item)
    end
  end
end
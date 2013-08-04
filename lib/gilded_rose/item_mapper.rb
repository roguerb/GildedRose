module GildedRose
  class ItemMapper
    CONFIG = {

      "+5 Dexterity Vest" => OpenStruct.new({
        sell_in: SellInStandard,
        rules: [QualityDownByOne, QualityDownByTwoAfterSellIn, QualityMinimumOfZero, QualityMaximumOfFifty]
      }),

      "Aged Brie" => OpenStruct.new({
        sell_in: SellInStandard,
        rules: [QualityUpByOne, QualityMinimumOfZero, QualityMaximumOfFifty]
      }),

      "Elixir of the Mongoose" => OpenStruct.new({
        sell_in: SellInStandard,
        rules: [QualityDownByOne, QualityDownByTwoAfterSellIn, QualityMinimumOfZero, QualityMaximumOfFifty]
      }),

      "Sulfuras, Hand of Ragnaros" => OpenStruct.new({
        sell_in: SellInNever,
        rules: [QualityNeverChanges]
      }),

      "Backstage passes to a TAFKAL80ETC concert" => OpenStruct.new({
        sell_in: SellInStandard,
        rules: [
          QualityUpByThreeWhenSellInBetweenOneAndFive,
          QualityUpByTwoWhenSellInBetweenSixAndTen,
          QualityUpByOne,
          QualityOfZeroWhenSellInZero,
          QualityMinimumOfZero,
          QualityMaximumOfFifty
        ]
      }),

      "Conjured Mana Cake" => OpenStruct.new({
        sell_in: SellInStandard,
        rules: [QualityDownByTwo, QualityDownByFourAfterSellIn, QualityMinimumOfZero, QualityMaximumOfFifty]
      })

    }

    def self.configuration_for(item)
      CONFIG[item.name]
    end
  end
end
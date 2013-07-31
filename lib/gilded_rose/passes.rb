module GildedRose
  class Passes < Product
    def update_quality
      # TODO: in range check? make a test
      update_item_quality(calculate_quality_offset)
    end

    def calculate_quality_offset
      if (-1..0).include? item.sell_in
        negative item.quality # result is 0
      elsif (1..5).include? item.sell_in
        3
      elsif (6..10).include? item.sell_in
        2
      else
        1
      end
    end
  end
end
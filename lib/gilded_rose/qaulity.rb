module GildedRose
  module QualityModule
    def update_quality
      # TODO: run the rules

      if @sell_in <= 0
        @quality -= 2
      else
        @quality -= 1
      end

      if @quality < 0
        @quality = 0
      end
    end
  end
end
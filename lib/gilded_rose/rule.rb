module GildedRose
  class Rule

    def initialize(sell_in, quality, applied)
      @sell_in = sell_in
      @quality = quality
      @applied = applied
    end

    attr_reader :sell_in, :quality

    def value
      raise "implement value"
    end

    def apply_rule?
      raise "implement apply_rule?"
    end
  end
end
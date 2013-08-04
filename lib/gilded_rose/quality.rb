module GildedRose
  module Quality

    attr_accessor :rule_klasses

    def update_quality
      @applied = false

      @rule_klasses.each do |rule_klass|
        rule = rule_klass.new(@sell_in, @quality, @applied)

        if rule.apply_rule?
          set_quality(rule.value)
        end
      end
    end

    def set_quality(value)
      @quality = value
      @applied = true
    end

  end
end
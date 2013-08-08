module GildedRose
  class Operation
    attr_reader :type, :attribute, :value, :conditions

    def initialize(type, attribute)
      @type, @attribute, @conditions = type, attribute, {}
    end

    def by(value)
      @value = value
    end

    def when(condition)
      @conditions.merge! condition => :pending
    end
  end
end

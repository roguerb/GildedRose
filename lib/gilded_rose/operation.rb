module GildedRose
  class Operation
    attr_reader :type, :attribute, :value, :conditions

    def initialize(type, attribute)
      @type = type
      @attribute = attribute
      @conditions = {}
    end

    def by(value)
      @value = value
      return self
    end

    def always
      @conditions = false
      return self
    end

    def when(condition)
      @conditions.merge! condition => :pending
      return self
    end

    def less_than(value)
      @conditions[@conditions.key(:pending)] = { less_than: value }
      return self
    end

    def more_than(value)
      @conditions[@conditions.key(:pending)] = { more_than: value }
      return self
    end
  end
end

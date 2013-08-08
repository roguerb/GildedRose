require 'spec_helper'

module GildedRose
  describe Operation do
    describe "#by" do
      it "adds a value to the operation array" do
        operation = Operation.new([:increase, :quality])
        result = Operation.new([:increase, :quality, 2])
        expect(operation.by(2)).to eql(result)
      end
    end
  end
end

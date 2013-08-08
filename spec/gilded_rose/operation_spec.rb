require 'spec_helper'

module GildedRose
  describe Operation do
  let(:operation) { Operation.new(:increase, :quality) }

    describe "#by" do
      it "adds a value to the operation array" do
        operation.by(2)
        expect(operation.value).to eql(2)
      end
    end

    describe "#when" do
      it "adds a condition to the operation array" do
        operation.when(:less_than)
        expect(operation.conditions).to include(less_than: :pending)
      end
    end
  end
end

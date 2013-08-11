require 'spec_helper'

module GildedRose
  describe Operation do
    subject { Operation.new(:increase, :quality) }

    shared_examples "operation modifier method" do
      it "returns the operation" do
        expect(@return).to eql(subject)
      end
    end

    describe "#by" do
      before { @return = subject.by(2) }
      include_examples "operation modifier method"

      it "adds a value to the operation array" do
        expect(subject.value).to eql(2)
      end
    end

    describe "always" do
      before { @return = subject.always }
      include_examples "operation modifier method"

      it "sets conditions to false" do
        expect(subject.conditions).to be_false
      end
    end

    describe "#when" do
      before { @return = subject.when(:quality) }
      include_examples "operation modifier method"

      it "adds a pending condition to the operation array" do
        expect(subject.conditions).to include(quality: :pending)
      end
    end

    describe "#less_than" do
      before do
        subject.conditions.merge! quality: :pending
        @return = subject.less_than(5)
      end

      include_examples "operation modifier method"

      it "adds the labled value to the pending condition" do
        expect(subject.conditions).to include(quality: {less_than: 5})
      end
    end

    describe "#more_than" do
      before do
        subject.conditions.merge! quality: :pending
        @return = subject.more_than(5)
      end

      include_examples "operation modifier method"

      it "adds the labled value to the pending condition" do
        expect(subject.conditions).to include(quality: {more_than: 5})
      end
    end
  end
end

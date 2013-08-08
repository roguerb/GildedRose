require 'spec_helper'

module GildedRose
  describe Product do
    let(:product) { Product.new(item) }
    let(:item) { double(quality: 10, sell_in: 10) }

    describe "#update_item" do
      context "using default settings" do
        before do
          item.stub(:quality= => nil, :sell_in= => nil)
          product.update_item
        end

        it "decrements the sell_in by 1" do
          expect(item).to have_received(:sell_in=).with(9)
        end

        context "when quality is a positve number" do
          let(:item) { double(quality: 10, sell_in: 10)}

          it "decrements the quality by 1" do
            expect(item).to have_received(:quality=).with(9)
          end
        end

        context "when quality decrement would be negative" do
          let(:item) { double(quality: 0, sell_in: 10)}

          it "sets the quality to 0" do
            expect(item).to have_received(:quality=).with(0)
          end
        end
      end
    end

    describe "#increase" do
      it "returns an operation with the provided attribute" do
        operation = product.increase(:quality)

        expect(operation).to be_an(Operation)
        expect(operation.length).to eql(2)
        expect(operation[0]).to eql(:increase)
        expect(operation[1]).to eql(:quality)
      end
    end

    describe "#decrease" do
      it "returns an operation with the provided attribute" do
        operation = product.decrease(:sell_in)

        expect(operation).to be_an(Operation)
        expect(operation.length).to eql(2)
        expect(operation[0]).to eql(:decrease)
        expect(operation[1]).to eql(:sell_in)
      end
    end

    describe "#set" do
      it "returns an operation with the provided attribute" do
        operation = product.set(:quality)

        expect(operation).to be_an(Operation)
        expect(operation.length).to eql(2)
        expect(operation[0]).to eql(:set)
        expect(operation[1]).to eql(:quality)
      end
    end
  end
end

require 'spec_helper'

module GildedRose
  describe Product do

    describe "#update_item" do
      context "using default settings" do
        let(:product) { Product.new(item) }
        let(:item) { double(quality: 10, sell_in: 10) }

        before do
          item.stub(:quality=)
          item.stub(:sell_in=)
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
  end
end

require 'spec_helper'

module GildedRose
  describe Rose do
    let(:rose) { Rose.new }

    describe "#find" do
      it "finds the item with matching name" do
        item = rose.find('brie')
        expect(item.name).to eq('Aged Brie')
      end
    end

    describe "#update_quality" do
      before do
        @product_double = double('Product', update_item: nil)
        Product.stub(:new).and_return(@product_double)

        @n = rose.items.count
        rose.update_quality
      end

      it "creates a product for each item" do
        expect(Product).to have_received(:new).exactly(@n).times
      end

      it "calls update on each product" do
        expect(@product_double).to have_received(:update_item).exactly(@n).times
      end
    end
  end
end

require 'spec_helper'

describe GildedRose::Rose do

  it "should do something" do
    subject.update_quality
  end

  describe "#find" do
    it "finds the item with matching name" do
      item = rose.find('brie')
      expect(item.name).to eq('Aged Brie')
    end
  end
end

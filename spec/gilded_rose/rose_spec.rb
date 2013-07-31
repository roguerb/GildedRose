require 'spec_helper'

describe GildedRose::Rose do
  let(:rose) { GildedRose::Rose.new }

  describe "#update_quality" do
    context "when item is 'Elixir of the Mongoose'" do
      it "never sets the quality to less than 0" do
        10.times { rose.update_quality }
        expect(rose.find('elixir').quality).to eq(0)
      end

      it "degrades twice as fast after sell date is 0" do
        6.times { rose.update_quality }
        expect(rose.find('elixir').quality).to eq(0)
      end
    end

    context "when item is 'Aged Brie'" do
      it "increases Quality the older it gets" do
        expect{ rose.update_quality }.to change{ rose.find('brie').quality }.from(0).to(1)
      end

      it "is never assigned a quality above 50" do
        51.times { rose.update_quality }
        expect(rose.find('brie').quality).to eq(50)
      end
    end

    context "when item is 'Conjured Mana Cake'" do
      it "decreases Quality twice as fast" do
        expect{ rose.update_quality }.to change{ rose.find('mana').quality }.from(6).to(4)
      end

      it "decreases Quality twice as fast when past sell date" do
        rose.find('mana').sell_in = 0
        expect{ rose.update_quality }.to change{ rose.find('mana').quality }.from(6).to(2)
      end
    end

    context "when item is 'Backstage passes'" do
      context "when sell in value is greater than 10" do
        it "increases quality with each update" do
          expect{ rose.update_quality }.to change{ rose.find('passes').quality }.from(20).to(21)
        end
      end

      context "when sell in value is less than 10 but greater than 5" do
        it "increases quality by two with each update" do
          rose.find('passes').sell_in = 10
          expect{ rose.update_quality }.to change{ rose.find('passes').quality }.from(20).to(22)
        end
      end

      context "when sell in value is less than 5" do
        it "increases quality by three with each update" do
          rose.find('passes').sell_in = 5
          expect{ rose.update_quality }.to change{ rose.find('passes').quality }.from(20).to(23)
        end
      end

      context "when sell in value is 0" do
        it "sets quality to 0" do
          rose.find('passes').sell_in = 0
          expect{ rose.update_quality }.to change{ rose.find('passes').quality }.from(20).to(0)
        end
      end
    end

    context "when item is 'Sulfuras'" do
      it "does not change quality" do
        expect{ rose.update_quality }.to_not change{ rose.find('sulfuras').quality }
      end

      it "does not change sell_in value" do
        expect{ rose.update_quality }.to_not change{ rose.find('sulfuras').sell_in }
      end
    end
  end

  describe "#find" do
    it "finds the item with matching name" do
      item = rose.find('brie')
      expect(item.name).to eq('Aged Brie')
    end
  end
end

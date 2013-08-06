Transform /^(-?\d+)$/ do |number|
  number.to_i
end

Given(/^the item is ([^"]*)$/) do |item|
  @rose = GildedRose::Rose.new
  @item = @rose.find(item)
end

Given(/^it's quality is (.*?)$/) do |quality|
  @item.quality = quality
end

Given(/^it's sell_in is (.*?)$/) do |sell_in|
  @item.sell_in = sell_in
end

When(/^it is updated (\d*?) times$/) do |n|
  n.times { @rose.update_quality }
end

Then(/^the quality should be (.*?)$/) do |quality|
  expect(@item.quality).to eq(quality)
end

Then(/^the sell in should be (.*?)$/) do |sell_in|
  expect(@item.sell_in).to eq(sell_in)
end

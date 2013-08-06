# Products with special update settings can be set up here

product 'Aged Brie' do
  increase(:quality).by(1).always
end

product 'Sulfuras' do
  set(:quality).to(80).always
  set(:sell_in).to(0).always
end

product 'Backstage Passes' do
  increase(:quality).by(2).when(:sell_in).less_than(10)
  increase(:quality).by(3).when(:sell_in).less_than(5)
  set(:quality).to(0).when(:sell_in).less_than(0)
end

product 'Conjured Mana Cake' do
  decrease(:quality).by(2).always
end

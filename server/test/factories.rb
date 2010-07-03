Factory.define :tile do |t|
  t.map_id 1
  t.tile_type "Grass"
  t.height 1
  t.map_order 1
end

Factory.define :map do |m|
  m.name "Small"
  m.height 3
  m.width 3
end
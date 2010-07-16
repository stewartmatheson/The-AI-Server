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

Factory.define :startunit do |s|
  s.map_id
  s.unit_id
end

Factory.define :RallyPoint do |r|
  r.map_id
  r.map_point_id
end

Factory.define :MapPoint do |m|
  m.xpos
  m.ypos
end
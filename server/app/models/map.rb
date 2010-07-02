class Map < ActiveRecord::Base
  has_many :tiles, :order => "map_order ASC"
  has_many :startunits
end

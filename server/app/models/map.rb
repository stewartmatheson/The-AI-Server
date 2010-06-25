class Map < ActiveRecord::Base
  has_many :tiles
  has_many :startunits
end

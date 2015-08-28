require 'bundler/setup'

require_relative './map'

map_image = Map.new('images/map.jpg', [-50.0, -100.0], [60.0, 180.0])

points = [
  [51.5085300, -0.1257400],   # London 
  [40.71427, -74.0059700],    # New York 
  [55.7522200, 37.6155600],   # Moscow 
  [-33.8678500, 151.2073200], # Sydney
  [-34.6131500, -58.3772300]  # Buenos Aires
]

map_image.add_points(points)
map_image.save

exec 'open result.jpg'

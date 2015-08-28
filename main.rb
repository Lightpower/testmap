[-176.5, 85.0], [183.5, -95.0]require 'bundler/setup'

require_relative './map'

map_image = Map.new('images/map.jpg', [-176.5, 85.0], [183.5, -95.0])

points = [
  [-0.1257400, 51.5085300],   # London 
  [-74.0059700, 40.71427],    # New York 
  [37.6155600, 55.7522200],   # Moscow 
  [151.2073200, -33.8678500], # Sydney
  [-58.3772300, -34.6131500]  # Buenos Aires
]

map_image.add_points(points)
map_image.save

exec 'open result.jpg'

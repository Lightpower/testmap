require 'bundler/setup'

require_relative './map'

map_image = Map.new('images/map.jpg', [-20.15, -19.81], [36.6, 77.7])

points = [
  [-10, -10],
  [-10, 10],
  [0, 0],
  [5, 50],
  [30, 60]
]

map_image.add_points(points)
map_image.save

exec 'open result.jpg'

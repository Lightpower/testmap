require 'RMagick'
require_relative './marker'

class Map

  DEFAULT_MARKER = Marker.new('images/marker.png', :bottom, :middle)
  GRAVITY = Magick::NorthWestGravity

  ##
  # Initializes Map class by canvas image and coordinates of each corner
  #
  # Params:
  # - path_to_canvas  {String}  Path to map image
  # - path_to_marker  {String}  Path to point's marker image
  # - point_min       {Array}   Array with X and Y of the NortWest point
  # - point_max       {Array}   Array with X and Y of the SouthEast point
  #
  def initialize(path_to_canvas, point_min, point_max)
    @canvas = Magick::ImageList.new(path_to_canvas)

    @point_min = point_min
    @point_max = point_max
  end

  ##
  # Draw new point on the map by geographic coordinates
  #
  # Params:
  # - coordinates {Array} Array with X and Y of point in geographic coordinates wich should be converted to canvas pixels
  #
  # Returns:
  # {Array} Array with converted X and Y on canvas
  #
  def add_point(coordinates, marker=DEFAULT_MARKER)
    x, y = convert(coordinates)

    @canvas.gravity  = GRAVITY
    @canvas.geometry = Magick::Geometry.new(0, 0, x + marker.offset_x, y + marker.offset_y)

    @canvas = @canvas.composite_layers(marker.image, Magick::OverCompositeOp)

    [x, y]
  end

  ##
  # Draw new point on the map by geographic coordinates
  #
  # Params:
  # - coordinates {Array} Array of arrays with X and Y of point in geographic coordinates wich should be converted to canvas pixels
  #
  def add_points(coordinate_list)
    coordinate_list.each { |item| add_point(item) }
  end

  ##
  # Saves current canvas to file
  #
  def save(path='result.jpg')
    @canvas.write(path)
  end

private

  ##
  # Private: Converts geographic coordinates to canvas point
  #
  # Params:
  # - coordinates {Array} Array with X and Y of point in geographic coordinates wich should be converted to canvas pixels
  #
  # Returns:
  # {Array} Array with converted X and Y on canvas
  #
  def convert(coordinates)
    [
      (coordinates[0] - @point_min[0]) / ((@point_max[0] - @point_min[0]) / @canvas.columns) ,
      (coordinates[1] - @point_min[1]) / ((@point_max[1] - @point_min[1]) / @canvas.rows)
    ]
  end


end

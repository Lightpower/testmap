class Marker
  attr_reader :image, :offset_x, :offset_y

  OFFSETS = {
    top:    0.0,
    middle: 50.0,
    bottom: 100.0
  }.freeze

  ##
  # Create marker with offsets
  #
  # Params:
  # - path_to_image {String}         Path to marker image
  # - offset_x      {Integer|Symbol} X-offset in pixels or position
  # - offset_y      {Integer|Symbol} Y-offset in pixels or position
  #
  def initialize(path_to_image, offset_x=0, offset_y=0)
    @image = Magick::ImageList.new(path_to_image)

    @offset_x = offset_x.is_a?(Symbol) ? @image.rows.to_f    * OFFSETS[offset_x] / 100 : offset_x
    @offset_y = offset_y.is_a?(Symbol) ? @image.columns.to_f * OFFSETS[offset_y] / 100 : offset_y
  end

end

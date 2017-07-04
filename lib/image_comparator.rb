require 'imatcher'

class ImageComparator

  def initialize
    @matcher = Imatcher::Matcher.new
  end

  def match?(image_path_1, image_path_2)
    res = @matcher.compare(image_path_1, image_path_2)
    res.match?
  end

end
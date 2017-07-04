require 'imatcher'

class ImageComparator

  def initialize
    @matcher = Imatcher::Matcher.new
  end

  def match?(image_path_1, image_path_2)
    result = @matcher.compare(image_path_1, image_path_2)
    match = result.match?

    unless match
      result.difference_image.save(diff_path(image_path_1, image_path_2))
    end

    match
  end

  private
  def diff_path(image_path_1, image_path_2)
    base =  File.split(image_path_1).first

    file_1_name = File.basename(image_path_1, '.*')
    file_2_name = File.basename(image_path_2, '.*')

    File.join(base, "diff-#{file_1_name}-#{file_2_name}.png")
  end

end
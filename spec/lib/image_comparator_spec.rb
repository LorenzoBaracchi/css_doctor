require 'spec_helper'
require_relative '../../lib/image_comparator'

describe ImageComparator do

  let(:comparator) {ImageComparator.new}

  context 'when image are the same' do
    it 'should find no differences' do
      file_path =  File.join(Dir.pwd, 'spec', 'images','doge.png')

      expect(comparator.match?(file_path, file_path)).to be_truthy
    end
  end
end
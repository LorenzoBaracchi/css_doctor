require 'spec_helper'
require_relative '../../lib/image_comparator'

describe ImageComparator do

  let(:comparator) {ImageComparator.new}

  context 'when images are the same' do
    it 'should find no differences' do
      file_path = File.join(Dir.pwd, 'spec', 'images', 'doge.png')

      expect(comparator.match?(file_path, file_path)).to be_truthy
    end
  end

  context 'when images differs' do
    let(:doge_path) {File.join(Dir.pwd, 'spec', 'images', 'doge.png')}
    let(:doge_text_path) {File.join(Dir.pwd, 'spec', 'images', 'doge_text.png')}
    let(:result_path) {File.join(Dir.pwd, 'spec', 'images', 'diff-doge-doge_text.png')}

    after do
      FileUtils.rm(result_path)
    end

    it 'should find some diffences' do
      expect(comparator.match?(doge_path, doge_text_path)).to be_falsey
    end

    it 'should save a diff image' do
      comparator.match?(doge_path, doge_text_path)
      expect(File.file?(result_path)).to be_truthy
    end
  end
end
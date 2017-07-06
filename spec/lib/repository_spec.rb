require 'spec_helper'
require_relative '../../lib/repository'

describe Repository do
  let(:path) {'/tmp/git'}
  let(:repository) {described_class.new('https://github.com/schacon/ruby-git.git', path)}

  let(:commits) {[double(sha: 'sha9a60cb2ef'), double(sha: 'sha6777803c0e'), double(sha: 'sha5812354o')]}

  after do
    repository.cleanup
  end

  describe '#last_commit' do
    subject {repository.last_commit}

    before do
      allow_any_instance_of(Git::Base).to receive(:log).and_return(commits)
    end

    it {is_expected.to eq('sha9a60cb2ef')}
  end

  describe '#prev_commit' do
    subject {repository.prev_commit}

    before do
      allow_any_instance_of(Git::Base).to receive(:log).and_return(commits)
    end

    it {is_expected.to eq('sha6777803c0e')}
  end

  describe '#cleanup' do
    it 'should drastically remove the repository' do
      repository #clone the repository
      expect(Dir[path].empty?).to be_falsey
      repository.cleanup
      expect(Dir[path].empty?).to be_truthy
    end
  end

end
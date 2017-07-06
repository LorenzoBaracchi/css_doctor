require 'spec_helper'
require_relative '../../lib/repository'

describe Repository do

  let(:repository) {described_class.new('.')}

  describe '#last_commit' do
    subject {repository.last_commit}

    before do
      allow_any_instance_of(Git::Base).to receive(:log).and_return([double(sha: 'sha9a60cb2ef'), double(sha: 'sha6777803c0e')])
    end

    it {is_expected.to eq('sha9a60cb2ef')}
  end

  describe '#prev_commit' do
    subject {repository.prev_commit}

    before do
      allow_any_instance_of(Git::Base).to receive(:log)
                                              .and_return([double(sha: 'sha9a60cb2ef'), double(sha: 'sha6777803c0e'), double(sha: 'sha5812354o')])
    end

    it {is_expected.to eq('sha6777803c0e')}
  end

end
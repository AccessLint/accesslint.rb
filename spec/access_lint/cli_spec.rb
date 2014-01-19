require 'spec_helper'
require 'access_lint/cli'

module AccessLint
  describe CLI do
    it 'creates an audit' do
      expect { CLI.start([]) }.to_not raise_error
    end
  end
end

require 'spec_helper'

module AccessLint
  describe Runner do
    it 'runs phantomjs' do
      target = double
      runner = Runner.new(target)

      expect(runner).to receive(:`).with(/^phantomjs.*/)
      runner.run
    end
  end
end

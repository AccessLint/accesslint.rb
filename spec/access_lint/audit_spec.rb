require 'spec_helper'

module AccessLint
  describe Audit do
    let(:target) { double(:target) }

    describe '#run' do
      let(:audit) { Audit.new(target) }

      it 'runs phantomjs' do
        audit.should_receive(:`).with(/^phantomjs.*/)
        audit.run
      end
    end
  end
end

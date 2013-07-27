require 'spec_helper'

module AccessLint
  describe Audit do
    describe '#run' do
      let(:target) { double(:target) }
      it 'returns a string' do
        audit = Audit.new(target).run
        audit.should be_an_instance_of String
        audit.should_not be_empty
      end
    end
  end
end

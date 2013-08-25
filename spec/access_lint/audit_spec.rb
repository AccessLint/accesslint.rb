require 'spec_helper'

module AccessLint
  describe Audit do
    let(:target) { double(:target) }
    let(:rule_set_name) { :google_accessibility_developer_tools }

    describe '#run' do
      let(:audit) { Audit.new(target) }

      it 'loads the rule set' do
        audit.should_receive(:`).with(/^cd.*phantomjs.*/)
        audit.run(rule_set_name)
      end

      it 'returns a string' do
        results = audit.run(rule_set_name)
        results.should be_an_instance_of String
        results.should_not be_empty
      end
    end
  end
end

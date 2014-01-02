require 'spec_helper'

module AccessLint
  describe Audit do

    describe '#run' do
      it 'return a parsed set of results' do
        target = double
        output = JSON.generate([{status: 'passing', foo: 'bar'}])

        audit = Audit.new(target)
        audit.stub(:runner) { double(:runner, output: output, run: double) }

        expect(audit.run).to eq "passing"=>[{"status"=>"passing", "foo"=>"bar"}]
      end
    end
  end
end

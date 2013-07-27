require 'access_lint'

module AccessLint
  class Audit
    def initialize(target)
      @target = target
    end

    def run
      create_report
    end

    private

    def create_report
      "you ran an audit on #{@target}"
    end
  end
end

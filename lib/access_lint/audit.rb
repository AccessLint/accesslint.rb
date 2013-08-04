require 'access_lint'

module AccessLint
  class Audit
    RUNNER_PATH = File.expand_path("../../../vendor/access-lint/bin/auditor.js", __FILE__)

    def initialize(target)
      @target = target
    end

    def run
      create_report
    end

    private

    def create_report
      %x( phantomjs #{RUNNER_PATH} #{@target})
    end
  end
end

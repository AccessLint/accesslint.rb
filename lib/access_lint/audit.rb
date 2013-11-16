require 'access_lint'
require 'yaml'

module AccessLint
  class Audit
    RUNNER_PATH = File.expand_path("../../../vendor/access-lint/bin/auditor.js", __FILE__)

    def initialize(target)
      @target = target
    end

    def run
      `phantomjs #{RUNNER_PATH} #{@target}`
    end
  end
end

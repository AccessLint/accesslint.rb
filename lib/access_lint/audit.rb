require 'access_lint'
require 'json'

module AccessLint
  class Audit
    RUNNER_PATH = File.expand_path("../../../vendor/access-lint/bin/auditor.js", __FILE__)

    def initialize(target)
      @target = target
    end

    def run
      result = `phantomjs #{RUNNER_PATH} #{@target}`
      if !result.nil?
        JSON.parse(result)
      end
    end
  end
end

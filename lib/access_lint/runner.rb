module AccessLint
  class Runner
    RUNNER_PATH = File.expand_path("../../../vendor/access-lint/bin/auditor.js", __FILE__)
    attr_reader :output

    def initialize(target)
      @target = target
    end

    def run
      @output = `phantomjs --ignore-ssl-errors=yes #{RUNNER_PATH} #{@target}`
      return if audit_success?

      if !phantomjs_installed?
        fail AccessLint::RunnerError.new("Please install PhantomJS. Visit http://phantomjs.org/ for instructions.")
      else
        fail AccessLint::RunnerError.new("PhantomJS exited without success: #{@output}")
      end
    end

    private

    def audit_success?
      $?.success?
    end

    def phantomjs_installed?
      $?.exitstatus != 127
    end
  end
end

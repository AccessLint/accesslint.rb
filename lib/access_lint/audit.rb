require 'access_lint'
require 'yaml'

module AccessLint
  class Audit
    def initialize(target)
      @target = target
    end

    def run(rule_set_name)
      `#{runner_command_for(rule_set_name)} #{@target}`
    end

    private

    def runner_command_for(rule_set_name)
      configuration = YAML.load_file(
        File.expand_path('../../../config/rule_sets.yml', __FILE__)
      )
      configuration['rule_sets'].fetch(rule_set_name.to_s)['runner_command']
    end
  end
end

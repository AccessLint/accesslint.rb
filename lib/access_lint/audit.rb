require 'access_lint'
require 'yaml'

module AccessLint
  class Audit
    def initialize(target)
      @target = target
    end

    def run(rule_set_name)
      `#{command_for(rule_set_name)}`
    end

    private

    def command_for(rule_set_name)
      configuration = YAML.load_file(
        File.expand_path('../../../config/rule_sets.yml', __FILE__)
      )
      runner = configuration['rule_sets'].fetch(rule_set_name.to_s)['runner']
      path = File.expand_path(File.join('../../..', runner.fetch('filepath')), __FILE__)
      arguments = runner.fetch('additional_arguments') || {}
      arguments = arguments.values.any? ? arguments.values.join(' ') : ''

      "phantomjs #{path} #{@target} #{arguments}"
    end
  end
end

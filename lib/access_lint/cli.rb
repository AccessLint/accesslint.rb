require 'thor'

module AccessLint
  class CLI < Thor
    desc 'audit', 'audit TARGET RULE_SET_NAME'
    def audit(target, rule_set_name)
      puts Audit.new(target).run(rule_set_name)
    end
  end
end

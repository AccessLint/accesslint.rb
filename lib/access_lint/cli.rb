require 'thor'

module AccessLint
  class CLI < Thor
    desc 'audit', 'audit TARGET'
    def audit(target)
      puts Audit.new(target).run
    end
  end
end

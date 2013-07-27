require 'thor'

module AccessLint
  class CLI < Thor
    desc 'audit TARGET', "Run an accessibility audit on a target file or url."
    def audit(target)
      puts Audit.new(target).run
    end
  end
end

require 'thor'

module AccessLint
  class CLI < Thor::Group
    desc 'Run an accessibility audit on a target file or url.'
    argument :target
    def audit
      puts Audit.new(target).run
    end
  end
end

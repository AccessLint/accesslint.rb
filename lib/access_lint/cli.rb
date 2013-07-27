require 'thor'

module AccessLint
  class CLI < Thor
    desc 'audit TARGET', "Run an accessibility audit on a target file or url."
  end
end

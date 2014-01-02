require "access_lint/version"

module AccessLint
  autoload :Audit, 'access_lint/runner'
  autoload :Runner, 'access_lint/audit'

  class Error < StandardError; end
  class AuditError < Error; end
  class ParserError < Error; end
end

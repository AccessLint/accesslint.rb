require 'thor'
require 'command_line_reporter'
require 'awesome_print'

module AccessLint
  class CLI < Thor
    include CommandLineReporter

    desc 'audit', 'audit TARGET'
    def audit(target)
      exit_code = 0

      report(message: "auditing #{target}", color: "blue") do
        results = Audit.new(target).run

        results.each do |group|
          section = group[0]

          case section
          when "NA"
            color = :blue
          when "PASS"
            color = :green
          when "FAIL"
            color = :red
          end

          group[1].each do |rule|
            name = rule.fetch("title")
            severity = rule.fetch("severity")
            elements = rule.fetch("element_names")

            puts
            aligned("#{section} - #{name} (#{severity})", color: color)

            elements.each do |element|
              aligned("* #{element[0..80]}...")
            end

            if section == "FAIL" && elements.any?
              exit_code = 1
            end
          end
        end
      end

      exit exit_code
    end
  end
end

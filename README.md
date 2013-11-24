# AccessLint
Command line runner for Google Accessibility Developer Tools.

## Installation

    $ brew install phantomjs

    $ gem install access_lint

    $ access_lint audit <url-or-filename>

### Example

    $ access_lint audit http://twitter.com
    
    #=> {"element_names"=>[], "severity"=>"Warning", "status"=>"NA", "title"=>"role=main should only appear on significant elements"}
        {"element_names"=>[], "elements"=>[node], "severity"=>"Warning", "status"=>"FAIL", "title"=>"Meaningful images should not be used in element backgrounds"}
        ...
        
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

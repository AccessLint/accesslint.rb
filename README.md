# AccessLint

Run accessibility audits on web pages from the command line.

## About

AccessLint uses the [Accessibility Developer Tools](https://github.com/GoogleChrome/accessibility-developer-tools) javascript library to make assertions on the DOM via PhantomJS.

## Installation

    $ brew install phantomjs

    $ gem install access_lint

    $ access_lint audit <url-or-filename>

## Command Line Usage

Running the `audit` command will return an array of stringified JSON objects to stdout:

    $ access_lint audit TARGET  # TARGET can be a url or a path to a file

The JSON structure looks like:

    [
        { 
        "element_names": ["<p class=\"foo\">relevant element</p>"], # array of string values for applicable DOM nodes
        "elements": [DOM node],                                     # array of failing nodes as DOM objects.
        "severity": "WARNING",                                      # string for the severity of the failure.
        "status": "PASS",                                           # 'PASS', 'FAIL', or 'NA'
        "title": "Some description"                                 # string description of the failure.
        }
    ]

### Example

    $ access_lint audit http://ckundo.com
    
    [{"element_names": ["<span class=\"blogger-gear\"></span>"], "elements": [DOM node], "severity"=>"Warning", "status"=>"FAIL", "title"=>"Meaningful images should not be used in element backgrounds"}, ...]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

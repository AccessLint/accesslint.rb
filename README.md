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

## Rules

For full descriptions of the audit rules, visit the [Accessibility Developer Tools project wiki](https://github.com/GoogleChrome/accessibility-developer-tools/wiki/Audit-Rules)

* Audio elements should have controls
* ARIA state and property values must be valid
* Elements with ARIA roles must use a valid, non-abstract ARIA role
* Controls and media elements should have labels
* These elements are focusable but either invisible or obscured by another element
* Images should have an alt attribute
* The purpose of each link should be clear from the link text
* Text elements should have a reasonable contrast ratio
* role=main should only appear on significant elements
* Meaningful images should not be used in element backgrounds
* aria-labelledby attributes should refer to an element which exists in the DOM
* The web page should have a title that describes topic or purpose
* Elements with ARIA roles must have all required attributes for that role
* Video elements should use <track> elements to provide captions

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

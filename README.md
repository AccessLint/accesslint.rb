# access_lint [![Build Status](https://travis-ci.org/accesslint/access_lint.svg)](https://travis-ci.org/accesslint/access_lint) [![Gem Version](https://badge.fury.io/rb/access_lint.svg)](http://badge.fury.io/rb/access_lint) [![Code Climate](https://codeclimate.com/repos/52c4c7ca6956804bb2000905/badges/5a971515dcfd43cf57e1/gpa.svg)](https://codeclimate.com/repos/52c4c7ca6956804bb2000905/feed) [![Coverage Status](https://coveralls.io/repos/ckundo/access_lint/badge.png?branch=master)](https://coveralls.io/r/ckundo/access_lint?branch=master)

Run web accessibility audits on urls or files, from the command line or within Ruby.

## About

AccessLint uses the [Accessibility Developer Tools](https://github.com/GoogleChrome/accessibility-developer-tools) javascript library to make assertions on the DOM via PhantomJS. The rules that are applied are [listed below](#rules).

## Installation

First, install PhantomJS ([full guide](http://phantomjs.org/)). On OS X:

    $ brew install phantomjs

Then install the rubygem:

    $ gem install access_lint

## Usage

### Command Line

From the command line, specify a url or filename to be audited:

    $ access_lint audit http://twitter.com # url or a path to a file
    # results ...

### Ruby

Run the audit from a Ruby application like so

    $ irb
    > require 'access_lint'
    => true
    > AccessLint::Audit.new('http://twitter.com').run
    => results ...

### Results Object

    {
        "PASS": [                                                           # Status group
            {
                "element_names": ["<p class=\"foo\">relevant element</p>"], # applicable DOM elements
                "severity": "WARNING",                                      # 'WARNING' or 'SEVERE'
                "status": "PASS",                                           # 'PASS', 'FAIL', or 'NA'
                "title": "Some description"                                 # rule description
            },
            { ... }
        ],
        "NA": [ { ... } ],
        "FAIL": [ { ... }]
    ]

## Rules

For full descriptions of the audit rules, visit the [Accessibility Developer Tools project wiki](https://github.com/GoogleChrome/accessibility-developer-tools/wiki/Audit-Rules)

* An element's ID must not be present in more that one aria-owns attribute at any time
* ARIA attributes which refer to other elements by ID should refer to elements which exist in the DOM
* aria-owns should not be used if ownership is implicit in the DOM
* ARIA state and property values must be valid
* Audio elements should have controls
* Avoid positive integer values for tabIndex
* Controls and media elements should have labels
* Elements with ARIA roles must have all required attributes for that role
* Elements with ARIA roles must use a valid, non-abstract ARIA role
* Images should have an alt attribute
* Meaningful images should not be used in element backgrounds
* role=main should only appear on significant elements
* The purpose of each link should be clear from the link text
* The web page should have a title that describes topic or purpose
* The web page should have the content's human language indicated in the markup
* Text elements should have a reasonable contrast ratio
* Video elements should use <track> elements to provide captions

## Roadmap

Visit the project backlog: <https://www.pivotaltracker.com/s/projects/985186>.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

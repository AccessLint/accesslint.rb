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

Code        | Title
------------|------------------------------------------------------------------
AX_ARIA_01  | Elements with ARIA roles must use a valid, non-abstract ARIA role
AX_ARIA_02  | ARIA attributes which refer to other elements by ID should refer to elements which exist in the DOM
AX_ARIA_03  | Elements with ARIA roles must have all required attributes for that role
AX_ARIA_04  | ARIA state and property values must be valid
AX_ARIA_05  | role=main should only appear on significant elements
AX_ARIA_06  | aria-owns should not be used if ownership is implicit in the DOM
AX_ARIA_07  | An element's ID must not be present in more that one aria-owns attribute at any time
AX_AUDIO_01 | Audio elements should have controls
AX_COLOR_01 | Text elements should have a reasonable contrast ratio
AX_FOCUS_03 | Avoid positive integer values for tabIndex
AX_HTML_01  | The web page should have the content's human language indicated in the markup
AX_IMAGE_01 | Meaningful images should not be used in element backgrounds
AX_TEXT_01  | Controls and media elements should have labels
AX_TEXT_02  | Images should have an alt attribute
AX_TEXT_04  | The purpose of each link should be clear from the link text
AX_TITLE_01 | The web page should have a title that describes topic or purpose
AX_VIDEO_01 | Video elements should use <track> elements to provide captions

## Roadmap

Visit the project backlog: <https://www.pivotaltracker.com/s/projects/985186>.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

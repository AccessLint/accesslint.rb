# AccessLint
Command line runner for Google Accessibility Developer Tools.

## Installation

Install phantomjs:

    $ brew install phantomjs

Add this line to your application's Gemfile:

    gem 'access_lint'

And then execute:

    $ bundle

## Usage

    $ bundle exec access_lint <url-or-filename>

### Example

    $ bundle exec access_lint http://github.com
    > *** Begin accessibility audit results ***
    An accessibility audit found
    Warnings:
    Warning: AX_FOCUS_01 (These elements are focusable but either invisible or obscured by another element) failed on the following element:
    body > .container > .site-footer > A
    See https://code.google.com/p/accessibility-developer-tools/wiki/AuditRules#AX_FOCUS_01:_These_elements_are_focusable_but_either_invisible_o for more information.

    Warning: AX_COLOR_01 (Text elements should have a reasonable contrast ratio) failed on the following elements (1 - 5 of 15):
    #site-container > .marketing-section.marketing-benefits > .container > .row > .one-third.column:nth-of-type(3) > P > A
    #site-container > .marketing-section.marketing-desktop > .container > .marketing-header > .show-mac.show-linux > .text-muted
    #site-container > .marketing-section.marketing-desktop > .container > .marketing-header > .show-mac.show-linux > .text-muted > A
    body > .container > .site-footer > .site-footer-links.right > LI > A
    body > .container > .site-footer > .site-footer-links.right > LI:nth-of-type(2) > A
    See https://code.google.com/p/accessibility-developer-tools/wiki/AuditRules#AX_COLOR_01:_Text_elements_should_have_a_reasonable_contrast_rat for more information.


    *** End accessibility audit results ***

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# access-lint
A command line runner for [Google's Accessibility Developer Tools](https://github.com/GoogleChrome/accessibility-developer-tools).

Google's Accessibility Developer Tools perform basic accessibility assertions on a rendered page.
This runner applies those assertions via the command line during a [phantomjs](http://phantomjs.org/) session.
Use it with the knowledge that it *will not capture most accessibility failures*.
These assertions catch "low-hanging fruit".

## Usage

    $ cd /path/to/access-lint/
    $ git submodule update --init
    $ phantomjs bin/auditor.js <url or filepath>

## Example

    $ phantomjs auditor.js http://github.com    # you can also audit a file
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

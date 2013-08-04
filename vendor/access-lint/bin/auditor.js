// do stuff
var page = require('webpage').create(),
    system = require('system'),
    url;

if (system.args.length !== 2) {
  console.log('Usage: phantomjs auditor.js URL');
  phantom.exit();
} else {
  url = system.args[1];
  page.open(url, function (status) {
    if (status === 'success') {
      page.injectJs('../vendor/google-chrome/axs_testing.js');
      var report = page.evaluate(function() {
        var results = axs.Audit.run();
        return axs.Audit.createReport(results);
      });
      console.log(report);
      phantom.exit();
    } else {
      console.log('Failed to load the page at ' + 
        url +
        ". Status was: " +
        status
        );
      phantom.exit();
    }
  });
}

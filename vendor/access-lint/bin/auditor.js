var page = require('webpage').create(),
    system = require('system'),
    url;

page.settings.resourceTimeout = 10000;
page.onResourceTimeout = function(e) {
  console.log(e.errorCode);   // it'll probably be 408
  console.log(e.errorString); // it'll probably be 'Network timeout on resource'
  console.log(e.url);         // the url whose request timed out
  phantom.exit(1);
};

page.onError = function(message) {
  // suppress errors
};

if (system.args.length !== 2) {
  console.log('Usage: phantomjs auditor.js URL');
  phantom.exit();
} else {
  url = system.args[1];
  page.open(url, function (status) {
    if (status === 'success') {
      page.injectJs('../../google-chrome/accessibility-developer-tools/gen/axs_testing.js');

      var report = page.evaluate(function() {
        var raw_results = axs.Audit.run();
        var results = [];

        for(var i = 0; i < raw_results.length; i++) {
          var element_names = [];
          var elements = raw_results[i]['elements'];

          if(elements !== undefined) {
            for(var j = 0; j < elements.length; j++) {
              var element = elements[j];
              var tmp = document.createElement("div");
              tmp.appendChild(element);
              element_names.push(tmp.innerHTML);
            }
          }

          results.push({
            status: raw_results[i]['result'],
            title: raw_results[i]['rule']['heading'],
            severity: raw_results[i]['rule']['severity'],
            element_names: element_names,
            elements: raw_results[i]['elements'],
            code: raw_results[i]['rule']['code'],
            url: raw_results[i]['rule']['url']
          });
        }

        return results;
      });

      console.log(JSON.stringify(report));
      phantom.exit();
    } else {
      console.log('Failed to load the page at ' + url + ".");
      phantom.exit();
    }
  });
}

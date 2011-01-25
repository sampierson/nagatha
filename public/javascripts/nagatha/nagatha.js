Nagatha = {

  /*
   * This is the page-specific JavaScript framework.  It allows you to target JS to only run for one page (specific
   * controller/action) or for all actions for a specific controller.
   *
   * How it works:
   *
   * We uniquely identify pages by putting the Rails controller/action names in data-controller_name and
   * data-action_name on the HTML body tag.
   *
   * At page load time, these names are converted into 2 JavaScript classes,
   * e.g. for controller#action FooController#bar, the class names Nagatha.FooPages and Nagatha.FooBarPage are generated.
   *
   * If either of these classes actually exist, it's init() method is called.
   *
   * We store the page specific JS class definitions in javascripts/nagatha/pages.
   * All files there are automatically included in the page.
   */
  Pages: {
    init : function() {
      Nagatha.Pages.pageSpecificInit();
    },

    pageSpecificInit: function() {
      var controllerName = $('body').attr('data-controller_name');
      var actionName = $('body').attr('data-action_name');
      if (controllerName == undefined) {
        return;
      }

      var controllerClassName = Nagatha.camelCase(controllerName) + 'Pages';
      if(Nagatha[controllerClassName]) {
        Nagatha[controllerClassName].init();
      }

      var pageClassName =  Nagatha.camelCase(controllerName) + Nagatha.camelCase(actionName) + 'Page';
      if(Nagatha[pageClassName]) {
        Nagatha[pageClassName].init();
      }
    }
  },

  camelCase: function(str) {
    var newStr = str.replace(/_(.)/g, function(match, firstChar) {
      return firstChar.toUpperCase();
    });
    return newStr.replace(/^(.)/, function(match, firstChar) {
      return firstChar.toUpperCase();
    });
  }
};

$(document).ready(Nagatha.Pages.init);

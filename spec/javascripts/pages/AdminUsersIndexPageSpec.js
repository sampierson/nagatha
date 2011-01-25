describe("Nagatha.AdminUsersIndexPage", function() {
  beforeEach(function() {
    loadFixtures('admin_users_controller_index.html');
  });

  describe("init", function() {
    it("should add behavior to the user table headings", function() {
      spyOn(Nagatha.AdminUsersIndexPage, 'addBehaviorToUsersTableHeadings');
      Nagatha.AdminUsersIndexPage.init();
      expect(Nagatha.AdminUsersIndexPage.addBehaviorToUsersTableHeadings).toHaveBeenCalled();
    });

    it("should add behavior to the search form", function() {
      spyOn(Nagatha.AdminUsersIndexPage, 'addBehaviorToSearchForm');
      Nagatha.AdminUsersIndexPage.init();
      expect(Nagatha.AdminUsersIndexPage.addBehaviorToSearchForm).toHaveBeenCalledWith();
    });
  });

  describe("addBehaviorToUsersTableHeadings", function() {
    it("should setup column headings to invoke getScript with a sort column & direction", function() {
      spyOn(jQuery, 'getScript');
      Nagatha.AdminUsersIndexPage.addBehaviorToUsersTableHeadings();
      var $roleLink = $('#users th.role a');
      $roleLink.click();
      expect($.getScript).toHaveBeenCalled();
      expect($.getScript.mostRecentCall.args[0]).toMatch('/admin/users\\?direction=asc&sort=role$');
    });
  });

  describe("addBehaviorToSearchForm", function() {
    it("should setup the search form to perform a get with the search input value", function() {
      spyOn(jQuery, 'get');
      Nagatha.AdminUsersIndexPage.addBehaviorToSearchForm();
      var $form = $('form#users_search');
      $('input#search').val('fake-search');
      $form.submit();
      expect($.get).toHaveBeenCalled();
      expect($.get.mostRecentCall.args[0]).toMatch('/admin/users$');
      expect($.get.mostRecentCall.args[1]).toMatch('search=fake-search');
    });
  });
});

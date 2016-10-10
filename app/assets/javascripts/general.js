const General = {
  sideMenu: function () {
    $('#menuTrigger').on('click', function () {
      $('.sidebar.menu').sidebar('toggle')
    })
  }
}

General.sideMenu();

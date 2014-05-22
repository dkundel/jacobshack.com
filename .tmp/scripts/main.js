(function() {
  jQuery(function() {
    var currentSection;
    currentSection = '';
    $(window).scroll(function() {
      var aboutPos, faqPos, newSection, sponsorsPos, topView, yDifferenceHeader;
      aboutPos = aboutPos != null ? aboutPos : $('#about').offset().top;
      sponsorsPos = sponsorsPos != null ? sponsorsPos : $('#sponsors').offset().top;
      faqPos = faqPos != null ? faqPos : $('#faq').offset().top;
      yDifferenceHeader = -($('header').outerHeight() + 10);
      topView = $(window).scrollTop() - yDifferenceHeader;
      newSection = '';
      if (topView > faqPos) {
        newSection = 'faq';
      }
      if (newSection.length === 0 && topView > sponsorsPos) {
        newSection = 'sponsors';
      }
      if (newSection.length === 0 && topView > aboutPos) {
        newSection = 'about';
      }
      if (newSection !== currentSection) {
        $('#' + currentSection + 'Link').removeClass('active');
        $('#' + newSection + 'Link').addClass('active');
        return currentSection = newSection;
      }
    });
    return window.addEventListener("hashchange", function() {
      var hash, yDifferenceHeader;
      yDifferenceHeader = -($('header').outerHeight() + 10);
      hash = window.location.hash.substr(1);
      if (!(hash === 'top' || hash.length === 0)) {
        return scrollBy(0, yDifferenceHeader);
      }
    });
  });

}).call(this);

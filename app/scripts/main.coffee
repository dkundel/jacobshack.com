jQuery ->
  currentSection = ''

  $(window).scroll ->
    aboutPos = aboutPos ? $('#about').offset().top
    sponsorsPos = sponsorsPos ? $('#sponsors').offset().top
    faqPos = faqPos ? $('#faq').offset().top

    yDifferenceHeader = -($('header').outerHeight()+10)
    topView = $(window).scrollTop() - yDifferenceHeader

    newSection = ''
    newSection = 'faq' if topView > faqPos
    newSection = 'sponsors' if newSection.length is 0 and topView > sponsorsPos
    newSection = 'about' if newSection.length is 0 and topView > aboutPos

    unless newSection is currentSection
      $('#'+currentSection+'Link').removeClass('active')
      $('#'+newSection+'Link').addClass('active')
      currentSection = newSection


  window.addEventListener("hashchange", ->
      yDifferenceHeader = -($('header').outerHeight()+10)
      hash = window.location.hash.substr 1
      scrollBy(0, yDifferenceHeader) unless hash is 'top' or hash.length is 0
    )

'use strict';
var isTouchDevice = navigator.userAgent.match(/(iPhone|iPod|iPad|Android|BlackBerry|Windows Phone)/);

$(window).on('load', function () {
  // PRELOADER
  var $preloader = $('.page-preloader'),
      $spinner   = $preloader.find('.spinner');
  $spinner.fadeIn();
  $spinner.fadeOut();
  $preloader.delay(300).fadeOut('slow');
});

$(document).ready(function () {
  function removeScrollSection(elem) {
    elem.each(function(){
      if ($(this).find('.'+scrollClassSection).length>0) {
        $('.'+scrollClassSection).children().unwrap();
      }
    })
  }
  function scrollSection(elem) {
    var t = 0;
    var scrollHeight = $(window).height() - parseInt(elem.css('padding-bottom'), 10) - parseInt(elem.css('padding-top'), 10);
    elem.each(function() {
      $(this).children().each(function(){
        t+=$(this)[0].scrollHeight;
      });
      if (t > scrollHeight) {
        if ($(this).find('.'+scrollClassSection).length<=0 && $(window).width()>=768) {
          if (isTouchDevice) {
            $(this).children().wrapAll( "<div class='"+scrollClassSection+"'></div>" );
            $(this).find('.'+scrollClassSection).css({
              height: '100%',
              "overflow-y": 'auto',
              "-webkit-overflow-scrolling": "touch"
            })
          } else if (!isTouchDevice) {
            $(this).mCustomScrollbar({
              axis      :"y",
              scrollInertia : 150
            });
            $(this).find('.mCSB_inside>.mCSB_container').css({
              marginRight: '0px'
            })
          }
        }
      }
      if ($(window).width()<768) {
        if ($(this).find('.'+scrollClassSection).length>0) {
          removeScrollSection(elem);
        }
        else if ($(this).find('.mCustomScrollBox')){
          $(this).mCustomScrollbar('destroy');
        }
      } else if(isTouchDevice) {
        $(this).find('.'+scrollClassSection).css({
          height: $(this).height(),
        });
        if ($('.fullpage').length) {
          $.fn.fullpage.setAllowScrolling(false);
          $.fn.fullpage.setKeyboardScrolling(false);
          $.fn.fullpage.setAutoScrolling(true);
        }
      }
      t=0
    })
  }

  // add class for menu item hover for !isTouchDevice
  if (!isTouchDevice) {
    $('nav').addClass('cl-effect-5')
  }

  blurBg();
  countDown();
  navMenu();
  retina();

  /* ADD SPAN FOR BORDER BLOCK */
  $('.border-block').append('<span></span>');
  /* END ADD SPAN FOR BORDER BLOCK */

  //add array of menu
  var arrayMenuAnchor = []

  $('.section-menu').find('li').each(function() {
    arrayMenuAnchor.push($(this).data('menuanchor'));
  });

  var scrollClassSection = 'scrollSection';
  var duration = 300;
  var sectionDelay = 0;
  var globalDelay = 0;
  var fullPageDesctop;

  //function for fullPage plugin
  if($('.fullpage').length) {
    $('.fullpage').fullpage({
      menu: '.section-menu',
      anchors:arrayMenuAnchor,
      navigation: false,
      scrollOverflow: false,
      css3: false,
      verticalCentered: false,
      sectionSelector: 'section',
      responsive: 768,
      afterLoad: function(anchorLink, index){

        sectionDelay = 300;

        $(this).find('[data-animation-delay]').each(function() {
          sectionDelay = Math.max(sectionDelay, $(this).attr('data-animation-delay'));
          globalDelay = duration+sectionDelay;
        });


        if ($(window).width()>=768) {
          setTimeout(function(){
            $('section.active')
                .css({
                  visibility: 'visible'
                })
                .animate({
                  opacity: 1
                }, 300);

            animateStart();

          }, globalDelay+200)
        }
      },

      onLeave: function(index, nextIndex, direction){
        if ($(window).width()>=768) {
          setTimeout(function(){
            animateFinish();
          }, 0);


          $(this).find('[data-out-animation-delay]').each(function() {
            sectionDelay = Math.max(sectionDelay, $(this).attr('data-out-animation-delay'))
            globalDelay = duration+sectionDelay;
          });

          setTimeout(function(){
            $('section').each(function(){
              if (!$(this).hasClass('active')) {
                $(this)
                    .animate({
                      opacity: 0
                    }, 300)
                    .delay(350)
                    .css({
                      visibility: 'hidden'
                    });
              }
            })
          }, globalDelay+200);

          $('main').css({
            "-webkit-transition": "top 0ms ease "+globalDelay+"ms",
            "-o-transition": "top 0ms ease "+globalDelay+"ms",
            "transition": "top 0ms ease "+globalDelay+"ms"
          });
        };
      },

      afterRender: function() {
        if ($(window).width()>=768) {
          $('section.active [data-animation]').each(function() {
            $(this).addClass('animated');
          });

          fullPageDesctop = true;

          var footer = $('footer')[0].innerHTML;
          $('footer').css({
            opacity: 0
          });

          $( "section" ).append(footer);
          $('.section-content').append('<div class="border-top"></div>');
          $('.section-content').append('<div class="border-bottom"></div>');

          $('section').each(function(){

            var HSC = function(elem) {
              if (elem.find('.share').length>0) {
                return 36;
              } else {
                return 0;
              }
            };

            $(this).find('.section-content-wrapper')
                .css({
                  paddingTop: '50px',
                  paddingBottom: '50px',
                  overflow: 'hidden',
                  display: 'table',
                  height: $(window).height()-120-120-HSC($(this))
                });
          })
        } else {
          $('[data-animation]').each(function() {
            $(this).removeClass($(this).data('animation'));
          });

          fullPageDesctop = false;

          $('section').each(function() {
            $(this).css({
              height: 'auto'
            })
          });

          $('.section-content-wrapper').each(function(){
            $(this).css({
              paddingTop: '0px',
              paddingBottom: '0px',
              marginBottom: '0px',
              height: 'auto'
            })
          })
        }

        setTimeout(function(){
          scrollSection($('section'));
        },300)
      },

      afterResize: function() {
        $('section').each(function(){
        });
        if ($(window).width()>=768) {
          setTimeout(function(){
            $('body').css('height', '')
          }, 400);

          $('[data-animation]').each(function() {
            $(this).addClass('animated');
          });

          if (fullPageDesctop == false) {

            fullPageDesctop = true;

            $('section')
                .css({
                  visibility: 'hidden'
                })
                .animate({
                  opacity: 0
                }, 1);

            $('section.active')
                .css({
                  visibility: 'visible'
                })
                .animate({
                  opacity: 1
                }, 300);

            $('.section-content').append('<div class="border-top"></div>');
            $('.section-content').append('<div class="border-bottom"></div>');

            borderWr();

            var footer = $('footer')[0].innerHTML;
            $( "section" ).append(footer);

            $('footer').animate({
              opacity: 0
            }, 1);

            animateFinish();
            animateStart();
          }

          $('section').each(function(){
            var HSC = function(elem) {
              if (elem.find('.share').length>0) {
                return 33;
              } else {
                return 0;
              }
            };

            $(this).find('.section-content-wrapper')
                .css({
                  paddingTop: '50px',
                  paddingBottom: '50px',
                  overflow: 'hidden',
                  display: 'table',
                  height: $(window).height()-120-120-HSC($(this)),
                });
          })
        } else if ($(window).width()<768) {
          $('[data-animation]').each(function() {
            $(this).removeClass('animated');
          });

          $('section').each(function() {
            $(this).css({
              height: 'auto'
            })
          });

          $('.section-content-wrapper').css({
            paddingTop: '0px',
            paddingBottom: '0px',
            marginBottom: '0px',
            height: 'auto'
          });

          $('section, footer').animate({
            opacity: 1
          }, 1);
          $('section').css({
            visibility: 'visible'
          });

          if (fullPageDesctop == true) {

            fullPageDesctop = false;

            $('.border-top, .border-bottom').remove();
            $( "section .copyright" ).remove();
          }
        }

        setTimeout(function() {
          scrollSection($('section'))
        }, 300)
      }
    });
  } else {

    var link = $('nav .section-menu > li > a');

    link.on('click', function(e) {
      var headerHeight = $('header').height()+parseInt($('header').css('padding-top'), 10)+parseInt($('header').css('padding-bottom'), 10);
      var target = $(this).attr('href');
      target = target.replace('#','');
      var destination = $('section[data-anchor="'+target+'"]');

      if (target.length) {
        $('body, html').animate({
          scrollTop: destination.offset().top - (headerHeight - parseInt($('section').css('padding-top'), 10))
        }, 400);
      }

      e.preventDefault();

    });
  }


  if (isTouchDevice) {
    $( ".team-portfolio-list .item" ).wrapAll( "<div class='about-us-item-wrapper'></div>" );
    $(".about-us-item-wrapper").css({
      "overflow-y": 'auto',
      "-webkit-overflow-scrolling": "touch"
    })
  }

  //remove scroll of section for modal
  $('.modal').each(function() {
    $(this).on('show.bs.modal', function () {
      setTimeout(function(){
        $('header, main, footer').css('opacity', '0')
      }, 300);

      setTimeout(function(){
        $('body').css('overflow', 'hidden')
      }, 200);

      if ($('main').hasClass('fullpage')) {

        $.fn.fullpage.setAllowScrolling(false);
        $.fn.fullpage.setKeyboardScrolling(false);

      }
    });
  });

  $('.modal').each(function() {
    $(this).on('hide.bs.modal', function () {

      $('body').css({
        overflow: 'visible'
      });

      /* back to start of smoothdivscroll after close modal */
      setTimeout(function(){
        $('.scrollWrapper').scrollLeft(0)
      }, 150);

      setTimeout(function(){
        $('header, main, footer').css('opacity', '1')
      }, 300);

      if ($('main').hasClass('fullpage')) {

        setTimeout(function(){
          $('body').css('height', '100%')
        }, 550);

        if (!isTouchDevice) {

          $.fn.fullpage.setAllowScrolling(true);
          $.fn.fullpage.setKeyboardScrolling(true);

        } else {

          $.fn.fullpage.setAllowScrolling(false);
          $.fn.fullpage.setKeyboardScrolling(false);

        }
      }
    });
  });

  $('.team-portfolio-list .item').find('img').slice(-maxPortfolioItems()).each(function(){
    var imgSrc = $(this)[0].src;
    imgSrc = imgSrc.replace('@2x','');
    $(".preview-team-portfolio a").append('<img src="'+imgSrc+'">')
  });

  $('.bt-nav').on( 'click', function() {
    if ($('.nav').hasClass('nav-close')) {
      $('.nav').removeClass('nav-close');
      $('.nav').addClass('nav-open');
      $('.brand').removeClass('fadeInLeft');
      $('.brand').addClass('fadeOutLeft');
      $('.section-menu').removeClass('fadeOutRight');
      $('.section-menu').addClass('fadeInRight');
    } else {
      $('.nav').removeClass('nav-open');
      $('.nav').addClass('nav-close');
      $('.brand').removeClass('fadeOutLeft');
      $('.brand').addClass('fadeInLeft');
      $('.section-menu').removeClass('fadeInRight');
      $('.section-menu').addClass('fadeOutRight');
    }
  });

  /****** SERVICES *******/
  var cssSmall = {
    width: 67
  };
  var cssMedium = {
    width: 130
  };
  var cssLarge = {
    width: 360
  };
  var aniConf = {
    queue: false,
    duration: 500
  };

  if ($('body').width()>=768) {
    $('.feature-slide')
        .children().css(cssSmall)
        .eq(3).css(cssLarge);
  } else {
    $('.feature-slide')
        .children().css(cssSmall)
        .eq(3).css(cssMedium);
  }

  if ($('.feature-slide').length) {
    $('.feature-slide').carouFredSel({
      width: '100%',
      height:'auto',
      top: 0,
      items: 7,
      auto: false,
      padding: 10,
      swipe: {
        onTouch : true,
        onMouse : true
      },

      onCreate: function( data ) {
        $(this).find('.item').eq(3).addClass('active');
      },

      scroll: {
        items: 1,
        duration: aniConf.duration,

        onBefore: function( data ) {
          data.items.old.removeClass('active');
          $('.feature-item-description').animate({
            opacity: 0
          }, 300);

          //  0 [ 1 ] 2  3  4  5  6  7
          data.items.visible.eq(0).animate(cssSmall, aniConf);
          data.items.visible.eq(1).animate(cssSmall, aniConf);
          data.items.visible.eq(2).animate(cssSmall, aniConf);
          if ($('body').width()>=768) {
            data.items.visible.eq(3).animate(cssLarge, aniConf);
          } else {
            data.items.visible.eq(3).animate(cssMedium, aniConf);
          }
          data.items.visible.eq(4).animate(cssSmall, aniConf);
          data.items.visible.eq(5).animate(cssSmall, aniConf);
          data.items.visible.eq(6).animate(cssSmall, aniConf);
          data.items.visible.eq(7).animate(cssSmall, aniConf);
        },

        onAfter: function( data ) {
          data.items.visible.eq(3).addClass('active')
          $('.feature-item-description').delay(150).animate({
            opacity: 1
          }, 300);

          setTimeout(changeText, 1, $('.wrapper-feature-slide'), $(this).find('.active'))
        }
      }
    });
  }

  function triggerMove(containerElement, elem) {
    containerElement.trigger( 'slideTo', [elem, 5] );
  }

  function changeText(container, elem) {
    container.find('.feature-item-description').html(elem.find('figcaption').html())
  }

  var serviceItemText = $('.wrapper-feature-slide .item.active').find('figcaption').html();
  $('.wrapper-feature-slide').find('.feature-item-description').html(serviceItemText)

  $('.feature-slide').children().on( 'click', function() {
    setTimeout(triggerMove, 300, $('.feature-slide'), $(this))
  });
  $('.feature-slide').children().on( 'touchstart', function() {
    setTimeout(triggerMove, 300, $('.feature-slide'), $(this))
  });

  if ($('body.underconstruction').length) {
    var headerHeight = $('header').height() + parseInt($('header').css('margin-bottom'), 10) + parseInt($('header').css('margin-top'), 10);
    var footerHeight = $('footer').height() + parseInt($('footer').css('padding-bottom'), 10) + parseInt($('footer').css('padding-top'), 10);
    var secUnderHeig = $(window).height() - headerHeight;


    setTimeout(function() {
      $('section').mCustomScrollbar({
        setHeight: secUnderHeig,
        axis      :"y",
        scrollInertia : 150
      })
          .find('.mCSB_inside>.mCSB_container').css({
            marginRight: '0px'
          });
      if (isTouchDevice) {
        $('section')
            .mCustomScrollbar('destroy')
            .css({
              "overflow-y": 'auto',
              "-webkit-overflow-scrolling": "touch"
            })
      }
    }, 300);


    $('.section-content').append('<div class="border-top"></div>');
    $('.section-content').append('<div class="border-bottom"></div>');

    borderWr();

    $('section').find('.section-content-wrapper')
        .css({
          paddingTop: '85px',
          paddingBottom: '85px',
          overflow: 'hidden',
          display: 'table',
          height: $(window).height()-headerHeight-footerHeight,
        });

    $('section').find('[data-animation]').each(function(){

      var $this     = $(this),
          animation = 'fadeIn',
          delay     = 1;

      if ($this.data('animation')){
        animation = $this.data('animation');
      }

      if ($this.data('animationDelay')){
        delay = $this.data('animationDelay');
      }

      if (!$this.closest('section').hasClass('active')){
        $this.css('animation-delay', delay + 'ms').addClass('animated').addClass(animation);
      }
    });
  };

  $('.form-control').on('focus', function(){
    if(navigator.userAgent.match(/(Android)/) && $('.fullpage').length && $('body').width()>=768) {
      $('body').css({
        position: 'relative',
      });

      $('body, html').css('overflow', 'hidden');
      $('body, html').css('height', '100%');

    }
  })
      .blur(function(){
        if(navigator.userAgent.match(/(Android)/) && $('.fullpage').length && $('body').width()>=768) {
          setTimeout(function(){
            $('body, html').css('overflow', '');
            $('body, html').css('position', '');
            $('body, html').css('height', '');
          }, 1000)
        }
      });

  $(window).resize(function() {

    navMenu();

    if ($('body.underconstruction').length) {
      var headerHeight = $('header').height() + parseInt($('header').css('margin-bottom'), 10) + parseInt($('header').css('margin-top'), 10);
      var footerHeight = $('footer').height() + parseInt($('footer').css('padding-bottom'), 10) + parseInt($('footer').css('padding-top'), 10);
      var secUnderHeig = $(window).height() - headerHeight;

      $('section').css('height', secUnderHeig)

      $('section').find('.section-content-wrapper')
          .css({
            height: $(window).height()-headerHeight-footerHeight,
          });
    }

    $('.team-portfolio-list .item').find('img').slice(-maxPortfolioItems()).each(function(){
      var imgSrc = $(this)[0].src;
      imgSrc = imgSrc.replace('@2x','');
      $(".preview-team-portfolio a").append('<img src="'+imgSrc+'">')
    });

    if ($('body').width()>=768) {
      setTimeout(function(){
        $('.feature-slide').trigger('slideTo', [$(this).find('.active'), 6]);
      }, 300);
      $('.feature-slide')
          .children().css(cssSmall)
          .eq(3).css(cssLarge);

    } else {
      setTimeout(function(){
        $('.feature-slide').trigger('slideTo', [$(this).find('.active'), 6]);
      }, 300);
      $('.feature-slide')
          .children().css(cssSmall)
          .eq(3).css(cssMedium);
    }
  });

  var landingBoxes = function() {
    var $original = null;

    $(".rate-cta").each(function(){
      $(this).hover(
          function() {
            if($original === null)
              $original = document.getElementById('initial_text').innerHTML;
            $('.lead').html($(this).attr('title'));
          },
          function(){
            $('.lead').html($original)
          }
      );
    });
  };

  landingBoxes();

  var promptModal = function() {
    var modal = document.getElementById('my_modal');

    var span = document.getElementsByClassName('close')[0];

    setTimeout(function() {
      modal.style.display = 'block';
    }, 5000);

    if(span) {
      span.onclick = function() {
        modal.style.display = 'none';
      };
    }

    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = 'none';
      }
    };
  };

  if($('body').is('.landing')){
    promptModal();
  }
});

//Count Down
function countDown() {
  if (($('.countdown').length) && ($.fn.countdown)) {
    var countdown = $('.countdown');

    countdown.each(function (){
      var $this   = $(this),
          austDay = new Date(2016, 1-1, 1);

      if ($this.data('date')){
        var date = $this.data('date').split(' ');

        austDay = new Date(parseFloat(date[0]), parseFloat(date[1]) - 1, parseFloat(date[2]));
      }

      $this.countdown({
        until       : austDay,
        format      : 'DHMS',
        significant : 1,
        description : ' left',
        padZeroes: true
      });
    });
  }
}
function navMenu() {
  $('.brand').removeClass('fadeOutLeft');
  $('.brand').addClass('fadeInLeft');
  if ($(window).width()>=768) {
    $('.nav').removeClass('nav-close');
    $('.nav').addClass('nav-open');
    $('.section-menu').removeClass('fadeOutRight');
    $('.section-menu').addClass('fadeInRight');
  }
  else if ($(window).width()<768) {
    $('.nav').removeClass('nav-open');
    $('.nav').addClass('nav-close');
    $('.section-menu').removeClass('fadeInRight');
    $('.section-menu').addClass('fadeOutRight');
  }
}
function blurBg() {
  if ($('.blur-bg').length) {
    $('.blur-bg').blurjs({
      source: '.bg-image',
      radius: 10,
    });
  }
}
function maxPortfolioItems() {
  if ($('body').width()>1170) {
    return 5;
  } else if ($('body').width()>992) {
    return 4;
  } else if ($('body').width()>485) {
    return 3;
  } else {
    return 3;
  }
}
//Animate Start
function animateStart(){
  $('section.active').find('[data-animation]').each(function(){

    var $this     = $(this),
        animation = 'fadeIn',
        delay     = 1;

    if ($this.data('animation')){
      animation = $this.data('animation');
    }

    if ($this.data('animationDelay')){
      delay = $this.data('animationDelay');
    }

    if ($this.closest('section').hasClass('active')){
      $this.css('animation-delay', delay + 'ms').addClass('animated').addClass(animation);
    }
  });
}
//Animate Finish
function animateFinish(){
  var activeSection = $('section.active'),
      duration      = 1;

  $('[data-out-animation]').each(function(){
    var $this        = $(this),
        animation    = 'fadeIn',
        outAnimation = 'fadeOut',
        delay        = 1,
        outDelay     = 1;

    if ($this.data('animation')){
      animation = $this.data('animation');
    }

    if ($this.data('outAnimation')){
      outAnimation = $this.data('outAnimation');
    }

    if ($this.data('animationDelay')){
      delay = $this.data('animationDelay');
    }

    if ($this.data('outAnimationDelay')){
      outDelay = $this.data('outAnimationDelay');
    }

    $this.css('animation-delay', delay + 'ms');



    if (!$this.closest('section').hasClass('active')){

      if (outDelay >= duration) {
        duration = outDelay;
      }

      $this.removeClass(animation).addClass(outAnimation);

      if ($this.data('outAnimationDelay')){
        $this.css('animation-delay', outDelay + 'ms');
      } else {
        $this.css('animation-delay', '1ms');
      }
    } else {
      $this.removeClass(animation).removeClass(outAnimation).removeAttr('style', 'animation-delay');
    }
  });
}
function retina(){

  if( 'devicePixelRatio' in window && window.devicePixelRatio == 2 ){

    var imgToReplace = $('img.replace-2x').get();

    for (var i=0,l=imgToReplace.length; i<l; i++) {
      var src = imgToReplace[i].src;
      src = src.replace(/\.(png|jpg|gif)+$/i, '@2x.$1');
      imgToReplace[i].src = src;
      $(imgToReplace[i]).load(function(){
        $(this).addClass('loaded');
      });
    }

    var imgToReplaceM = $('a.replace-2x').get();

    for (var i=0,l=imgToReplaceM.length; i<l; i++) {
      var src = imgToReplaceM[i].href;
      src = src.replace(/\.(png|jpg|gif)+$/i, '@2x.$1');
      imgToReplaceM[i].href = src;
      $(imgToReplaceM[i]).addClass('loaded');
    }

    $('img').each(function(){
      var item = $(this);
      var retinaSrc = $(this).attr('data-retina-src');

      if(retinaSrc !== undefined) {
        item.attr('src', retinaSrc );
      }
    });

  }
}

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require owl.carousel
//= require easy-responsive-tabs
//= require jquery.easing
//= require jquery.flexslider
//= require jCProgress-1.0.3
//= require jquery.appear
//= require jquery.inview
//= require prettyphoto-rails
//= require prettyphoto-rails-dev
//= require blur
//= require jquery.fullPage.min
//= require jquery.mCustomScrollbar.concat.min
//= require landing
//= require main
//= require home
//= require pastor
//= require lecturer
//= require_self

$(function(){
  $(".remove-active").removeClass('active');
  $('input[type=file]').customFile();
});

var android = navigator.userAgent.toLowerCase().indexOf("android") > -1;
var iOS = /iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream;
if(android || iOS) {
  document.write(
      '<meta name="viewport" content="width=device-width,height='+window.innerHeight+', initial-scale=1.0">'
  );
}

// IMAGE UPLOADER
(function($) {

  var multipleSupport = typeof $('<input/>')[0].multiple !== 'undefined',
      isIE = /msie/i.test( navigator.userAgent );

  $.fn.customFile = function() {
    return this.each(function() {

      var $file = $(this).addClass('custom-file-upload-hidden'),
          $wrap = $('<div class="file-upload-wrapper">'),
          $input = $('<input type="text" class="file-upload-input" />'),

          $button = $('<button type="button" class="file-upload-button">Select a File</button>'),

          $label = $('<label class="file-upload-button" for="'+ $file[0].id +'">Select a File</label>');

      $file.css({
        position: 'absolute',
        left: '-9999px'
      });

      $wrap.insertAfter( $file )
          .append( $file, $input, ( isIE ? $label : $button ) );

      $file.attr('tabIndex', -1);
      $button.attr('tabIndex', -1);

      $button.click(function () {
        $file.focus().click();
      });

      $file.change(function() {

        var files = [], fileArr, filename;

        if ( multipleSupport ) {
          fileArr = $file[0].files;
          for ( var i = 0, len = fileArr.length; i < len; i++ ) {
            files.push( fileArr[i].name );
          }
          filename = files.join(', ');

        } else {
          filename = $file.val().split('\\').pop();
        }

        $input.val( filename )
            .attr('title', filename)
            .focus();

      });

      $input.on({
        blur: function() { $file.trigger('blur'); },
        keydown: function( e ) {
          if ( e.which === 13 ) {
            if ( !isIE ) { $file.trigger('click'); }
          } else if ( e.which === 8 || e.which === 46 ) {
            $file.replaceWith( $file = $file.clone( true ) );
            $file.trigger('change');
            $input.val('');
          } else if ( e.which === 9 ){
            return;
          } else {
            return false;
          }
        }
      });

    });

  };

  if ( !multipleSupport ) {
    $( document ).on('change', 'input.customfile', function() {
      var $this = $(this),
          uniqId = 'customfile_'+ (new Date()).getTime(),
          $wrap = $this.parent(),

          $inputs = $wrap.siblings().find('.file-upload-input')
              .filter(function(){ return !this.value }),

          $file = $('<input type="file" id="'+ uniqId +'" name="'+ $this.attr('name') +'"/>');

      setTimeout(function() {
        if ( $this.val() ) {
          if ( !$inputs.length ) {
            $wrap.after( $file );
            $file.customFile();
          }
        } else {
          $inputs.parent().remove();
          $wrap.appendTo( $wrap.parent() );
          $wrap.find('input').focus();
        }
      }, 1);

    });
  }

}(jQuery));

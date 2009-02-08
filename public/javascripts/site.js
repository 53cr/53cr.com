Cr53 = new Object();

Cr53.konami = function() {
  if ( window.addEventListener ) {
    var state = 0, konami = [38,38,40,40,37,39,37,39,66,65];
    window.addEventListener("keydown", function(e) {
      if ( e.keyCode == konami[state] ) state++;
      else state = 0;
      if ( state == 10 )
        window.location = "http://53cr.com/secret";
    }, true);
  }
};

Cr53.disqus = function() {
	var links = document.getElementsByTagName('a');
	var query = '?';
	for(var i = 0; i < links.length; i++) {
		if(links[i].href.indexOf('#disqus_thread') >= 0) {
			query += 'url' + i + '=' + encodeURIComponent(links[i].href) + '&';
		}
	}
	document.write('<script charset="utf-8" type="text/javascript" src="http://disqus.com/forums/53cr/get_num_replies.js' + query + '"></' + 'script>');
};

$(document).ready(function() {

  Cr53.konami();
  Cr53.disqus();

  $('a').tooltip({
    track: true,
    delay: 0,
    showURL: false,
    showBody: " - ",
    fade: 250
  });

  //============>>> Portfolio Page
  $('.pf-sub').css('position','absolute');

  //todo: make this less confusing.
  $('.portfolio-item').click(function() {
    var name = $(this).attr('id');
    $(".portfolio-item").each(function() {
/*      if($(this).attr('id') == name) {
        $(this).children("img").animate({
            width: "200%",
          }, 1500, function() {
            $(this).animate({width:"50%"}, 1);
        });
        $(this).fadeTo(1500,0.0);
        $('#pf-'+name).fadeIn(1500);
      } else {
        $(this).fadeTo(500,0.0);
      }
*/    });
  });

  //============>>> Contact page.
  if( $("#contact").length > 0 ) {
    // Mandatory field are marked with a '* '.

    var fields = {
      '#name':    '* name',
      '#email':   '* email',
      '#website': 'web address',
      '#message': '* message'
    };

    // Make text disappear on focus and reappear on blur if it wasn't changed.
    $.each(fields, function(sel,text) {
      $(sel).addClass('faded');
      $(sel).focus(function() {
        $(sel).removeClass('faded');
        if($(sel).val() == text) {
          $(sel).val('');
        }
      });
      $(sel).blur(function() {
        if($(sel).val() == '') {
          $(sel).addClass('faded');
          $(sel).val(text);
        }
      });
    });

    // Add some simple form validation.
    $("#submit").click(function() {
      error = false;
      $.each(fields, function(sel,text) {
        if (text.substring(0,1) == '*') { //If this is a required field
          el = $(sel);
          el.removeClass('error');
          if( [text,''].indexOf( el.val() ) != -1) {
            el.addClass('error');
            error = true;
          }
        }
      });

      if(error) { $('#formerrors').slideDown(); }

      return !error;
    });
  }

  //============>>> Front Page.
  $('.block').css('position','absolute').css('width',$('#wrapper').width());
  $("ul#photos li a").click( function() {
    var name = $(this).attr('href');

    // Show chromiumblock again.
    if( $(name).is(':visible') ) {
      $("ul#photos li a").children("img").fadeTo('slow',1.0);
      $('.block').each(function() {
                (this.id == 'chromiumblock') ? $('#'+this.id).fadeIn('slow') : $('#'+this.id).fadeOut('slow');
      });
      return false;
    } else {
      $("ul#photos li a").each(function() {
        ($(this).attr('href') == name) ? $(this).children("img").fadeTo('slow',1.0) : $(this).children("img").fadeTo('slow',0.4);
      });

      $('.block').each(function() {
                (name == '#'+this.id) ? $('#'+this.id).fadeIn('slow') : $('#'+this.id).fadeOut('slow')
      });
      return false;
    }
  });

});

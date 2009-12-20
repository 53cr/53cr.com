$(function(){

  var portfolio_entries = $("#portfolio article");

  portfolio_entries.hover(function(){
    $(this).
      siblings().
      stop().
      animate({ opacity : 0.3 });
  },
  function(){
    $(this).
      siblings().
      stop().
      animate({ opacity : 1 });
  });

  portfolio_entries.children('a').toggle(function(){
    var that = $(this),
        href = that.attr('href');

    that.
      parent().
      siblings().
      animate({opacity:0},'fast',function(){
        if(href) { $(href).fadeIn(); }
  });

  },function(){
    var that = $(this),
        href = that.attr('href'),
        on = function(){
      that.
        parent().
        siblings().
        animate({opacity : 1},'fast');
    }

    href ? $(href).fadeOut(on) : on() ;
  });
});


/**___________________________________________________________________________________
@author WolfHaru/2012
@link http://wolfharu.tistory.com
@version 0.1
___________________________________________________________________________________**/

$.fn.WolfHaruNav = function() {
	var $nav = $(this);
	var $navTotal = $('a.header_mobile_totalMenu');
	var $navContainer = $('.container');
	var $navgnb = $('.nav');
	var $moveContet = $('.section');
	var $tempContet = $moveContet.prepend('<div class="tempsection"></div>').find('.tempsection').css({'position':'absolute','width':'100%','left':'0','top':'0','z-index':'999','backgroundColor':'#000','opacity':0.5}).hide();
	var isAgent = navigator.userAgent.toLowerCase();
	var isMobile = false;
	
	if ( (isAgent.indexOf("iphone") != -1) || (isAgent.indexOf("android") != -1) ) {
		isMobile = true;
	} else {
		isMobile = false;
	}
	
	var fnDeskTopLink = function() {
		$navContainer.css({'height':'auto'});
		$moveContet.removeClass('on');
		$tempContet.hide();
		$navgnb.show();
		$nav.find('li:has(ul)').removeClass('on').find('>a').unbind('click keyup');
		$nav.find('li:has(ul)').find('>a').addClass('iconsub').parent().bind('mouseenter keyup',function() {
			$(this).addClass('on').siblings().removeClass('on');
		}).bind('mouseleave',function() {
			$(this).removeClass('on').siblings().removeClass('on');
		}).parent().find('>li:last-child li:last-child a:last-child').bind('blur',function() {
			$(this).parents('ul').parent().removeClass('on').siblings().removeClass('on');
		});
	}
	
	var fnSmartLink = function() {
		$moveContet.removeClass('on');
		$tempContet.hide();
		$navgnb.hide();
		$nav.find('li:has(ul)').removeClass('on').unbind('mouseenter mouseleave keyup').parent().find('>li:last-child li:last-child a:last-child').unbind('blur');
		$nav.find('li:has(ul)').find('>a').unbind('click keyup').addClass('iconsub').bind('click keyup',function() {
			if ( $(this).parent().hasClass('on') ) {
				$(this).parent().removeClass('on');
			} else {
				$(this).parent().addClass('on').siblings().removeClass('on');
			}
			if ( $tempContet.is(':visible') ) {
				$navContainer.css({'height':$navgnb.height()});
				$tempContet.css({'height':$navgnb.height()}).show();
			}
			return false;
		});
	}
	
	var fnTotalLink = function() {
		if ( $moveContet.hasClass('on') ) {
			$moveContet.removeClass('on');
			setTimeout(function() { $navgnb.hide() },150);
			$navContainer.css({'height':'auto'});
			$tempContet.hide();
		} else {
			$moveContet.addClass('on');
			$navgnb.show();
			$navContainer.css({'height':$navgnb.height()});
			$tempContet.css({'height':$navgnb.height()}).show();
		}
	}
	
	$navTotal.click(function() {
		fnTotalLink();
		return false;
	});
	
	$tempContet.click(function() {
		fnTotalLink();
		return false;
	});
	
	if ( isMobile ) {
		fnSmartLink();
		$(window).load(function() {
			setTimeout(function(){ if(window.pageYOffset==0){ window.scrollTo(0,1) }},100);
		});
	} else {
		var fnDeskTopInit = function() {
			if ( $navgnb.width() > 500 ) {
				fnDeskTopLink();
			} else {
				fnSmartLink();
			}
		}
		$(window).resize(function() {
			fnDeskTopInit();
		});
		fnDeskTopInit();
	}
	

	return this;
}
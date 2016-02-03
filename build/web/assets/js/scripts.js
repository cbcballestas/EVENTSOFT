
jQuery(document).ready(function() {
	
    /*
        Fullscreen background
    */
    $.backstretch([
                    "assets/img/backgrounds/fondo_login.jpg"
	              , "assets/img/backgrounds/fondo_login_2.jpg"
	              , "assets/img/backgrounds/fondo_login_3.JPG"
	             ], {duration: 3000, fade: 750});
    
    /*
        Form validation
    */
    $('.login-form input[type="text"], .login-form input[type="password"]').on('focus', function() {
    	$(this).removeClass('input-error');
    });
    
    $('.login-form').on('submit', function(e) {
        $(this).find('input[type="text"]').each(function(){
    		if( $(this).val() === "" ) {
    			e.preventDefault();
                        $(this).addClass('input-error');
                        alert("Debe ingresar un usuario");
                        $(this).removeClass('input-error');
                        $(this).focus();
                        $(this).stop();
    		}
    		else {
    			$(this).removeClass('input-error');
    		}
    	});
        
        $(this).find('input[type="password"]').each(function(){
    		if( $(this).val() === "" ) {
    			e.preventDefault();
                        $(this).addClass('input-error');
                        alert("Debe ingresar una contraseña");
                        $(this).removeClass('input-error');
                        $(this).focus();
    		}
    		else {
    			$(this).removeClass('input-error');
    		}
    	});
       
    	
    });
    
    
});

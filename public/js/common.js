$(document).ready(function() {
    jQuery('a.callpopup').click(function(e) {
            
        //Cancel the link behavior
        e.preventDefault();
        var id = '.'+ jQuery(this).attr('id');	
        //Get the A tag
	
        //Get the screen height and width
        var maskHeight = jQuery(document).height();
        var maskWidth = jQuery(window).width();
        //Set heigth and width to mask to fill up the whole screen
        jQuery('#mask').css({
            'width':maskWidth,
            'height':maskHeight
        });
		
        //transition effect		
        jQuery('#mask').fadeIn(1000);	
        jQuery('#mask').fadeTo("slow",0.8);	
	
        //Get the window height and width
        var winH = jQuery(window).height();
        var winW = jQuery(window).width();
              
        //Set the popup window to center
        jQuery(id).css({
            'top':  winH/2-jQuery(id).height()/2
        });
        jQuery(id).css('left', winW/2-jQuery(id).width()/2);
	
        //transition effect
        jQuery(id).fadeIn(2000);
        if(jQuery("#scrollbar").length > 0){
            jQuery("#scrollbar").mCustomScrollbar({
                autoHideScrollbar:false,
                scrollButtons:{
                    enable:true,
                    scrollType:"pixels",
                    scrollAmount:116
                }
                                        
            });  
        }
                
	
    });
    
    //if close button is clicked
    jQuery('.dialog-message .close').click(function (e) {
        if(jQuery("#scrollbar").length > 0){
            jQuery("#scrollbar").mCustomScrollbar("destroy");
        }
        //Cancel the link behavior
        e.preventDefault();
		
        jQuery('#mask').hide();
        jQuery('.dialog-message').fadeOut(1000);
    });		
	
    //if mask is clicked
    jQuery('#mask').click(function () {
        jQuery(this).hide();
        jQuery('.dialog-message').fadeOut(500);
        jQuery("#scrollbar").mCustomScrollbar("destroy");
    });			

    jQuery(window).resize(function () {
	 
        var box = jQuery('.dialog-message');
 
        //Get the screen height and width
        var maskHeight = jQuery(document).height();
        var maskWidth = jQuery(window).width();
      
        //Set height and width to mask to fill up the whole screen
        jQuery('#mask').css({
            'width':maskWidth,
            'height':maskHeight
        });
               
        //Get the window height and width
        var winH = jQuery(window).height();
        var winW = jQuery(window).width();

        //Set the popup window to center
        box.css('top',  winH/2 - box.height()/2);
        box.css('left', winW/2 - box.width()/2);
	 
    });
    
   
});
function xgoonmedia(){
    this.scrollbar = function(scrollvar){
        
        jQuery(window).load(function(){
                      
            jQuery(scrollvar).mCustomScrollbar({
                autoHideScrollbar:false,
                scrollButtons:{
                    enable:true,
                    scrollType:"pixels",
                    scrollAmount:116
                }
                                        
            });                                
        });
    }
    this.formvalidate = function(formname){
        
        jQuery(window).load(function(){
            jQuery(formname).validate();
        });
    }
    this.selectcustom = function(elem){
        
        jQuery(window).load(function(){
            
            var haselem = checkelem(elem);
            
            if(haselem ==1) {         
                jQuery(elem).customSelect() ;
                var first = jQuery(elem).find("option").eq(0);
                var value = jQuery(elem).val();                
                if(value==0){
                        first.css('display','none');
                 } 
                jQuery(elem).change(function() {
                    var value = jQuery(this).val();
                    if(value==0){
                        first.css('display','none');
                        jQuery(this).children('option').removeClass('selected');
                    }  
                    if(value!=0){
                       jQuery(this).prepend(first);
                       jQuery(this).children('option').removeClass('selected');
                       jQuery(this).find('option:selected').addClass('selected');                       
                       first.css('display','list-item');
                    }
                    
                });
                
            }
        });
    }
    function checkelem(elem){
        if(jQuery(elem).length > 0) {
            return 1;
        }else{
            return 0;
        }
    } 
     
        
}
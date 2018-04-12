var $yay = jQuery.noConflict();
$yay(document).ready(function(){
	$yay('#show_menu_form').click(function(e){
		e.preventDefault();
		$yay('#menu_form').toggleClass('visible');
		$yay('#content').toggleClass('dimmed');
	});
});
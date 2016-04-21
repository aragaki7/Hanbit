$(document).ready(function(){
	$('.nav2').css('display','none');
	$('.nav3').css('display','none');
	$('.nav4').css('display','none');
	$('.nav5').css('display','none');
	$('.nav6').css('display','none');
	
	//no1
	$('.nav>ul>li>a:eq(0)').on('mouseover',function(){
		$('.nav2').css('display',''); 
		$('.nav3').css('display','');
		$('.nav4').css('display','');
		$('.nav5').css('display','');
		$('.nav6').css('display','');
		return false;
	});
	$('.nav2').mouseleave(function(){ 
		$('.nav2').css('display','none');
		$('.nav3').css('display','none');
		$('.nav4').css('display','none');
		$('.nav5').css('display','none');
		$('.nav6').css('display','none');
		return false;
	});
	
	//no2
	$('.nav>ul>li>a:eq(1)').on('mouseover',function(){
		$('.nav2').css('display',''); 
		$('.nav3').css('display','');
		$('.nav4').css('display','');
		$('.nav5').css('display','');
		$('.nav6').css('display','');
		return false;
	});
	$('.nav3').mouseleave(function(){ 
		$('.nav2').css('display','none');
		$('.nav3').css('display','none');
		$('.nav4').css('display','none');
		$('.nav5').css('display','none');
		$('.nav6').css('display','none');
		return false;
	});
	
	//no3
	$('.nav>ul>li>a:eq(2)').on('mouseover',function(){
		$('.nav2').css('display',''); 
		$('.nav3').css('display','');
		$('.nav4').css('display','');
		$('.nav5').css('display','');
		$('.nav6').css('display','');
		return false;
	});
	$('.nav4').mouseleave(function(){ 
		$('.nav2').css('display','none');
		$('.nav3').css('display','none');
		$('.nav4').css('display','none');
		$('.nav5').css('display','none');
		$('.nav6').css('display','none');
		return false;
	});
	
	//no4
	$('.nav>ul>li>a:eq(3)').on('mouseover',function(){
		$('.nav2').css('display',''); 
		$('.nav3').css('display','');
		$('.nav4').css('display','');
		$('.nav5').css('display','');
		$('.nav6').css('display','');
		return false;
	});
	$('.nav5').mouseleave(function(){ 
		$('.nav2').css('display','none');
		$('.nav3').css('display','none');
		$('.nav4').css('display','none');
		$('.nav5').css('display','none');
		$('.nav6').css('display','none');
		return false;
	});
	
	//no5
	$('.nav>ul>li>a:eq(4)').on('mouseover',function(){
		$('.nav2').css('display',''); 
		$('.nav3').css('display','');
		$('.nav4').css('display','');
		$('.nav5').css('display','');
		$('.nav6').css('display','');
		return false;
	});
	$('.nav6').mouseleave(function(){ 
		$('.nav2').css('display','none');
		$('.nav3').css('display','none');
		$('.nav4').css('display','none');
		$('.nav5').css('display','none');
		$('.nav6').css('display','none');
		return false;
	});
});

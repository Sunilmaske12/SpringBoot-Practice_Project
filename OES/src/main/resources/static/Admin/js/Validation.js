//=================Registration validation start===============
function validRegister(){
	flag=false;
		var name=$("#name").val();
		var mobile=$("#contact").val();
		var email=$("#email").val();
		var Address=$("#Address").val();
		var password=$("#pass").val();
		var confirm_password=$("#re_pass").val();
		var emailEXP=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var mobileEXP=/[0-9]{10}/;
		var passwordEXP=/[A-Z][a-z]*[0-9][a-z]*/;

		if(name=='' || name==undefined){
			$("#name_error").html("***Please enter name!!")
			flag=false;
		} else {
			flag=true;
		}
		if(mobile=='' || mobile==undefined){
			$("#mobile_error").html("***Please enter number !!")
			flag=false;
		} else if(mobileEXP.test(mobile)==false  || mobile.length>10){
			flag=false;
		}  else {
			flag=true;
		}
		if(email==''){
			$("#email_error").html("**Please enter email!!");
			flag=false;
		} else if(emailEXP.test(email)==false){
			flag=false;
		} else {
			flag=true;
		}

		if(Address=='' || Address==undefined){
			$("#address_error").html("Please enter Address!")
			flag=false;
		} else {
			flag=true;
		}

		if(password=='' || password==undefined){
			$("#pass_error").html("Please enter password!!")
			flag=false;
		} else if(passwordEXP.test(password)==false || password.length<8){
			flag=false;
		} else {
			flag=true;
		}


		if(confirm_password=='' || confirm_password==undefined){
			$("#confirm_password_error").html("***Please confirm password!!")
			flag=false;
		 } else if(password!=confirm_password){
	 	flag=false;
		 } else {
			flag=true;
		}

	if(flag){
		swal("Good job!", "Just wait for few seconds!", "success");	
	}	 
			console.log(flag);
		
	return flag;
}


 $(document).ready(function(){
  	$("#register-form").click(function(){

		var name=$("#name").val();
		var mobile=$("#contact").val();
		var email=$("#email").val();
		var Address=$("#Address").val();
		var password=$("#pass").val();
		var confirm_password=$("#re_pass").val();
		var emailEXP=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		var mobileEXP=/[0-9]{10}/;
		var passwordEXP=/[A-Z][\w]*[@\.-]*[\w]*/;
		
		if(name=='' || name==undefined){
		} else{
    	$("#name_error").html("**Valid**");
		}
		
		if(Address=='' || Address==undefined){
		} else {
					$("#address_error").html("**Valid**")
		}
		
		if(mobile=='' || mobile==undefined){
			
		} else if(mobileEXP.test(mobile)==true && mobile.length==10){
			$("#mobile_error").html("**Valid**");
		} else if(mobile.length>10){
			$("#mobile_error").html("**Mobile number should contain 10 digit only!!");
		} else{
            $("#mobile_error").html("***Mobile number should contain 10 digit!!")		}
            
        if(email!=''){
				$("#email_error").html("**Valid**")
		}

		if(email==''){
		} else if(emailEXP.test(email)==false){
			$("#email_error").html("**Invalid email! it should be like exapmle@gmail.com!!")
		}else{
			$("#email_error").html("**Valid**")
		}

		if(password=='' || password==undefined){
		} else if(passwordEXP.test(password)==false || password.length<8){
			$("#pass_error").html("***Invalid password! it should start with upper case alphabet and minimum length 8!!")
		} else{
			$("#pass_error").html("**Valid**")
		}


		if(confirm_password=='' || confirm_password==undefined){
		 } else if(password!=confirm_password){
				$("#re_pass_error").html("***Password not match!!")
	 		 } else {
	 		 	$("#re_pass_error").html("**Match**")
	 		 }
	});

});
//=================Registration validation end===============

//==================Address form validation start======================================
function validAddress(){
	flag=true;
		var mobile=$("#mobileno").val();
		var mobileEXP=/[0-9]{10}/;
		var pincode=$("#pincode").val();
		var pinEXP=/[0-9]{6}/;
		if(pinEXP.test(pincode)==false || pincode==''){
			flag=false;
		} 
		if(mobileEXP.test(mobile)==false || mobile=='' || mobile.length!=10){
			flag=false;
		}
	return flag;
}


 $(document).ready(function(){
  	$("#validAddress").click(function(){

		var mobile=$("#mobileno").val();
		var mobileEXP=/[0-9]{10}/;
		var pincode=$("#pincode").val();
		var pinEXP=/[0-9]{6}/;
		if(mobile==''){

		} else if(mobile.length!=10 ||mobileEXP.test(mobile)==false){
		   $("#contact_error").html("** Invalid mobileno!!")		
		}else{
		   $("#contact_error").html("**Valid !!")		
		}

		if(pincode==''){

		} else
		 if(pinEXP.test(pincode)==true){
			$("#pin_error").html("**Valid**");
		} else{
            $("#pin_error").html("***Invalid pincode!!")		
        }    
        
	});

});


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	#modal {
		display: none;
		position: relative;
		width: 100%;
		height: 100%;
		z-index: 1;
	}
	
	#modal h2 {
		margin: 0;
	}
	
	#modal button {
		display: inline-block;
		width: 100px;
		margin-left: calc(100% - 100px - 10px);
	}
	
	.modalContent {
		width: 700px;
		height: 300px;
		margin: 100px auto;
		background: #fff;
		border: 2px solid #666;
	}
	
	#modal .modalLayer {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: rgba(0, 0, 0, 0.5);
		z-index: -1;
	}
	
	.modalHead {
		width: 100.1%;
		height: 35px;
		background-color: rgb(25, 25, 112);
		color: white;
		text-align: center;
		font-size: 20px;
		float: right;
	}
	
	#modal_close_btn {
		background-color: rgb(25, 25, 112);
		color: white;
		text-align: center;
		cursor: pointer;
		width: 80px;
		height: 50px;
		position: absolute;
		right: 30%;
		top: 20%;
	}
	
	#modalOkBtn {
		background-color: rgb(25, 25, 112);
		color: white;
		text-align: center;
		cursor: pointer;
		width: 80px;
		height: 50px;
		position: absolute;
		right: 44%;
		top: 20%;
	}
	
	.modalContentMessage {
		width: 100%;
		height: 50%;
		float: right;
		padding: 0px;
	}
	
	.modalButton {
		width: 100%;
		height: 30%;
		float: right;
		position: relative;
	}
	
	#contentHead {
		font-size: 40px;
		text-align: center;
		font-weight: bold;
		margin-top: -10px;
	}
	
	#contentBody {
		font-size: 25px;
		text-align: center;
		margin-top: -20px;
	}
	
	#initInfoSettingModal {
		display: none;
		position: relative;
		width: 100%;
		height: 100%;
	}
	
	#initInfoSettingModal button {
		display: inline-block;
		width: 100px;
		margin-left: calc(100% - 100px - 10px);
	}
	
	#initInfoSettingModal .modal_content2 {
		position: absolute;
		top: 10%;
		left: 32%;
		width: 500px;
		height: 500px;
		margin: 20px auto;
		background: #29428C;
		border: 1px solid black;
		border-radius: 25px;
		z-index: 1050;
		width: 500px;
	}
	
	#initInfoSettingModal .modal_layer2 {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: rgba(0, 0, 0, 0.5);
	}

	#inputEmailVeficationModal .modal_layer2 {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: rgba(0, 0, 0, 0.5);
		z-index:-1;
	}
	
	.modal_head2 {
		height: 35px;
		color: white;
		text-align: left;
		font-size: 20px;
	}
	
	#initInfoSumitBtn {
		background-color: rgb(25, 25, 112);
		color: white;
		text-align: center;
		cursor: pointer;
		width: 80px;
		height: 30px;
		position: absolute;
		right: 41%;
		top: 10%;
	}
	
	.modal_content-box2 {
		position: absolute;
		width: 90%;
		height: 80%;
		font-size: 40px;
		text-align: center;
		background: white;
		border-radius: 25px;
		margin-left: 28px;
	}
	
	.modal_button2 {
		width: 100%;
		height: 20%;
		float: right;
		position: relative;
		margin-top: 3%;
		top: 80%;
	}
	
	h3 {
		margin-left: 20px;
	}
	
	.emailAddress {
		position: relative;
		top: 5%;
		width: 400px;
		height: 40px;
		font-size: 20px;
		height: 40px;
	}
	
	#emailDuplicateButton {
		position: relative;
	}
	
	#AuthenticationNumber {
		position: relative;
		left: 2%;
	}
	
	.phoneNumber {
		width: 400px;
		height: 40px;
		font-size: 20px;
		float: none;
		margin-top: 6%;
	}
	
	.newPassword {
		width: 400px;
		height: 40px;
		font-size: 20px;
		float: none;
		margin-top: 8%;
	}
	
	.newPasswordConfirm {
		width: 400px;
		height: 40px;
		font-size: 20px;
		float: none;
		margin-top: 8%;
	}
	
	h5 {
		font-size: 20px;
		float: left;
		margin-left: 30px;
		margin-right: 105px;
		margin-bottom: 0px;
		height: 20px;
	}
	
	
	#inputEmailVeficationModal {
		display: none;
		position: relative;
		width: 100%;
		height: 100%;
		z-index: 1050;
	}


	.modalContentMessageforEmail {
		width: 100%;
		height: 30%;
		float: right;
		padding: 0px;
	}

	.modalButton3 {
		width: 100%;
		height: 30%;
		float: right;
		position: relative;
	}
	
	.inputVerificationNum {
		position: relative;
		left:20%;
		width:430px;
		height:35px;
	}
	


	#timerDiv {
		position:relative;
		left:38%;
		
	}
	
	#modalOkBtn2 {
		background-color: rgb(25, 25, 112);
		color: white;
		text-align: center;
		cursor: pointer;
		width: 80px;
		height: 30px;
		position: absolute;
		right: 55%;
		top: 35%;
		}
	
	#modalCancelBtn2 {
		background-color: rgb(25, 25, 112);
		color: white;
		text-align: center;
		cursor: pointer;
		width: 80px;
		height: 30px;
		position: absolute;
		right: 35%;
		top: 35%;
	}
	
	#reSubmitBtn {
		background-color: rgb(25, 25, 112);
		color: white;
		text-align: center;
		cursor: pointer;
		width: 80px;
		height: 30px;
		position: absolute;
		right:29%;
		top:18.5%;
	}
	
	
</style>
<title>Insert title here</title>
</head>
<body style="overflow: hidden;">
	<div id="modal">

		<div class="modalContent">
			<div class="modalHead">Alert Message</div>
			<div class="modalContentMessage">
				<br>
				<p id="contentHead">???????????????!</p>
				<br>
				<p id="contentBody">?????? ???????????? ??? <font color="red">?????????</font>??? ??????????????????!</p>
			</div>
			<div class="modalButton">
				<button type="button" id="modalOkBtn">Ok</button>
			</div>

		</div>

		<div class="modalLayer"></div>
	</div>
	<!-- setting??? ?????? -->
	<div id="initInfoSettingModal">
		<div class="modal_content2">
			<div class="modal_head2">
				<h3>????????? ??????</h3>
			</div>
			<div class="modal_content-box2">
				<input type="email" class="emailAddress" id="emailAddress" placeholder="Email" required> 
				<input type="button" id="emailDuplicatieButton" value="????????????">
				<input type="button" id="AuthenticationNumber" value="?????????????????????">
				<input type="text" class="phoneNumber" id="phoneNumber" placeholder="Phone" required>
				<input type="password" class="newPassword" id="newPassword" placeholder="newPassword" required> 
				<input type="password" class="newPasswordConfirm" id="newPasswordConfirm" placeholder="newPasswordConfirm" required>
			</div>
			<div class="modal_button2">
				<button type="button" id="initInfoSumitBtn">Ok</button>
			</div>
		</div>
		<div class="modal_layer2" id="modal_layer2"></div>
	</div>

<!-- ????????? ???????????? ?????? ????????? -->
	<div id="inputEmailVeficationModal" style="display:none;">
		<div class="modalContent">
			<div class="modalHead">Alert Message</div>
			<div class="modalContentMessageforEmail">
				<br> <br>
				<p id="contentBody">????????? ???????????? ??????????????? ?????????????????????.</p>
			</div>
			<input type="text" class="inputVerificationNum" id="inputVerificationNum" name="verificationNum" placeholder="??????????????? ??????????????????">
			<div id="timerDiv">
				<span style="color:red;">?????? ??????: </span><span id="timer"></span>
			</div>
			<button type="button" id="reSubmitBtn">?????????</button>
			<div class="modalButton">
				<button type="button" id="modalOkBtn2">Ok</button>
				<button type="button" id="modalCancelBtn2">Cancel</button>
			</div>
		</div>
		<div class="modal_layer2" id="modal_layer2"></div>
	</div>

	<input type="hidden" id="inputId" name="inputId" value="${ sessionScope.loginMember.id }">
	<input type="hidden" id="inputNo" name="inputNo" value="${ sessionScope.loginMember.no }">
	<input type="hidden" id="oneOrEmail" name="oneOrEmail">
	<input type="hidden" id="isDidDuplicate" name="isDidDuplicate">
	<input type="hidden" id="gotVerificate" name="gotVerificate">
	<input type="hidden" id="forSubmitTing" name="forSubmitTing">


<script>
	
	$("#emailDuplicatieButton").click(function () {
		if($("#emailAddress").val().includes('@', 1)) {
			$.ajax({
	    		url : "${ pageContext.servletContext.contextPath }/member/emailduplicationcheckforinit",
	    		type : "GET",
	    		contentType : "json",
	    		data : {"emailAddress":$("#emailAddress").val()},
	    		success : function(data, status, xhr) {
					
	    			if(data == 1) {
	    				alert("?????? ???????????? ??????????????????. ?????? ???????????? ???????????? ????????????!");
				        document.getElementById("modal").style.display="none";
						document.getElementById("initInfoSettingModal").style.display="block";
						document.getElementById("oneOrEmail").value = data; 
	    			} else {
	    				alert("?????? ????????? ??????????????????.");
				        document.getElementById("modal").style.display="none";
						document.getElementById("initInfoSettingModal").style.display="block";
						document.getElementById("oneOrEmail").value = data;  
						document.getElementById("isDidDuplicate").value = 2;
	    			}
	    		},
	    		error : function(error) {
	    			alert("????????? ??????????????????. ?????? ??????????????????!");	
	    		}
	    	});
    	
		} else {
			alert("????????? ????????? ?????? ???????????????!");
	        document.getElementById("modal").style.display="none";
			document.getElementById("initInfoSettingModal").style.display="block";
		}
    });

	function $ComTimer(){
	}
	
	$ComTimer.prototype = {
	      comSecond : ""
	    , fnCallback : function(){}
	    , timer : ""
	    , domId : ""
	    , fnTimer : function(){
	        var m = Math.floor(this.comSecond / 60) + "??? " + (this.comSecond % 60) + "???"
	        this.comSecond--;					
	        this.domId.innerText = m;
	        
	        if (this.comSecond < 0) {			
	            clearInterval(this.timer);		
	            alert("??????????????? ?????????????????????. ?????? ?????????????????? ????????????.");
	            
	        }
	    }
	    ,fnStop : function(){
	        clearInterval(this.timer);
	    }
	}

    $("#AuthenticationNumber").click(function () {
    	if($("#isDidDuplicate").val() == 2) { 
    		if($("#oneOrEmail").val() != 1) {
   				if($("#emailAddress").val().includes('@', 1)) {
				   $.ajax({
			 			url : "${ pageContext.servletContext.contextPath }/member/resubmitverificationnum",
						type : "GET",
						contentType : "json",
						data : {"emailAddress":$("#emailAddress").val(),
							"inputId":$("#inputId").val()},
						success : function(data, status, xhr) {
				
							if(data > 0) {
								alert("??????????????? ?????????????????????! ??????????????? ??????????????????!");
								document.getElementById("inputEmailVeficationModal").style.display="block";
								document.getElementById("initInfoSettingModal").style.display="none";
									
								var AuthTimer = new $ComTimer()
								  AuthTimer.comSecond = 180;
								  AuthTimer.fnCallback = function(){alert("??????????????? ??????????????????.")};
								  AuthTimer.timer =  setInterval(function(){AuthTimer.fnTimer()},1000);
								  AuthTimer.domId = document.getElementById("timer");
									
								  document.getElementById("forSubmitTing").value = 3;
								  
								  if($("#forSubmitTing").val() == 3) {
								 	  $("#reSubmitBtn").click(function() {
											$.ajax({
												url : "${ pageContext.servletContext.contextPath }/member/resubmitverificationnum",
												type : "GET",
												data : {"inputId":$("#inputId").val(),
														"emailAddress":$("#emailAddress").val()}, 
												success : function(data, status, xhr) {
													
													if(data > 0) {
														alert("??????????????? ????????? ???????????????.")
														document.getElementById("initInfoSettingModal").style.display="none";
														document.getElementById("inputEmailVeficationModal").style.display="block";
														AuthTimer.timer = clearInterval(AuthTimer.timer);
														
														AuthTimer = new $ComTimer();
											   	 			
														AuthTimer.comSecond = 180;
										    			AuthTimer.fnCallback = function(){alert("?????? ????????? ??????????????????.")};
										    			AuthTimer.timer = setInterval(function(){AuthTimer.fnTimer()}, 1000);
										    			AuthTimer.domId = document.getElementById("timer");
										    			
											    		
													} else {
														alert("???????????? ???????????? ?????????????????????.");
														document.getElementById("initInfoSettingModal").style.display="none";
														document.getElementById("inputEmailVeficationModal").style.display="block";
													}
												},
												error : function (error){
											        alert("????????? ??????????????????. ?????? ??????????????????."); 
												}
											});
										}); 
								  }
								  
							} else {
								alert("???????????? ?????? ??????????????????. ?????? ??????????????????.")
								document.getElementById("initInfoSettingModal").style.display="block";
								document.getElementById("inputEmailVeficationModal").style.display="none";
							}
						},
						error : function(error) {
							alert("????????? ??????????????????. ?????? ??????????????????.");
						}
					});
					   
			   	} else {
					alert("????????? ????????? ?????? ???????????????!");
			        document.getElementById("modal").style.display="none";
					document.getElementById("initInfoSettingModal").style.display="block";
		   		}
		    			
		   	} else {
   				alert("?????? ???????????? ????????? ?????????! ?????? ???????????? ????????????!");
		   	}
   		} else {
   			alert("???????????? ?????? ????????????!");
   		}
    });
	    
	
    $("#modalOkBtn2").click(function () {
    	$.ajax({
    		url : "${ pageContext.servletContext.contextPath }/member/checkverificationforinit",
    		type : "GET",
    		contentType : "json",
    		data : {"inputVerificationNum":$("#inputVerificationNum").val(),
    			"inputNo":$("#inputNo").val()},
    		success : function(data, status, xhr) {
    			
    			if(data > 0) {
    				alert("????????? ?????????????????????.");
					document.getElementById("initInfoSettingModal").style.display="block";
					document.getElementById("inputEmailVeficationModal").style.display="none";
					document.getElementById("gotVerificate").value = 1;
				
    			} else {
    				alert("????????? ?????????????????????! ?????? ??????????????????!");
					document.getElementById("initInfoSettingModal").style.display="none";
					document.getElementById("inputEmailVeficationModal").style.display="block";
    			}
    		},
    		error : function(error) {
    			alert("????????? ??????????????????. ?????? ??????????????????.");
    		}
    		
    	});
    	
    });
    
	document.getElementById("modal").style.display="block";
	document.getElementById("initInfoSettingModal").style.display="none";
 	
   
    document.getElementById("modalOkBtn").onclick = function() {
        document.getElementById("modal").style.display="none";
		document.getElementById("initInfoSettingModal").style.display="block";
    }
    
   	$("#initInfoSumitBtn").click(function () {
	    if($("#gotVerificate").val() == 1) {
	    	if($("#phoneNumber").val().includes('-', 1)) {
		    	$.ajax({
					url : "${ pageContext.servletContext.contextPath }/member/initialinputinfo",
					type : "GET",
					contentType : "json",
					data : {"emailAddress":$("#emailAddress").val(),
							"phoneNumber":$("#phoneNumber").val(),
							"newPassword":$("#newPassword").val(),
							"newPasswordConfirm":$("#newPasswordConfirm").val(),
							"inputNo":$("#inputNo").val()},
					success : function(data, status, xhr) {
						
						if(data > 0) {
							alert("?????? ?????? ??????! ???????????????!");
							document.getElementById("modal").style.display="none";
							document.getElementById("inputEmailVeficationModal").style.display="none";
							document.getElementById("initInfoSettingModal").style.display="none";
							
						} else {
							alert("?????? ?????? ??????! ?????? ??????????????????!");
						}
					}
		    	});
		    	
		    } else {
		    	alert("???????????? ????????? ?????? ????????????! '000-0000-0000'???????????? ?????? ??????????????????!");
		    } 
		    	
	    } else {
	    	alert("????????? ????????? ?????? ???????????? ????????????!");
	    }
   });
    
    
</script>


</body>
</html>
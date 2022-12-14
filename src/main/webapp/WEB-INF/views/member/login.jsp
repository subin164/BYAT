<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@300&display=swap" rel="stylesheet">
<meta charset="UTF-8">

<title>Better-than-Your-Agile-Tool</title>
<script>
	const message = '${ requestScope.message }';
	if (message != null && message != '') {
		alert(message);
	}
</script>

<style>
	html, body {
		position: relative;
		width: 100%;
		height: 100%;
		background: url("/byat/resources/images/byatBackground.png") no-repeat;
		background-size: cover;
		overflow-y: hidden;
		overflow-x: hidden
	}
	
	#byatLogoDiv {
		width: 100%;
		float: left;
	}
	
	#firstDIV {
		float: left;
		width: 30%;
		height: 60%;
	}
	
	#secondDIV {
		position: absolute;
		top: 10%;
		left: 30%;
		border: 1px solid white;
		background-color: white;
		float: left;
		width: 40%;
		height: 80%;
		border-radius: 50px;
	}
	
	#loginTitle {
		font-family: 'Ubuntu', sans-serif;
		font-size: 30px;
		color: #191970;
	}
	
	#loginForm {
		width: 80%;
		height: 40%;
	}
	
	.btn {
		width: 130px;
		height: 50px;
		border-radius: 10px;
		color: white;
	}
	
	.btn-yg {
		background-color: #191970;
	}
	
	.btn-or {
		background-color: #191970;
		margin-right: 20px;
	}
	
	.idBox input {
		width: 100%;
		height: 43px;
	}
	
	#firstDIV2 {
		float: left;
		width: 30%;
		height: 60%;
	}
	
	#secondDIV2 {
		position: absolute;
		top: 10%;
		left: 30%;
		border: 1px solid white;
		background-color: white;
		float: left;
		width: 40%;
		height: 80%;
		border-radius: 50px;
	}
	
	#loginTitle2 {
		font-family: 'Ubuntu', sans-serif;
		font-size: 30px;
		color: #191970;
	}
	
	#passwordResetForm {
		width: 80%;
		height: 40%;
	}
	
	#inputIdModal {
		display: none;
		position: relative;
		width: 100%;
		height: 100%;
		z-index: 1050;
	}
	
	#inputEmailVeficationModal {
		display: none;
		position: relative;
		width: 100%;
		height: 100%;
		z-index: 1050;
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
	
	
	#inputIdModal h2 {
		margin: 0;
	}
	
	
	 .modalContent {
		width: 700px;
		height: 300px;
		margin: 100px auto;
		background: #fff;
		border: 2px solid #666;
	}
	
	.modalContentMessage {
		width: 100%;
		height: 30%;
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
	
	#findPassword {
	
		border: none;
		cursor: pointer;
		width: 180px;
		height: 15px;
		position: relative;
		left: 35%;
		
		
	}
	
	.inputId {
		position: relative;
		left: 20%;
		width: 430px;
		height: 35px;
	
	}
	
	.inputPassword {
		position: relative;
		left: 20%;
		width: 430px;
		height: 35px;
	
	}
	
	.inputVerificationNum {
		position: relative;
		left: 20%;
		width: 430px;
		height: 35px;
	}
	
	#modalOkBtn {
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
	
	#modalOkBtn3 {
		background-color: rgb(25, 25, 112);
		color: white;
		text-align: center;
		cursor: pointer;
		width: 80px;
		height: 30px;
		position: absolute;
		right: 55%;
		top: 65%;
		}
		
	#modalCancelBtn {
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
	
	#modalCancelBtn3 {
		background-color: rgb(25, 25, 112);
		color: white;
		text-align: center;
		cursor: pointer;
		width: 80px;
		height: 30px;
		position: absolute;
		right: 30%;
		top: 65%;
	}
	
	#reSubmitBtn {
		background-color: rgb(25, 25, 112);
		color: white;
		text-align: center;
		cursor: pointer;
		width: 80px;
		height: 30px;
		position: absolute;
		right: 29%;
		top: 18.5%;
	}
	
	#timerDiv {
		position: relative;
		left: 38%;
		
	}
	
	#adminNumber {
		position:absolute;
		top:86%;
		left:46%;
		color:gray;
		
	}

</style>
</head>
<body>

	<div id="loginDiv" style="display: block;">
		<div id="byatLogoDiv">
			<img class="Logo" src="/byat/resources/images/byatLogo.png">
		</div>
		<br clear="left">

		<div id="firstDIV"></div>
		<div id="secondDIV" align="center">
			<div id="loginTitle" align="center">
				<h1>LOGIN</h1>
			</div>

			<c:if test="${ empty sessionScope.loginMember }">
				<!-- ???????????? ????????? ?????? -->
				<form id="loginForm" action="${ pageContext.servletContext.contextPath }/member/login" method="post">
					<div class="idBox" align="center">
						<input type="text" name="id" id="loginMemberId" placeholder="Id">
						<br>
						<br> <input type="password" name="pwd" id="loginMemberPwd" placeholder="Password"> 
						<br><br>
					</div>
					<br>
						<div id="findPassword">??????????????? ????????????????</div>
					<br><br><br>

					<div class="btns" align="center">
						<input type="submit" class="btn btn-or" value="login" id="login">
						<input type="button" class="btn btn-yg" value="cancel" id="cancel">
					</div>
				</form>
			</c:if>
		</div>
	</div>
	
	
	<!-- ???????????? ??????: ????????? ?????? ????????? -->
	<div id="inputIdModal" style="display:none;">
		<div class="modalContent">
			<div class="modalHead">Alert Message</div>
			<div class="modalContentMessage">
				<br> <br>
					<p id="contentBody">
						??????????????? ????????? ?????? <font color="red">?????????</font>??? ??????????????????!
					</p>
				</div>
				<input type="text" class="inputId" name="inputId" id="inputId" placeholder="id">
				<div class="modalButton">
					<button type="button" id="modalOkBtn">Ok</button>
					<button type="button" id="modalCancelBtn">Cancel</button>
				</div>
				<input type="hidden" name="randomVerificationNum" id="randomVerificationNum" value="${ requestScope.randomVerificationNum }">
		</div>
	</div>

		<!-- ???????????? ??????: ????????? ???????????? ?????? ????????? -->
	<div id="inputEmailVeficationModal" style="display:none;">
		<div class="modalContent">
			<div class="modalHead">Alert Message</div>
			<div class="modalContentMessage">
				<br> <br>
				<p id="contentBody">
					????????? ???????????? ??????????????? ?????????????????????.
				</p>
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
	</div>



	<!-- ???????????? ??????: ???????????? ?????? ?????????  -->
	<div id="passwordFindModal" style="display: none;">
		<div id="firstDIV2"></div>
		<div id="secondDIV2" align="center">
			<div id="loginTitle2" align="center">
				<h1>??? ???????????? ??????</h1>
			</div>
			<div id="passwordResetForm">
				<div class="idBox" align="center">
				<br><br><br><br>
					<input type="password" name="inputPassword" id="inputPassword" placeholder="Change Password"> <br>
					<br> 
					<input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Change Password"> <br>
					<br>
				</div>
				<br> <br> <br>
				<div class="btns" align="center">
					<input type="button" class="btn btn-or" value="Ok" id="modalOkBtn3"> 
					<input type="button" class="btn btn-yg" value="cancel" id="modalCancelBtn3">
				</div>
			</div>
		</div>
	</div>
	<div id="adminNumber">tel: 010-6222-0160</div>
	
	<input type="hidden" id="forSubmitTing" name="forSubmitTing">
	<input type="hidden" id="forSubmitTing2" name="forSubmitTing2">

	<script>

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
		        console.log(m);
		        
		        if (this.comSecond < 0) {			
		            clearInterval(this.timer);		
		            alert("??????????????? ?????????????????????. ?????? ?????????????????? ????????????.");
		        
		        }
		    }
		    ,fnStop : function(){
		        clearInterval(this.timer);
		    }
		}

		
		  
		const $cancel = document.getElementById("cancel");
		const $findPassword = document.getElementById("findPassword"); 
		const $modalOkBtn = document.getElementById("modalOkBtn");
		const $modalCancelBtn = document.getElementById("modalCancelBtn");
		const $modalOkBtn2 = document.getElementById("modalOkBtn2");
		const $modalCancelBtn2 = document.getElementById("modalCancelBtn2");
		const $modalOkBtn3 = document.getElementById("modalOkBtn3");
		const $modalCancelBtn3 = document.getElementById("modalCancelBtn3");
		const $verificationNum = document.getElementById("verificationNum");
		const $reSubmitBtn = document.getElementById("reSubmitBtn");		
		
		$cancel.onclick = function() {
			location.href = "/byat";
		}
		
		$findPassword.onclick = function() {
			document.getElementById("inputIdModal").style.display="block";
			
		}
		
		$modalCancelBtn.onclick = function() {
			document.getElementById("inputIdModal").style.display="none";
		}
 
		$("#modalOkBtn").click(function() {
			$.ajax({
				url : "selectemail",
				type : "POST",
				data : {"inputId":$("#inputId").val()}, 
				success : function(data, status, xhr) {

					if(data > 0) {
						
						alert("??????????????? ?????????????????????.")
						document.getElementById("inputEmailVeficationModal").style.display="block";
						document.getElementById("passwordFindModal").style.display="none";
						document.getElementById("inputIdModal").style.display="none";
						
						var AuthTimer = new $ComTimer()
						  AuthTimer.comSecond = 180;
						  AuthTimer.fnCallback = function(){alert("??????????????? ??????????????????.")};
						  AuthTimer.timer =  setInterval(function(){AuthTimer.fnTimer()},1000);
						  AuthTimer.domId = document.getElementById("timer");
						
						
						document.getElementById("forSubmitTing").value = 3;
						
						  if($("#forSubmitTing").val() == 3) {
							  $("#reSubmitBtn").click(function() {
									$.ajax({
										url : "selectemail",
										type : "POST",
										data : {"inputId":$("#inputId").val()}, 
										success : function(data, status, xhr) {
											
											if(data > 0) {
												alert("??????????????? ????????? ???????????????.");
												document.getElementById("inputEmailVeficationModal").style.display="block";
												document.getElementById("passwordFindModal").style.display="none";
												document.getElementById("inputIdModal").style.display="none";
												
												AuthTimer.timer = clearInterval(AuthTimer.timer);
												
												AuthTimer = new $ComTimer();
									   	 			
												AuthTimer.comSecond = 180;
								    			AuthTimer.fnCallback = function(){alert("?????? ????????? ??????????????????.")};
								    			AuthTimer.timer = setInterval(function(){AuthTimer.fnTimer()}, 1000);
								    			AuthTimer.domId = document.getElementById("timer");
								    			
								    			
								    			if($("#forSubmitTing2").val() == 2) {
								    				AuthTimer = clearInterval(AuthTimer);
								    				AuthTimer.timer = clearInterval(AuthTimer.timer);
								    			}
		
											} else {
												alert("???????????? ???????????? ?????????????????????.");
												document.getElementById("inputIdModal").style.display="block";
												document.getElementById("passwordFindModal").style.display="none";
												document.getElementById("inputEmailVeficationModal").style.display="none";
											}
										},
										error : function (error){
									        alert("????????? ??????????????????. ?????? ??????????????????."); 
										}
									});
							});
						}
					} else {
						alert("???????????? ?????? ??? ????????????.");
						document.getElementById("inputIdModal").style.display="block";
						document.getElementById("passwordFindModal").style.display="none";
						document.getElementById("inputEmailVeficationModal").style.display="none";
					}
				},
				error: function (error){
			        alert("?????? ????????? ??????????????????. ?????? ??????????????????"); 
				}
			});
		});
		
		
			/* ok ?????? ????????? ???????????? ???????????? ?????? ??? ????????? ????????? ?????? ???*/
 	 	 $("#modalOkBtn2").on("click",function() {
 	 		   $.ajax({
 	 			url : "checkverification",
				type : "POST",
				data : {"inputVerificationNum":$("#inputVerificationNum").val()},
				success : function(data, status, xhr) {

					if(data > 0) {
						alert("??????????????? ???????????????! ????????? ??????????????? ??????????????????!");
						document.getElementById("inputEmailVeficationModal").style.display="none";
						document.getElementById("passwordFindModal").style.display="block";
						document.getElementById("inputIdModal").style.display="none";
						document.getElementById("forSubmitTing2").value = 2;
						
					} else {
						alert("??????????????? ??????????????????. ?????? ??????????????????.")
						document.getElementById("inputEmailVeficationModal").style.display="block";
						document.getElementById("passwordFindModal").style.display="none";
						document.getElementById("inputIdModal").style.display="none";
					}
				},
				error : function(error) {
					alert("????????? ??????????????????. ?????? ??????????????????.");
				}
			});
 	 	  });
 	 	  
		  
		  
		$("#modalOkBtn3").on("click",function () {
			$.ajax({
				url : "modifypassword",
				type :"POST",
				data : {"inputId":$("#inputId").val(),
					"inputPassword":$("#inputPassword").val(),
					"confirmPassword":$("#confirmPassword").val()},
				success : function(data, status, xhr) {
					
					if(data > 0) {
						alert("???????????? ????????? ?????????????????????!");
						document.getElementById("inputEmailVeficationModal").style.display="none";
						document.getElementById("passwordFindModal").style.display="none";
						document.getElementById("inputIdModal").style.display="none";
					} else {
						alert("???????????? ?????? ??????! ?????? ????????? ?????????!");
						document.getElementById("inputEmailVeficationModal").style.display="none";
						document.getElementById("passwordFindModal").style.display="display";
						document.getElementById("inputIdModal").style.display="none";
					}
				},
				error : function(error) {
					alert("????????? ??????????????????. ?????? ??????????????????.");
				}
			});
		});
		
		$modalCancelBtn2.onclick = function() {
			document.getElementById("inputEmailVeficationModal").style.display="none";
			document.getElementById("passwordFindModal").style.display="none";
			document.getElementById("inputIdModal").style.display="none";
		}
 		
	    
		$modalCancelBtn3.onclick = function() {
			document.getElementById("inputEmailVeficationModal").style.display="none";
			document.getElementById("inputIdModal").style.display="none";
			document.getElementById("passwordFindModal").style.display="none";
		}
		
	</script>

</body>
</html>
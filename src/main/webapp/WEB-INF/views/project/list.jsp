<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/menubar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.4/css/dataTables.jqueryui.min.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
	html {
		width: 100%;
      	height: 98%;
      	background:#D7E3FA;
      	background-size: cover;
      	position:relative;
   	}
   
   	body {
		width: 100%;
     	height: 95%;
   	}
   
	#whiteBoard {
		position:absolute;
    	background:white;
      	border:1px solid black;
      	top:15%;
      	left:3%;
      	width:95%;
      	height:78%;
	}
	
	.projectListHeadName {
		margin-left:5%;
		margin-top:2%;
		font-size:35px;
		float:left;
		display:inline;
	}
	
	#createProject {
		background-color:rgb(25,25,112);
		color:white;
		font-size:25px;
		float:right;
		margin-right:3%;
		margin-top:2%;
		cursor:pointer;
	}
	
	.projectListBox {
		border:1px solid black;
		height:77%;
		margin-left:3%;
		margin-right:3%;
		margin-top:6%;
		border:none;
	}
	
	#manageProjectTd {
		width:300px;
	}
	
	#projectParticipantsTd {
		width:350px;
	}
	
	#memberPlus {
		width:100px;
	}
	
	#projectDate {
		width:150px;
	}
	
	#projectProgress {
		width:100px;
	}
	
	#projectManager {
		width:100px;
	}
	
	#projectSetting {
		width:100px;
	}
	
	.projectListBox table {
    	width: 100%;
    	border-collapse: collapse;
    }
	
	.projectTable th {
		background-color:rgb(229,229,229);
		height:50px;
	}
	
	.projectTable {
		border : 1px solid black;	
	}
	
	#projectCreateModal {
		display: none;
		position:absolute;
		width:100%;
		height:100%;
		z-index:1;
		bottom:1%;
	}
	
	#projectCreateModal button {
		display:inline-block;
		width:100px;
		margin-left:calc(100% - 100px - 10px);
	}
	
	#projectCreateModal .modal_content {
		width:1000px;
		height:680px;
		margin:20px auto;
		background:#29428C;
		border:1px solid black;
		border-radius:25px;
	}
	
	#projectCreateModal .modal_layer {
		position:fixed;
		top:0;
		left:0;
		width:100%;
		height:100%;
		background:rgba(0, 0, 0, 0.5);
		z-index:-1;
	}
	
	.modal_head {
	
		height:35px;
		color:white;
		text-align:left;
		font-size:20px;
		padding-top:20px;
	}
	
	#projectCreateModalCloseBtn {
		background-color:rgb(25,25,112);
		color:white;
		text-align:center;
		cursor:pointer;
		width:110px;
		height:50px;
		position:absolute;
		right:30%;
	}
	
	#projectCreateBtn {
		background-color:rgb(25,25,112);
		color:white;
		text-align:center;
		cursor:pointer;
		width:110px;
		height:50px;
		position:absolute;
		right:65%;
	}
	
	.modal_content-box {
		width:90%;
		height:75%;
		font-size:40px;
		text-align:center;
		background: white;
		border-radius: 25px;
		margin-left: 53px;
		margin-top:3%;
	}
	
	.modal_button {
		width:100%;
		height:30%;
		float:right;
		position:relative;
		margin-top:2%;
	}
	
	h3 {
		text-align:center;
	}
	
	h5 {
		font-size: 20px;
		float: left;
		margin-left: 30px;
		margin-right: 105px;
		margin-bottom: 0px;
		height: 20px;
	}
	
	form {
		width:100%;
		height:100%;
	}
	
	.projectModalTitle {
		width:82%;
		font-size:20px;
	}
	
	.projectDescription {
		margin-top:2%;
		resize: none;
	}
	
	.projectTitleTag {
		font-size:20px;
		text-align:left;
		margin-left:9%;
		color:rgba(25,25,112,54);
	}
	
	.start-day {
		margin-top:10px;
		margin-left:80px;
		width:250px;
		font-size:20px;
		float:left;
		
	}
	.end-day {
		margin-top:10px;
		margin-left:230px;
		width:250px;
		font-size:20px;
		float:left;
	}
	
	.projectStartDayTag {
		font-size:20px;
		float:left;
		margin-top:3%;
		margin-left:9%;
		color:rgba(25,25,112,54);
	}
	
	.projectEndDayTag {
		font-size:20px;
		float:left;
		margin-top:3%;
		margin-left:35.5%;
		color:rgba(25,25,112,54);
	}
	
	.projectDescriptionTag {
		font-size:20px;
		float:left;
		margin-top:3%;
		margin-left:9%;
		color:rgba(25,25,112,54);
	}
	
	.prjectCodeMessage {
		font-size:18px;
		float:left;
		color:rgb(54,231,71);
		margin-left:9%;
	}

	.projectTable td {
		font-size:18px;
		text-align:center;
	}
	
	.projectAddMemberBtn {
		background:url("/byat/resources/images/projectAddMember.png") no-repeat;
        border:none;
        width:50px;
        height:50px;
        cursor:pointer;
	}
	
	.projectRealProgress {
		background-color:rgb(78,115,223);
		color:white;
		height:40px;
		width:80px;
		text-align:center;
		border-radius:10px;
		display:table-cell;
		vertical-align:middle;
	}
	
	.projectRealManager {
		background-color:red;
		color:white;
		height:40px;
		width:40px;
		text-align:center;
		border-radius:20px;
		display:table-cell;
		vertical-align:middle;
		left:50px;
	}
	
	.projectEditBtn {
		background:url("/byat/resources/images/projectEditBtn.png") no-repeat;
        border:none;
        width:50px;
        height:50px;
        cursor:pointer;
	}
	
	#projectRealMember2 {
		background-color:yellowgreen;
	}
	#projectRealMember3 {
		background-color:rgb(255,223,186);
	}
	#projectRealMember1 {
		background-color:red;
	}
	
	#projectRealMemberList>div {
		color:white;
		height:40px;
		width:40px;
		text-align:center;
		border-radius:20px;
		display:table-cell;
		vertical-align:middle;
		transform: translateY(35%);
	}
	
	#projectRealMemberList {
		float:left;
	}
	
 	#projectMenuBox {
 		position:absolute;
 		width:100px;
 		height:50px;
 		z-index:10;
 		right:20px;
 	}
 	
 	#projectMenuBox div {
 		
 		position:relative;
 		bottom:12px;
 		background-color:white;
		border:1px solid black;
		text-align:center;
		font-weight:bold;
		cursor:pointer;
 	}

	#projectUpdateModal {
		display: none;
		position:absolute;
		width:100%;
		height:100%;
		z-index:1;
		bottom:1%;
	}
	
	#projectUpdateModal button {
		display:inline-block;
		width:100px;
		margin-left:calc(100% - 100px - 10px);
	}
	
	#projectUpdateModal .modal_content {
		width:1000px;
		height:680px;
		margin:20px auto;
		background:#29428C;
		border:1px solid black;
		border-radius:25px;
	}
	
	#projectUpdateModal .modal_layer {
		position:fixed;
		top:0;
		left:0;
		width:100%;
		height:100%;
		background:rgba(0, 0, 0, 0.5);
		z-index:-1;
	}
	
	#projectUpdateModalCloseBtn {
		background-color:rgb(25,25,112);
		color:white;
		text-align:center;
		cursor:pointer;
		width:110px;
		height:50px;
		position:absolute;
		right:30%;
	}
	
	#projectUpdateBtn {
		background-color:rgb(25,25,112);
		color:white;
		text-align:center;
		cursor:pointer;
		width:110px;
		height:50px;
		position:absolute;
		right:65%;
	}
	
	#delete_modal {
		display: none;
		position:relative;
		width:100%;
		height:100%;
		z-index:1;
	}
	
	#delete_modal h2 {
		margin:0;
	}
	#delete_modal button {
		display:inline-block;
		width:100px;
		margin-left:calc(100% - 100px - 10px);
	}
	
	#delete_modal .delete_modal_content {
		width:700px;
		height:300px;
		margin:100px auto;
		/* padding:20px 10px; */
		background:#fff;
		border:2px solid #666;
	}
	
	.delete_modal_head {
		width:100.1%;
		height:35px;
		background-color:rgb(25,25,112);
		color:white;
		text-align:center;
		font-size:20px;
		float:right;
	}
	
	#delete_modal_close_btn {
		background-color:rgb(25,25,112);
		color:white;
		text-align:center;
		cursor:pointer;
		width:80px;
		height:50px;
		position:absolute;
		right:30%;
		top:20%;
	}
	
	#delete_modal_ok_btn {
		background-color:rgb(25,25,112);
		color:white;
		text-align:center;
		cursor:pointer;
		width:80px;
		height:50px;
		position:absolute;
		right:55%;
		top:20%;
	}
	
	.delete_modal_content_message {
		width:100%;
		height:50%;
		float:right;
		font-size:30px;
		text-align:center;
	}
	
	.delete_modal_button {
		width:100%;
		height:30%;
		float:right;
		position:relative;
	}
	
	#regist_project_members_modal {
		display: none;
		position:relative;
		width:100%;
		height:100%;
		z-index:1;
	}
	
	#regist_project_members_modal .regist_project_members_modal_content {
		width:550px;
		height:450px;
		margin:20px auto;
		background:#3B60D0;
		border:1px solid black;
		border-radius:40px;
		margin-top:7%;
	}
	
	.regist_project_members_modal_head {
		height:35px;
		color:white;
		text-align:center;
		font-size:30px;
		padding-top:20px;
	}
	
	.regist_project_members_modal_content-box {
		width:90%;
		height:75%;
		font-size:40px;
		text-align:center;
		background: white;
		border-radius: 25px;
		margin-left: 32px;
		margin-top:3%;
	}
	
	.regist_project_members_modal_content button {
		
		background-color:rgb(25,25,112);
		color:white;
		text-align:center;
		cursor:pointer;
		width:110px;
		height:30px;
		position:absolute;
		margin-top:5px;
	}
	
	.selectedMemberArea {
		
		width:88%;
		height:20%;
		border:2px solid black;
		margin-top:3%;
		margin-left:6%;
		position:relative;
		border-radius:15px;
		background-color:white;
	}
	
	.selectedMember {
		
		width:35%;
		font-size:15px;
		float:left;
		margin-top:5px;
		margin-left:40px;
		position:relative;
	}
	
	.selectedMemberProjectRole {
		
		position:absolute;
		margin-top:5px;
		right:70px;		
	}
	
	.addMembersBox {
		background-color:rgb(242,242,242); 
		height:140px; 
		border-radius:10px; 
		width:94%; 
		border:1px solid black; 
		margin-left:16px; 
		margin-top:15px; 
		overflow-y:scroll;
	}
	
	.addMembersBox::-webkit-scrollbar {
	
		background-color: rgb(242,242,242);		
		border-radius:15px;
	}
	
	.addMembersBox::-webkit-scrollbar-thumb {
		background-color: gray;
		border-radius:15px;
	}
	
	.selectedMemberProjectRole {
		
		background-color: skyblue;
		border : none;
		border-radius : 15px;
		color : white;
	}
	
	.registMembersOkBtn {
		
		background-color:rgb(25,25,112);
		color:white;
		text-align:center;
		cursor:pointer;
		width:110px;
		height:30px;
		position:absolute;
		margin-top:5px;
	}
	
	.projectRealMemberListBtn {
		
		background:url("/byat/resources/images/moreList.png") no-repeat;
		border:none;
		width:30px;
		height:30px;
		float:left;
		position:relative;
		margin-left:330px;
		bottom:23px;
		cursor:pointer;
	}
	
	.memberDeleteBtn {
		
		background:url("/byat/resources/images/memberDeleteBtn1.png") no-repeat;
		border:none;
		width:20px;
		height:20px;
		position:relative;
		cursor:pointer;
		left:70px;
		bottom:15px;
	}
	
	.projectMemberModalList {
		display: none;
		position:relative;
		width:100%;
		height:100%;
		margin-top:150px;
		z-index:1;
	}
	
	.projectMemberModalList_content {
		width:650px;
		height:450px;
		margin:20px auto;
		background:rgb(59, 96, 208);
		border:1px solid black;
		border-radius:25px;
	}
	
	.projectMemberModalList_content_head {
		color:white;
		text-align:center;
		font-size : 30px;
		margin-top:15px;
	}
	
	.projectMemberModalList_content_content_box {
		width:90%;
		height:75%;
		font-size:40px;
		text-align:center;
		background: white;
		border-radius: 25px;
		margin-left: 32px;
		margin-top:3%;
	}
	
	.projectMemberModalListTitle {
		font-size : 23px;
		padding-top: 15px;
		margin-left : 40px;
		float : left;
	}
	
	.projectMemberModalListTable {
		font-size : 15px;
		font-weight: none;
		width: 85%;
		border-radius: 8px;
		border-collapse: collapse;
		border-style: hidden;
		box-shadow: 0 0 0 1px #000;
		margin-left : 40px;
		top : 20px;
		position:relative;
		background-color : rgb(242,242,242);
		
	}
	
	.projectMemberModalListTable tr {
		
		height : 30px;
		
	}
	
	.projectMemberModalListTable th {
		
		border:1px solid black;
	}
	
	.projectMemberModalListTable td {
		
		border:1px solid black;
	}
	
	.projectMemberModalListCloseBtn {
		
		background-color:rgb(25,25,112);
		color:white;
		text-align:center;
		cursor:pointer;
		width:110px;
		height:30px;
		position:absolute;
		margin-top:5px;
		margin-left:370px; 
	}
	
	.projectMemberModalListOkBtn {
		
		background-color:rgb(25,25,112);
		color:white;
		text-align:center;
		cursor:pointer;
		width:110px;
		height:30px;
		position:absolute;
		margin-top:5px;
		margin-left:170px; 
	}
	
	.projectMemberModalListTableArea {
		
		position:relative;
		width:98%;
		height:75%;
		padding-bottom: 30px;		
	}
	
	.projectMemberModalListTableArea::-webkit-scrollbar {
	
		background-color: rgb(242,242,242);		
		border-radius:15px;
	}
	
	.projectMemberModalListTableArea::-webkit-scrollbar-thumb {
		background-color: gray;
		border-radius:15px;
	}
	
	.memberListDeleteMember {
		background:url("/byat/resources/images/memberDeleteBtn1.png") no-repeat;
		border:none;
		width:20px;
		height:20px;
		position:relative;
		cursor:pointer;
		padding-top:3px;
	}
	
	.projectMemberListRole {
		
		background-color: skyblue;
		border : none;
		border-radius : 15px;
		color : white;
		text-align:center;
	}
	
	#delete_member_modal {
		display: none;
		position:relative;
		width:100%;
		height:100%;
		z-index:10;
		bottom:470px;
		right:30px;
	}
	
	#delete_member_modal h2 {
		margin:0;
	}
	
	#delete_member_modal button {
		display:inline-block;
		width:100px;
		margin-left:calc(100% - 100px - 10px);
	}
	
	#delete_member_modal .delete_member_modal_content {
		width:700px;
		height:300px;
		margin:100px auto;
		background:#fff;
		border:2px solid #666;
	}
	
	.delete_member_modal_head {
		width:100.1%;
		height:35px;
		background-color:rgb(25,25,112);
		color:white;
		text-align:center;
		font-size:20px;
		float:right;
	}
	
	#delete_member_modal_close_btn {
		background-color:rgb(25,25,112);
		color:white;
		text-align:center;
		cursor:pointer;
		width:80px;
		height:50px;
		position:absolute;
		right:30%;
		top:20%;
	}
	
	#delete_member_modal_ok_btn {
		background-color:rgb(25,25,112);
		color:white;
		text-align:center;
		cursor:pointer;
		width:80px;
		height:50px;
		position:absolute;
		right:55%;
		top:20%;
	}
	
	.delete_member_modal_content_message {
		width:100%;
		height:50%;
		float:right;
		font-size:23px;
		text-align:center;
	}
	
	.delete_member_modal_button {
		width:100%;
		height:30%;
		float:right;
		position:relative;
	}
	
</style>
<script>
	const message = '${ requestScope.message }';
	if(message != null && message != '') {
	   alert(message);
	}   
   
</script>
<title>프로젝트</title>
</head>
<body style="overflow:hidden;">
	<div id="whiteBoard">
		<div class="projectListHeadName" style="font-weight:bold">전체 프로젝트 목록</div>
		
		<c:if test="${ (sessionScope.loginMember.permitCode == 1) or (sessionScope.loginMember.permitCode == 2)}">
			<button id="createProject">새 프로젝트 생성</button>					
		</c:if>
		<button id="createProject" style="display:none;"></button>
		<div class="projectListBox">
      		<table class="projectTable" id="projectTable">
      			<thead>
					<tr>
						<th id="manageProjectTd">프로젝트 관리</th>
						<th id="projectParticipantsTd">참여자</th>
						<th id="memberPlus">팀원 추가</th>
						<th id="projectDate">시작날짜</th>
						<th id="projectDate">종료날짜</th>
						<th id="projectProgress">진행 상태</th>
						<th id="projectManager">담당자</th>
						<th id="projectSetting">설정</th>
					</tr>
      			</thead>
      			<tbody>
					<c:forEach items="${ projectList }" var="project" varStatus="status">
						<tr>
							<td id="projectTitle" style="cursor:pointer;"><c:out value="${ project.title }" />
								<input type="hidden" value="${ project.code }" name="projectCode" id="projectCode">
							</td>
							<td id="projectRealMemberList">
								<c:set var="loop_flag" value="false"/>
								<c:forEach items="${ project.projectMembers }" var="member" varStatus="roleStatus">
									
									<c:if test="${ not loop_flag }">
										<c:if test="${ member.roleName eq 'PM' }">
											<div id="projectRealMember1">
												<c:out value="${ member.name }" />
												<input type="hidden" name="hiddenMemberNo" value="${ member.no }">															
											</div>									
										</c:if>
										<c:if test="${ member.roleName eq '부PM' }">
											<div id="projectRealMember2">
												<c:out value="${ member.name }" />	
												<input type="hidden" name="hiddenMemberNo" value="${ member.no }">															
											</div>
										</c:if>
										<c:if test="${ member.roleName eq '일반 멤버' }">
											<div id="projectRealMember3">
												<c:out value="${ member.name }" />	
												<input type="hidden" name="hiddenMemberNo" value="${ member.no }">															
											</div>
										</c:if>
										<c:if test="${ roleStatus.index eq 7 }">
											<c:set var="loop_flag" value="true"/>
										</c:if>
									</c:if>
									
								</c:forEach>
								<input type="button" id="projectRealMemberListBtn" class="projectRealMemberListBtn">
							</td>
							<td>
								
								<input type="button" class="projectAddMemberBtn">
							</td>
							<td><c:out value="${ project.startDate }" /></td>
							<td><c:out value="${ project.endDate }" /></td>
							<td style="padding-left:15px;">
								<c:if test="${ project.progress eq '진행중' }">
									<div class="projectRealProgress" id="projectRealProgress">
										<c:out value="${ project.progress }" />
									</div>								
								</c:if>
								<c:if test="${ project.progress eq '완료' }">
									<div class="projectRealProgress" id="projectRealProgress" style="background-color:rgb(41, 60, 117)">
										<c:out value="${ project.progress }" />
									</div>		
								</c:if>
								<c:if test="${ project.progress eq '미진행' }">
									<div class="projectRealProgress" id="projectRealProgress" style="background-color:rgb(196, 196, 196)">
										<c:out value="${ project.progress }" />
									</div>		
								</c:if>
							</td>
							<td style="padding-left:20px;">
								<div class="projectRealManager">
									<c:out value="${ project.writer }" />							
								</div>
							</td>
							<td>
								<input type="button" class="projectEditBtn" id="projectEditBtn">
								<div id="projectMenuBox" class="projectMenuBox" style="display:none"> 
									<div id="updateAndSelectProject">조회/수정</div>
									<c:if test="${ (sessionScope.loginMember.no eq PmMemberNumber[status.index]) or (sessionScope.loginMember.permitCode == 1)}">
										<div id="deleteProject">삭제하기</div>			
									</c:if>
									<div id="deleteProject" style="display:none;"></div>
								</div>
							</td>
						</tr>
					</c:forEach>
      			</tbody>
      		</table>
		</div>
		
	</div>
	<div id="projectCreateModal">
  
  		<div class="modal_content">
	  		<form action="${ pageContext.servletContext.contextPath }/project/regist" id="projectCreateForm" method="post">
				<div class="modal_head">
					<h3>프로젝트 생성</h3>
		    	</div>
	      		<div class="modal_content-box">
	      			<div style="height:30px;"></div>
	      			<div class="projectTitleTag">프로젝트 명</div>
	      			<input type="text" class="projectModalTitle" id="projectModalTitle" name="title" placeholder="ProjectTitle" required>
	      			<div class="projectStartDayTag">프로젝트 시작일자</div>
	      			<div class="projectEndDayTag">프로젝트 종료일자</div>
	       			<br clear="both">
	       			<input type='date' class="start-day" id="createStartDate" max="9999-12-31" name='startDate' required/>
	       			<input type='date' class="end-day" id="createEndDate" max="9999-12-31" name='endDate' required/>
	       			<div class="projectDescriptionTag">프로젝트 상세 설명</div>
	      			<textarea class="projectDescription" id="projectDescription" name="body" rows="13" cols="100" placeholder="상세내용을 입력해주세요" required></textarea>
	      			<div class="prjectCodeMessage">프로젝트  코드는 자동으로 생성됩니다.</div>
	      		</div>
	      		<div class="modal_button">
		        	<button type="button" id="projectCreateBtn">Ok</button>
		        	<button type="button" id="projectCreateModalCloseBtn">Cancel</button>
	      		</div>
			</form>
   		</div>
   		<div class="modal_layer"></div>
	</div>
	
	<div id="projectUpdateModal">
  
  		<div class="modal_content">
  			<input type="hidden" id="updateModalProjectProgress">
  			<input type="hidden" id="updateModalProjectIndex">
	  		<form action="${ pageContext.servletContext.contextPath }/project/modify" id="updateProjectForm" method="post">
				<div class="modal_head">
					<h3>프로젝트 상세</h3>
		    	</div>
	      		<div class="modal_content-box">
		  			<input type="hidden" name="code" id="projectUpdateCode">
	      			<div style="height:30px;"></div>
	      			<div class="projectTitleTag">프로젝트 명</div>
   					<input type="text" class="projectModalTitle" id="projectUpdateModalTitle" name="title" required>
	      			<div class="projectStartDayTag">프로젝트 시작일자</div>
	      			<div class="projectEndDayTag">프로젝트 종료일자</div>
	       			<br clear="both">
	       			<input type='date' class="start-day" name='startDate' max="9999-12-31" id="updateStartDate" required/>
	       			<input type='date' class="end-day" name='endDate' max="9999-12-31" id="updateEndDate" required/>
	       			<div class="projectDescriptionTag">프로젝트 상세 설명</div>
	      			<textarea class="projectDescription" id="projectUpdateDescription" name="body" rows="13" cols="100" required></textarea>
	      			<div class="prjectCodeMessage">프로젝트  코드는 자동으로 생성됩니다.</div>
	      		</div>
	      		<div class="modal_button">
		        	<button type="button" id="projectUpdateBtn">Ok</button>
		        	<button type="button" id="projectUpdateModalCloseBtn">Cancel</button>
	      		</div>
			</form>
   		</div>
   		<div class="modal_layer"></div>
	</div>
	
	<div id="delete_modal">
   
	    <div class="delete_modal_content">
		    <div class="delete_modal_head">
		    	Alert Message
		    </div>
	       	<div class="delete_modal_content_message">
	  	   		<br>삭제한 프로젝트는 <font style="color:red;">복구</font>하실 수 없습니다. <br>정말 삭제하시겠습니까?
	       	</div>
	       	<div class="delete_modal_button">
		        <button type="button" id="delete_modal_ok_btn">Ok</button>
		        <button type="button" id="delete_modal_close_btn">Cancel</button>
	       	</div>
	       
	    </div>
	   
	    <div class="modal_layer"></div>
	</div>
	
	<div id="regist_project_members_modal">
		
		<div class="regist_project_members_modal_content">
			<div class="regist_project_members_modal_head">
				프로젝트 팀원 추가
			</div>
			<div class="regist_project_members_modal_content-box">
				<div class="searchMembersTitle" style="font-size:23px; text-align:left; margin-left:20px; padding-top:15px;">
					팀원 검색
				</div>
				<div class="searchMembersBox">
					<input type="text" id="searchMembers" maxlength="20" style="background-color:rgb(242,242,242); height:30px; border-radius:10px;" size="65">
				</div>
				<div class="addMembers" style="font-size:23px; text-align:left; margin-left:20px; padding-top:30px;">
					팀원 추가
				</div>
				<div class="addMembersBox" id="addMembersBox">
					<form action="${ pageContext.servletContext.contextPath }/project/registmember" id="addMembersForm" class="addMembersForm" method="post"></form>
				</div>
			</div>
			<input type="button" id="registMembersOkBtn" class="registMembersOkBtn" style="margin-left:100px;" value="OK">
			<button type="button" id="registMembersCancelBtn" style="margin-left:350px;">Cancel</button>
		</div>
		<div class="modal_layer"></div>
	</div>
		
	<div class="projectMemberModalList" id="projectMemberModalList">
		<div class="projectMemberModalList_content">
			<div class="projectMemberModalList_content_head">프로젝트 구성원</div>
			<div class="projectMemberModalList_content_content_box">
				<div class="projectMemberModalListTitle">팀원 목록</div>
				<div class="projectMemberModalListTableArea" id="projectMemberModalListTableArea" style="overflow-y:scroll;">
					<form action="${ pageContext.servletContext.contextPath }/project/modifyrole" id="projectMemberModalListForm" method="post">
						<table id="projectMemberModalListTable" class="projectMemberModalListTable">
							<thead>
								<tr>
									<th>사번</th>
									<th>이름</th>
									<th>역할</th>
									<th style="width:70px;"></th>
								</tr>
							</thead>
							<tbody id="projectMemberModalListTableBody" class="projectMemberModalListTableBody"></tbody>
						</table>					
					</form>
				</div>
			</div>
			<button type="button" id="projectMemberModalListOkBtn" class="projectMemberModalListOkBtn">Ok</button>
			<button type="button" id="projectMemberModalListCloseBtn" class="projectMemberModalListCloseBtn">Close</button>
			<div id="delete_member_modal">
   
			    <div class="delete_member_modal_content">
				    <div class="delete_member_modal_head">
				    	Alert Message
				    </div>
			       	<div class="delete_member_modal_content_message">
			  	   		<br>삭제한 멤버는 Cancel 버튼을 눌러도 <font style="color:red;">복구</font>하실 수 없습니다.<br>다시 추가하는 작업을 진행하셔야 합니다.<br>정말 삭제하시겠습니까?
			       	</div>
			       	<div class="delete_member_modal_button">
				        <button type="button" id="delete_member_modal_ok_btn">Ok</button>
				        <button type="button" id="delete_member_modal_close_btn">Cancel</button>
			       	</div>
			       
			    </div>
			   
			    <div class="modal_layer"></div>
			</div>
		</div>
		
		<div class="modal_layer"></div>
	</div>
	
	<script>
		
		let writerCheck = false;
		
		$(document).ready(function() {
	        
	        $.extend( $.fn.dataTable.defaults, {
	           
	           language: {
	              url : "http://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Korean.json"
	           }
	        });
	        
	        $('#projectTable').DataTable({
	           
	        	lengthChange: false,
				order: [],
				ordering: false,
				lengthMenu : [ 4 ],
				columnDefs: [
					{ targets: 6, width: 60 },
					{ targets: 7, width: 40 }
				]
	        });
	    });

		document.getElementById("projectCreateBtn").onclick = function() {
			
			const createStartDate = document.getElementById("createStartDate");
			const createEndDate = document.getElementById("createEndDate");
			const projectModalTitle = document.getElementById("projectModalTitle");
			
			let today = new Date();
			
			let year = today.getFullYear();
			let month = ('0' + (today.getMonth() + 1)).slice(-2);
			let day = ('0' + today.getDate()).slice(-2);
			
			let dateString = year + '-' + month + '-' + day;
			
			if(createStartDate.value >= createEndDate.value) {
				alert("종료일자가 시작일자 전일 수 없습니다.");
			} else if(createEndDate.value <= dateString) {
				alert("종료일자는 금일 이후여야 합니다.");
			} else {
				sock.send("${sessionScope.loginMember.no}");
				document.getElementById("projectCreateForm").submit();
			}
			
		}
		
		document.getElementById("projectUpdateBtn").onclick = function() {

			const updateStartDate = document.getElementById("updateStartDate");
			const updateEndDate = document.getElementById("updateEndDate");
			
			let today = new Date();
			
			let year = today.getFullYear();
			let month = ('0' + (today.getMonth() + 1)).slice(-2);
			let day = ('0' + today.getDate()).slice(-2);
			
			let dateString = year + '-' + month + '-' + day;
			
			if(updateStartDate.value > updateEndDate.value) {
				alert("종료일자가 시작일자 전일 수 없습니다.");
			} else if(writerCheck) {
				alert("권한이 없습니다!");
			} else if(document.getElementById("updateModalProjectProgress").value == "완료"){
				alert("완료된 프로젝트는 수정하실 수 없습니다.");
			} else if(updateEndDate.value <= dateString) {
				alert("종료일자는 금일 이후여야 합니다.");
			} else {
				
				let projectUpdateIndex = document.getElementById("updateModalProjectIndex");
				
				<c:forEach items="${ projectList }" var="project" varStatus="status">
					<c:forEach items="${project.projectMembers}" var="projectMembers">
						if(projectUpdateIndex == "${status.index}") {
							sock.send("${projectMembers.no}");
						}
					</c:forEach>
				</c:forEach>
				
				document.getElementById("updateProjectForm").submit();
			}
			
		}
		
		let projectCode;
		let selectedMemberList = [];
		let projectMembersList = [];
		
		document.getElementById("createProject").onclick = function() {
	        document.getElementById("projectCreateModal").style.display = "block";
	    }

		document.getElementById("projectCreateModalCloseBtn").onclick = function() {
	        document.getElementById("projectCreateModal").style.display = "none";
	    }
		
		document.getElementById("projectMemberModalListCloseBtn").onclick = function() {
			
			document.getElementById("projectMemberModalList").style.display = "none";

			const $table = $("#projectMemberModalListTable tbody");
			
			const bodyChildDelete = document.getElementById("projectMemberModalListTableBody");
			
			while( bodyChildDelete.hasChildNodes() ) {
				
				bodyChildDelete.removeChild(bodyChildDelete.firstChild );
				
			}
			
		}

	    document.getElementById("registMembersCancelBtn").onclick = function() {
	    	document.getElementById("regist_project_members_modal").style.display = "none";
	    	
	    	const $selectedMemberArea = document.querySelectorAll("#selectedMemberArea");
	    	
	    	for(let i = 0; i < $selectedMemberArea.length; i++) {
	    		
	    		$selectedMemberArea[i].remove();
	    		
	    	}
	    	
	    	document.getElementById("searchMembers").value = "";
	    	projectMembersList.length = 0;
	    	selectMembers.length = 0;
	    	
	    }
	    
		document.getElementById("projectUpdateModalCloseBtn").onclick = function() {
	        document.getElementById("projectUpdateModal").style.display="none";
			
			document.getElementById("projectUpdateModalTitle").value = "";
			document.getElementById("updateStartDate").value = "";
			document.getElementById("updateEndDate").value = "";
			document.getElementById("projectUpdateDescription").value = "";
			document.getElementById("projectUpdateCode").value = "";
			
	    }
		
		if(document.querySelectorAll("#projectTable td")) {
			const $tds = document.querySelectorAll("#projectTitle");
			const $code = document.querySelectorAll("#projectCode");
			const $projectEditBtn = document.querySelectorAll("#projectEditBtn");
			const $projectAddMemberBtn = document.querySelectorAll(".projectAddMemberBtn");
			const $proBox = document.querySelectorAll("#projectMenuBox");
			const $updateAndSelectProject = document.querySelectorAll("#updateAndSelectProject");
			const $deleteProject = document.querySelectorAll("#deleteProject");
			const $projectRealMemberList = document.querySelectorAll("#projectRealMemberList");
			const $projectRealMemberListBtn = document.querySelectorAll("#projectRealMemberListBtn");
			const $projectRealProgress = document.querySelectorAll("#projectRealProgress");
			
			const $memberDeleteBtn = document.querySelectorAll("#memberDeleteBtn");
			const $selectedMemberArea = document.querySelectorAll("#selectedMemberArea");
			
			const pmNoList = [];
			
			for(let i = 0; i < $projectRealMemberListBtn.length; i++) {
				
				$projectRealMemberListBtn[i].onclick = function() {
					
					document.getElementById("projectMemberModalList").style.display = "block";
					
					const removeMemberProjectCode = $code[i].value;
					const projectRealMemberListLine = $projectRealMemberList[i];
					
					
					$.ajax({
						url: "/byat/project/projectmemberlist",
						type: 'get',
						data: { code : $code[i].value },
						success: function(data, status, xhr) {
                     
							const memberList = JSON.parse(data.memberList);
							
							const $table = $("#projectMemberModalListTable tbody");
							$table.html("");
							
							for(let i in memberList) {
								
								const $tr = $("<tr>");
								const $idTd = $("<td id='listMemberList'>").text(memberList[i].id);
								const $nameTd = $("<td>").text(memberList[i].name);
								const $roleNameTd = $("<td name='roleList'>");
								const $deleteTd = $("<td>");
								
								memberListNo = document.createElement('input');
								memberListNo.setAttribute('type', 'hidden');
								memberListNo.setAttribute('name', 'no');
								memberListNo.setAttribute('value', memberList[i].no);
								
								memberListCode = document.createElement('input');
								memberListCode.setAttribute('type', 'hidden');
								memberListCode.setAttribute('name', 'code');
								memberListCode.setAttribute('value', removeMemberProjectCode);
								
								memberListName = document.createElement('input');
								memberListName.setAttribute('type', 'hidden');
								memberListName.setAttribute('name', 'name');
								memberListName.setAttribute('value', memberList[i].name);
								
								$idTd.append(memberListNo);
								$idTd.append(memberListCode);
								
								$nameTd.append(memberListName);
								
								memberListRoleOptionPM = document.createElement('option');
								memberListRoleOptionPM.innerText ='PM';

								memberListRoleOptionSecondPM = document.createElement('option');
								memberListRoleOptionSecondPM.innerText ='부PM';
								
								memberListRoleOptionGeneral = document.createElement('option');
								memberListRoleOptionGeneral.innerText ='일반 멤버';

								memberListRole = document.createElement('select');
								memberListRole.setAttribute('id', 'projectMemberListRole');
								memberListRole.setAttribute('class', 'projectMemberListRole');
								memberListRole.setAttribute('name', 'roleName');
								memberListRole.appendChild(memberListRoleOptionPM);
								memberListRole.appendChild(memberListRoleOptionSecondPM);
								memberListRole.appendChild(memberListRoleOptionGeneral);
								
								if(memberList[i].roleName == 'PM') {
									memberListRoleOptionPM.setAttribute('selected', 'selected');
									pmNoList.push(memberList[i].no);
								} else if(memberList[i].roleName == '부PM') {
									memberListRoleOptionSecondPM.setAttribute('selected', 'selected');
								} else {
									memberListRoleOptionGeneral.setAttribute('selected', 'selected');
								}
								
								$roleNameTd.append(memberListRole);
								
								memberListDeleteMember = document.createElement('input')
					            memberListDeleteMember.setAttribute('type', 'button');
								memberListDeleteMember.setAttribute('id', 'memberListDeleteMember');
								memberListDeleteMember.setAttribute('class', 'memberListDeleteMember');
								
								$deleteTd.append(memberListDeleteMember)
								
								$tr.append($idTd);
								$tr.append($nameTd);
								$tr.append($roleNameTd);
								$tr.append($deleteTd);
								
								$table.append($tr);
								
								$memberListDeleteMember = document.querySelectorAll('#memberListDeleteMember');
								
								let tempMemberList = [];
								
								for(let i = 1; i < projectRealMemberListLine.children.length - 1; i++) {
									
									tempMemberList.push(projectRealMemberListLine.children[i].childNodes[1].value);
								}
								
								$memberListDeleteMember[i].onclick = function() {
									
									let sprintProceedingCount = 0;
									console.log(removeMemberProjectCode);
									console.log(memberList[i].no);
									
									$.ajax({
										url:"/byat/project/selectsprintmember",
										type:"post",
										data: { code : removeMemberProjectCode,
												no : memberList[i].no	
										},
										async : false,
										success: function(data, status, xhr) {
											
											sprintProceedingCount = JSON.parse(data.count);
											console.log("! : " + sprintProceedingCount);
										},
										error: function(xhr, status, error) {
											alert("참여중인 스프린트의 상태 확인 실패!");
										}
									});
									
									if(i == 0) {
										alert("관리자 또는 PM은 삭제하실 수 없습니다.");
									} else if(${ sessionScope.loginMember.id } != memberList[0].id) {
										alert("권한이 없습니다.");
									} else if(sprintProceedingCount >= 1) {
										alert("진행중인 스프린트에 속한 멤버입니다. 진행중인 스프린트에서 제외 후 진행해주세요.");
									} else {
										
										document.getElementById("delete_member_modal").style.display = "block";
										
										document.getElementById("delete_member_modal_ok_btn").onclick = function() {
								        	
											const removeMemberNo = memberList[i].no;
											
											const tbody = document.getElementById("projectMemberModalListTableBody");
											
											$.ajax({
												url: "/byat/project/removemember",
												type: 'get',
												data: { 
													code : removeMemberProjectCode,
													no : removeMemberNo
												},
												success: function(data, status, xhr) {
													
													alert(memberList[i].name + "님을 구성원에서 제외하셨습니다.");
													
													tbody.deleteRow(i);
													
													for(let k = 0; k < tempMemberList.length; k++) {
														
														if(tempMemberList[k] == removeMemberNo) {
															
															projectRealMemberListLine.children[k + 1].remove();
															
														}
														
													}
													
												},
											});
											
											document.getElementById("delete_member_modal").style.display = "none";
										
										}
										
										document.getElementById("delete_member_modal_close_btn").onclick = function() {
											
											document.getElementById("delete_member_modal").style.display = "none";
											
										}
										
										
									}
									
								}
								
								document.getElementById("projectMemberModalListOkBtn").onclick = function() {
									
									const $projectMemberListRoleQuery = document.querySelectorAll("#projectMemberListRole");
									const $listMemberListQuery = document.querySelectorAll("#listMemberList");
									
									console.log($listMemberListQuery[0].innerText);
									console.log(${ sessionScope.loginMember.id });
									
									if($listMemberListQuery[0].innerText == ${ sessionScope.loginMember.id }) {
										
										let checkPm = 0;
										
										for(let i = 0; i < $projectMemberListRoleQuery.length; i++) {
											
											if($projectMemberListRoleQuery[i].value == "PM") {
												
												checkPm++;
												
											}
											
										}
										
										if(checkPm < 1) {
											
											alert("PM이 지정되지 않았습니다. 다시 확인해주세요!");
											
										} else if(checkPm > 1) {
											
											alert("PM은 두 명이상 될 수 없습니다. 다시 확인해주세요!");
										} else {
											
											document.getElementById("projectMemberModalListForm").submit();
										}
										
									} else {
										
										alert("변경 권한이 없습니다. Cancel 버튼으로 종료해주세요.");
										
									}
									
									
								}
								
								
							}
							
						},
						error: function(xhr, status, error) {
						   console.log(xhr);
						}
					});
					
				}
				
			}			
			
			for(let i = 0; i < $tds.length; i++) {
				
				$tds[i].onclick = function() {
					
					location.href = "${ pageContext.servletContext.contextPath }/sprint/list?code=" + $code[i].value;
				}
				
			}
			
			for(let i = 0; i < $projectAddMemberBtn.length; i++) {
		          
				$projectAddMemberBtn[i].onclick = function() {

					document.getElementById("regist_project_members_modal").style.display="block";
			             
					const $projectRealMemberList = document.querySelectorAll("#projectRealMemberList");
					
					projectCode = $code[i].value;
					
					let memberListFlag = 0;
					
					<c:forEach items="${projectList}" var="project" varStatus="status">
						if(i == ${status.index}) {
							for(let k = 0; k < $projectRealMemberList[i].children.length - 1; k++) {
								selectedMemberList.push($projectRealMemberList[i].children[k].children[0].value);
							}
						}
						projectMembersList = selectedMemberList;
					</c:forEach>
					
					console.log(projectMembersList);
					
				}

				$projectEditBtn[i].onclick = function() {
   	
					let updateModalProjectProgress = document.getElementById("updateModalProjectProgress");
					let updateModalProjectIndex = document.getElementById("updateModalProjectIndex");
					updateModalProjectProgress.value = $projectRealProgress[i].innerText;
					updateModalProjectIndex.value = i;
					
					if($proBox[i].style.display =='none') {
						$proBox[i].style.marginBottom = "500px";
				  		$proBox[i].style.display = 'block';
					} else {
					   	$proBox[i].style.display = 'none';
					}
   
				}
				
				$deleteProject[i].onclick = function() {
					
					document.getElementById("delete_modal").style.display="block";
                    $proBox[i].style.display = 'none';
                    
                    document.getElementById("delete_modal_close_btn").onclick = function() {
                         document.getElementById("delete_modal").style.display="none";
                     }
                    
                    document.getElementById("delete_modal_ok_btn").onclick = function() {
                       
               			let projectUpdateIndex = document.getElementById("updateModalProjectIndex");
        				
        				<c:forEach items="${ projectList }" var="project" varStatus="status">
        					<c:forEach items="${project.projectMembers}" var="projectMembers">
        						if(projectUpdateIndex == "${status.index}") {
        							sock.send("${projectMembers.no}");
        						}
        					</c:forEach>
        				</c:forEach>
                    	
                       	location.href = "${ pageContext.servletContext.contextPath }/project/remove?code=" + $code[i].value;                        
                    }
					
				}				
			
				$updateAndSelectProject[i].onclick = function() {
					
					$proBox[i].style.display = 'none';
					
					$.ajax({
						url: "/byat/project/detail",
						type: 'get',
						data: { code : $code[i].value },
						success: function(data, status, xhr) {
                     
							const project = JSON.parse(data.projectDetail);
							const $projectUpdateModalTitle = $("#projectUpdateModalTitle");
							const $updateStartDate = $("#updateStartDate");
							const $updateEndDate = $("#updateEndDate");
							const $projectUpdateDescription = $("#projectUpdateDescription");
							const $projectUpdateCode = $("#projectUpdateCode");
	                     
							projectUpdateModalTitle.value = project.title;
							projectUpdateDescription.value = project.body;
							updateStartDate.value = project.startDate;
							updateEndDate.value = project.endDate;
							projectUpdateCode.value = project.code;
					   
							document.getElementById("projectUpdateModal").style.display="block";
							
							if(${sessionScope.loginMember.no} !=  project.projectMembers[0].no) {
							   
								projectUpdateModalTitle.readOnly = true;
								projectUpdateDescription.readOnly = true;
								updateStartDate.readOnly = true;
								updateEndDate.readOnly = true;
								writerCheck = true;
								
							} else {
								
								projectUpdateModalTitle.readOnly = false;
								projectUpdateDescription.readOnly = false;
								updateStartDate.readOnly = false;
								updateEndDate.readOnly = false;
								writerCheck = false;
							}
				   
						},
						error: function(xhr, status, error) {
						   console.log(xhr);
						}
					});
				}
				
			}
			
		}
		
		let searchMembersValue;
        // 모든 텍스트의 변경에 반응합니다.
        $("#searchMembers").on("propertychange change keyup paste input", function() {
           
           // 현재 변경된 데이터 셋팅
           searchMembersValue = $(this).val();
           
        });
        
        let selectMembers = [];
        const $memberDeleteBtn = document.querySelectorAll("#memberDeleteBtn");
		const $selectedMemberArea = document.querySelectorAll("#selectedMemberArea");
        
		$(function() {
			$('#searchMembers').autocomplete({
				source : function(request, response) {
					$.ajax({
						type : 'get',
		                url : '/byat/project/searchmembers',
		                data : { 
		                	searchValue : searchMembersValue,
		                	code : projectCode,
		                	selectMembers : selectMembers,
		                	projectMembersList : projectMembersList
		                },
		                traditional : true,
		                dataType : 'json',
		                success : function(data) {

		                	response(
		                        $.map(data, function(item) {
		                            return {
		                                value : item
		                            }
		                        })
		                    );
		                }
					});
				},
				select : function(event, ui) {
						
					selectMemberValue = ui.item.value.name + " " + ui.item.value.id;
					
					selectMemberNo = ui.item.value.no;
					
					selectName = ui.item.value.name;
					
					selectMembers.push(selectMemberNo);
					
					console.log(selectMembers);
					
					if(selectMemberValue != null) {
	            	
		            	document.getElementById('searchMembers').value = "";
			            
			            addMembersFormTag = document.getElementById('addMembersForm');
			            selectedMemberAreaDiv = document.createElement('div');
			            selectedMemberDiv = document.createElement('div');
			            selectedMemberProjectRoleDiv = document.createElement('select');
			            
			            hiddenMemberNo = document.createElement('input');
			            hiddenMemberNo.setAttribute('type', 'hidden');
			            hiddenMemberNo.setAttribute('name', 'no');
			            hiddenMemberNo.value = selectMemberNo;
			            
			            hiddenProjectCode = document.createElement('input');
			            hiddenProjectCode.setAttribute('type', 'hidden');
			            hiddenProjectCode.setAttribute('name', 'code');
			            hiddenProjectCode.value = projectCode;
			            
			            hiddenProjectMemberName = document.createElement('input');
			            hiddenProjectMemberName.setAttribute('type', 'hidden');
			            hiddenProjectMemberName.setAttribute('name', 'name');
			            hiddenProjectMemberName.value = selectName;
			            
			            selectedMemberAreaDiv.setAttribute('class', 'selectedMemberArea');
			            selectedMemberAreaDiv.setAttribute('id', 'selectedMemberArea');
			            
			            selectedMemberDiv.setAttribute('class', 'selectedMember');
			            selectedMemberDiv.setAttribute('id', 'selectedMember');
			            selectedMemberDiv.innerHTML = selectMemberValue;
			            
			            roleOption = document.createElement('option');
			            roleOption.innerText = '부PM';

			            selectedMemberProjectRoleDiv.setAttribute('class', 'selectedMemberProjectRole');
			            selectedMemberProjectRoleDiv.setAttribute('id', 'selectedMemberProjectRole');
			            selectedMemberProjectRoleDiv.setAttribute('name', 'role');
			            selectedMemberProjectRoleDiv.appendChild(roleOption);
			            
			            roleOption = document.createElement('option');
			            roleOption.setAttribute('id', 'roleOption');
			            roleOption.setAttribute('class', 'roleOption');
			            roleOption.innerText = '일반 멤버';
			            roleOption.setAttribute('selected', 'selected');
			            
			            selectedMemberProjectRoleDiv.appendChild(roleOption);
			            
			            memberDeleteBtn = document.createElement('input')
			            memberDeleteBtn.setAttribute('type', 'button');
			            memberDeleteBtn.setAttribute('id', 'memberDeleteBtn');
			            memberDeleteBtn.setAttribute('class', 'memberDeleteBtn');
			            
			            selectedMemberAreaDiv.appendChild(selectedMemberDiv);
			            selectedMemberAreaDiv.appendChild(selectedMemberProjectRoleDiv);
			            selectedMemberAreaDiv.appendChild(hiddenMemberNo);
			            selectedMemberAreaDiv.appendChild(hiddenProjectCode);
			            selectedMemberAreaDiv.appendChild(hiddenProjectMemberName);
			            selectedMemberAreaDiv.appendChild(memberDeleteBtn);
			            addMembersFormTag.appendChild(selectedMemberAreaDiv);
	            		
		            }
					
		        },
		        focus : function(event, ui) {
		            return false;
		        },
		        minLength : 1,
		        autoFocus : true,
		        classes : {
		            'ui-autocomplete': 'highlight'
		        },
		        delay : 100,
		        position : { my : 'right top', at : 'right bottom' },
		        close : function(event, ui) {
		            console.log(event);
		            
		            document.getElementById('searchMembers').value = "";
		            
		        }
			}).autocomplete('instance')._renderItem = function(ul, item) {
		        return $('<li>')
		        .append('<div>' + item.value.name + " " + item.value.id + '</div>')
		        .appendTo(ul);
		    };
		});
		
        $(document).ready(function() {
        	$(document).on("click", "#memberDeleteBtn", function(event) {
        		
				$(this).parent('div').remove();
				
				selectMembers = [];

        	});
        	
        });
        
        document.getElementById("delete_member_modal_close_btn").onclick = function() {
        	
        	document.getElementById("delete_member_modal").style.display = "none";
        }
		
        
		document.getElementById("registMembersOkBtn").onclick = function() {
			
			const $selectedMemberDivText = document.querySelectorAll("#selectedMember");
			
			if(!($selectedMemberDivText.length == 0)) {
				
				document.getElementById("addMembersForm").submit();
				
			} else {
				
				alert("추가할 멤버가 없습니다. 멤버를 추가해 주세요!");
				
			}
			
		}
		
	</script>

</body>
</html>
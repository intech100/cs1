<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" media="screen"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/themes/base/jquery-ui.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="http://trirand.com/blog/jqgrid/themes/ui.jqgrid.css" />

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script src="http://trirand.com/blog/jqgrid/js/i18n/grid.locale-en.js"
	type="text/javascript"></script>
<script src="http://trirand.com/blog/jqgrid/js/jquery.jqGrid.min.js"
	type="text/javascript"></script>
<style type='text/css'>
</style>



<script type="text/javascript">
	$(document).ready(
			function() {
				$("#list").jqGrid(
						{
							url : 'Main?type=getdata',
							datatype : 'json',
							mtype : 'POST',

							colNames : [ 'emp_Id', 'emp_FirstName',
									'emp_LastName', 'emp_Address',
									'emp_Gender', 'emp_Password' ],
							colModel : [ {
								name : 'emp_Id',
								index : 'emp_Id',
								width : 150,
								editable : true
							}, {
								name : 'emp_FirstName',
								index : 'emp_FirstName',
								width : 150,
								editable : true
							}, {
								name : 'emp_LastName',
								index : 'emp_LastName',
								width : 150,
								editable : true
							}, {
								name : 'emp_Address',
								index : 'emp_Address',
								width : 200,
								editable : true
							}, {
								name : 'emp_Gender',
								index : 'emp_Gender',
								width : 150,
								editable : true
							}, {
								name : 'emp_Password',
								index : 'emp_Password',
								width : 150,
								editable : true
							} ],

							rowNum : 10,
							rowList : [ 10, 20, 30 ],
							height : 300,
							pager : '#pager',

							viewrecords : true,
							gridview : true,
							loadonce : true,
							editurl : "Main?type=editing",
							caption : 'Employee Details',
							jsonReader : {
								repeatitems : true,

							},

							datatype : 'json'
						});
				jQuery("#list").jqGrid(
						'navGrid',
						'#pager',
						{
							edit : true,
							add : true,
							del : true,

						},

						{ // edit data
							closeOnEscape : true,
							closeAfterEdit : true,
							reloadAfterSubmit : true,
							drag : true,
							onclickSubmit : function(response, postdata) {

								var datas = JSON.stringify(postdata);

								$.ajax({
									url : "Main?type=editdata",
									datatype : 'json',
									data : {
										'dataIS' : datas
									},
									type : 'POST',
								});
								alert("record edited");
							},
							afterSubmit : function(response, postdata) {
								alert("Data Submited");
								debugger;
								if (response.responseText == "") {

									$(this).jqGrid('setGridParam', {
										datatype : 'json'
									}).trigger('reloadGrid');
									return [ true, '' ];
								} else {
									alert(response);
									$(this).jqGrid('setGridParam', {
										datatype : 'json'
									}).trigger('reloadGrid');
									return [ false, response.responseText ];
								}
							}

						},
						{ //add data

							closeAfterAdd : true,
							closeOnEscape : true,
							reloadAfterSubmit : true,
							drag : true,
							onclickSubmit : function(response, postdata) {

								var datas = JSON.stringify(postdata);

								$.ajax({
									url : "Main?type=adddata",
									datatype : 'json',
									data : {
										'dataIS' : datas
									},
									type : 'POST',
								});
								alert("record added");
							},

							afterSubmit : function(response, postdata) {
								alert("Data Submited");
								debugger;
								if (response.responseText == "") {

									$(this).jqGrid('setGridParam', {
										datatype : 'json'
									}).trigger('reloadGrid');
									return [ true, '' ];
								} else {
									alert(response);
									$(this).jqGrid('setGridParam', {
										datatype : 'json'
									}).trigger('reloadGrid');
									return [ false, response.responseText ];
								}
							}

						},
						{ // delete data
							closeOnEscape : true,
							closeAfterDelete : true,
							reloadAfterSubmit : true,
							drag : true,
							onclickSubmit : function(response, postdata) {

								var gr = jQuery("#list").jqGrid('getGridParam',
										'selrow');
								var rowData = jQuery("#list").getRowData(gr);
								var datas = JSON.stringify(rowData);

								$.ajax({
									url : "Main?type=deleteData",
									datatype : 'json',
									data : {
										'dataIS' : datas
									},
									type : 'POST',
								});
								alert("record Deleted");
							},

						});

			});
</script>
</head>
<body>




<div style="background-color: black; width: 100%; height:auto;float: right">

	<div  style="background-color: black; color:white ; float: right;">
		
			<%
				out.println(" <h2>  Welcome : " + session.getAttribute("users")
						+ "</h2>");
			%>
			&nbsp;&nbsp; <a href="Login.jsp" style="color: red"> Logout</a> 

		</div>
	</div>
	<div style="color:red; margin-top: 60px">
		<center>
			<h1>Employee Details</h1>
		</center>
	</div>

	<div style="margin-left: 150px; margin-top: 50px ; color: red;" >




		<table id="list" style="margin: auto;">
			<tr>
				<td />
			</tr>

		</table>

		<div id="pager"></div>

	</div>


</body>
</html>
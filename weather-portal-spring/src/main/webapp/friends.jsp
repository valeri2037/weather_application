<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
    <title>Weather App</title>

    <meta name="apple-mobile-web-app-capable" content="yes">

    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/main.css" rel="stylesheet">

    <script src="js/vendor/jquery/jquery-1.12.1.min.js"></script>
    <script src="js/vendor/bootstrap/bootstrap.min.js"></script>
    <script src="js/main.js"></script>


</head>
<body>

<div class="friends-page">

    <%@ include file="header.jsp" %>

	<c:set scope="session" var="navPoint" value="friends">
	</c:set>

    <div class="container">


        <div class="row" style="margin-top:30px;">

            <div class="col-sm-4">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Добави приятел</h3>
                    </div>
                    <div class="panel-body">

                        <div class="input-group">
                            <input type="text" class="form-control" id="search-friend" placeholder="Търси по име">
                            <span class="input-group-addon"><i class="fa fa-search"></i></span>
                        </div>
                        <div id="search-result"></div>

                    </div>
                </div>
            </div>
            <div class="col-sm-8">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Списък с приятели</h3>
                    </div>

                    <table class="table table-striped table-bordered friends-table">
                        <thead>
                        <th>Снимка</th>
                        <th>Име</th>
                        <th class="hidden-xs">Email</th>
                        <th class="remove-col"><span class="hidden-xs">Премахни</span></th>
                        </thead>
                        <tbody>
                             
                        <c:forEach items="${friends}" var="friend">                        
	                        <tr>
	                            <td>
	                                <img class="img-thumbnail" src="assets/img/user.jpg">
	                            </td>
	                            <td>
                                        <span class="friend-name">
                                            ${friend.username}
                                        </span>
	                            </td>
	                            <td class="hidden-xs">
	                                <span class="friend-email">${friend.email}</span>
	                            </td>
	                            <td>
	                                <button type="button" class="btn btn-danger pull-right remove-friend">
	                                    <span class="glyphicon glyphicon-remove"></span>
	                                    <span class="hidden-xs"> Премахни</span>
	                                </button>
	                            </td>
	                        </tr>
                        </c:forEach>                        
                        </tbody>
                    </table>
                </div>

            </div>
        </div>

    </div>

</div>


<script>
    getCurrentTemp();
    
    var timeout;
    
    $('#search-friend').keyup(function(){ beginSearch(); });
    
    function beginSearch(){
    	
    	clearTimeout(timeout);
    	
    	timeout = setTimeout(function(){
    		
    		$.ajax({
    			url: "HelloWorldServlet?action=search&searchTerm=" + $('#search-friend').val()
    		}).done(function (data){
    			alert(data);
    		});    		
    	}, 1000);
    }

</script>
</body>
</html>

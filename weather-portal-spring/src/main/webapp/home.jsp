<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="uni.fmi.masters.bean.UserBean" %>
<%@ page import="uni.fmi.masters.bean.CommentBean" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

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

<div class="home-page">

		<% session.setAttribute("navPoint", "home"); %>
        <%@ include file="header.jsp" %>

        <div class="container">


            <div class="row" style="margin-top:30px;">

                <div class="col-sm-4">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Отбележи място и напиши коментар</h3>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <img class="thumbnail img-responsive" src="assets/img/icons/clear_sky.png" id="select-img-icon">
                                    </div>
                                    <div class="col-sm-8">
                                        <div>
                                            <span class="label label-success"><span class="current-temp" id="select-current-temp">27</span> ℃</span>
                                        </div>
                                        <label for="select-city">Избери град:</label>
                                        <select id="select-city" class="form-control">
                                            <option value="0" selected disabled>Всички</option>
                                            <option value="london">Лондон</option>
                                            <option value="new york">Ню Йорк</option>
                                            <option value="sofia">София</option>
                                            <option value="plovdiv">Пловдив</option>
                                            <option value="varna">Варна</option>
                                            <option value="burgas">Бургас</option>
                                            <option value="stara zagora">Стара Загора</option>
                                            <option value="ruse">Русе</option>
                                            <option value="pleven">Плевен</option>
                                            <option value="dobrich">Добрич</option>
                                            <option value="sliven">Сливен</option>
                                            <option value="shumen">Шумен</option>
                                            <option value="pernik">Перник</option>
                                            <option value="pazardzhik">Пазарджик</option>
                                            <option value="yambol">Ямбол</option>
                                            <option value="haskovo">Хасково</option>
                                            <option value="blagoevgrad">Благоевград</option>
                                            <option value="veliko tarnovo">Велико Търново</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                   <div class="col-sm-12">
                                       <label for="comment">Коментар:</label>
                                       <textarea class="form-control" rows="3" id="comment"></textarea>
                                   </div>
                                </div>

                            </div>
                        </div>
                        <div class="panel-footer" style="height:55px;">
                            <button type="button" class="btn btn-primary pull-right publish"><span class="glyphicon glyphicon-globe"></span> Публикувай</button>
                        </div>
                    </div>
                </div>
                <div class="col-sm-8">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Твоите отбелязвания</h3>
                        </div>
                        
                          <ul class="list-group" style="min-height:241px;" id="comments-list">    
	                        <%
	                        	UserBean user = (UserBean) request.getSession().getAttribute("user");
	                        
	                  
	                        
	                        	for(CommentBean comment : user.getComments()){
	                        %>
	                        
	                        <li class="list-group-item">
							    <div class="row">
							        <div class="col-sm-2 col-xs-3">
							            <img src="assets/img/icons/clear_sky.png" class="thumbnail img-responsive">
							        </div>
							        <div class="col-sm-7 col-xs-6">
							            <span class="label label-success">
							            <span class="current-temp"><%= comment.getTemp() %></span> ℃</span>
							            <h4><%= comment.getCity() %></h4>
							            <p><%= comment.getComment() %></p>
							        </div>
							        <div class="col-sm-3 col-xs-3">
							            <button type="button" class="btn btn-danger pull-right remove-post" 
							            onclick="deleteComment(<%= comment.getId() %>)">
							            <span class="glyphicon glyphicon-remove"></span><span class="hidden-xs"> Изтрий</span></button>
							        </div>
							    </div>
							</li> 
                        
                        	<% } %>

                                                           
        
                        </ul>
                    </div>

                </div>
            </div>


        </div>

</div>

<li class="list-group-item" style="display: none;" id="cloneMe">
    <div class="row">
        <div class="col-sm-2 col-xs-3">
            <img src="assets/img/icons/clear_sky.png" class="thumbnail img-responsive">
        </div>
        <div class="col-sm-7 col-xs-6">
            <span class="label label-success"><span class="current-temp">27</span> ℃</span>
            <h4>Пловдив</h4>
            <p>Времето беше супер. Разхождах се по главната. Купих си сладолед и пих вода от чешмичката на джумаята. </p>
        </div>
        <div class="col-sm-3 col-xs-3">
            <button type="button" class="btn btn-danger pull-right remove-post"><span class="glyphicon glyphicon-remove"></span><span class="hidden-xs"> Изтрий</span></button>
        </div>
    </div>
</li> 

<script>

    $(document).ready(function(){
        
        var apiKey = "4ddc620cf659bfe28db6d4012c9fc208";
        var city = "Plovdiv";


        function doApiRequest(city, type){

            $.ajax({
                method: "GET",
                url: "http://api.openweathermap.org/data/2.5/weather?q=" + city + 
                "&appid=" + apiKey + "&units=metric",
                dataType: "json"
            }).done(function(data){

                switch(type){
                    case "main":
                        displayWeatherInformation(data);
                    break;

                    case "comment":
                    	sendCommentToBackend(data);
                    break;

                    case "select":
                        changeTempOnSelect(data);
                    break;

                }

            }).fail(function(){
                console.log("failed");
            });

        }

        function changeTempOnSelect(data){
            $('#select-current-temp').text(data.main.temp);
            setWeatherIcon(data.weather[0].id.toString(), $('#select-img-icon'));
        }

        $('#select-city').change(function (){

            console.log($(this).val());
            doApiRequest($(this).val() ,"select")
        });

        
        function sendCommentToBackend(data){
        	
        	
        	$.ajax({
        		method : "POST",
        		url: "HelloWorldServlet?action=postComment"+
        				"&city=" + $('#select-city').val() +
        				"&comment=" + $('#comment').val() + 
        				"&temp=" + data.main.temp,
      				success : function (response){
      					if(response == 'true')
      						postComment(data);
      				}        				
        	});
        }
        
        
        
        function postComment(data){
                var miniMe = $('#cloneMe').clone();

                miniMe.find('h4').text(cityName);
                miniMe.find('p').text($('#comment').val());
                miniMe.attr('id', '');
                miniMe.find('.current-temp').text(data.main.temp);
                
                miniMe.find('button').click(function(){
                    miniMe.remove();
                });

                iconToChange = miniMe.find('img');

                setWeatherIcon(data.weather[0].id.toString(), iconToChange);



                $('#comments-list').prepend(miniMe);

                $('#comment').val("");
                
                miniMe.show();
        }


        $('.publish').click(function(){

            cityName = $('#select-city').val();
            doApiRequest(cityName, "comment");         
        });

        function displayWeatherInformation(weatherData){
            $("#current-temperature").text(weatherData.main.temp);

            weatherID = weatherData.weather[0].id.toString();
            iconPlace = $('.img-container').find('img');

            setWeatherIcon(weatherID, iconPlace);   
            
        }

        function setWeatherIcon(weatherID, iconPlace){

            if(weatherID.charAt(0) == 2){
                iconPlace.attr('src', 'assets/img/icons/thunderstorm.png');
            }else if(weatherID.charAt(0) == 3){
                iconPlace.attr('src', 'assets/img/icons/rain.png');
            }else if(weatherID.charAt(0) == 5){
                iconPlace.attr('src', 'assets/img/icons/shower_rain.png');
            }else if(weatherID.charAt(0) == 6){
                iconPlace.attr('src', 'assets/img/icons/snow.png');
            }else if(weatherID.charAt(0) == 7){
                iconPlace.attr('src', 'assets/img/icons/mist.png');            
            }else if(weatherID == '800'){
                iconPlace.attr('src', 'assets/img/icons/clear_sky.png');
            }else if(weatherID == '802'){
                iconPlace.attr('src', 'assets/img/icons/scattered_clouds.png');
            }else if(weatherID.charAt(0) == 8){
                iconPlace.attr('src', 'assets/img/icons/few_clouds.png');
            }


            iconPlace.show();
        }
        
        doApiRequest("plovdiv","main");

    });

    
    function deleteComment(commentId){    	
    	
    	$.ajax({
    		method: "POST",
    		url: "HelloWorldServlet?action=deleteComment&commentID=" + commentId,
    			success: function(data){
    				window.location = data.url;
    			}
    	});
    }
    

</script>
</body>
</html>

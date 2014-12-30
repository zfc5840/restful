<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setAttribute("ctx",request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="${ctx}/js/jquery-1.7.2.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {  
    $("#profile").click(function() {  
        profile();  
    });  
    $("#login").click(function() {  
        login();  
    });  
});  
function profile() {  
    var url = 'http://localhost:8080/restful/person/profile/';  
    var query = $('#id').val() + '/' + $('#name').val() + '/'  
            + $('#status').val();  
    url += query;  
    alert(url);  
    $.get(url, function(data) {  
        alert("id: " + data.id + "\nname: " + data.name + "\nstatus: "  
                + data.status);  
    });  
}  
function login() {  
    var mydata = '{"name":"' + $('#name').val() + '","id":"'  
            + $('#id').val() + '","status":"' + $('#status').val() + '"}';  
    alert(mydata);  
    $.ajax({  
        type : 'POST',  
        contentType : 'application/json',  
        url : 'http://localhost:8080/restful/person/login',  
        processData : false,  
        dataType : 'json',  
        data : mydata,  
        success : function(data) {  
            alert("id: " + data.id + "\nname: " + data.name + "\nstatus: "  
                    + data.status);  
        },  
        error : function() {  
            alert('Err...');  
        }  
    });  
}
</script>
</head>
<body>
<table>  
    <tr>  
        <td>id</td>  
        <td><input id="id" value="100" /></td>  
    </tr>  
    <tr>  
        <td>name</td>  
        <td><input type="text" id="name"/></td>  
    </tr>  
    <tr>  
        <td>status</td>  
        <td><input type="text" id="status"  /></td>  
    </tr>  
    <tr>  
        <td><input type="button" id="profile" value="Profile——GET" /></td>  
        <td><input type="button" id="login" value="Login——POST" /></td>  
    </tr>  
</table>  
</body>
</html>
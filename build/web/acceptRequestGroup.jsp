<!DOCTYPE html>
<html lang="en">


    <!-- blog23:34-->
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo-dark.png">
        <title>MPMR - Manage Personal Medical Record</title>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Slab&subset=latin,greek' rel='stylesheet' type='text/css'>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/customStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <style>
            body{
                font-size: 14px;
            }
            .sidebar-menu li a {
                color: black;
                font-weight: 500;
            }


            div.pagination__controls {
                padding-left: 46%;
            }
            .btn-primary{
                padding-top: 8px;
                padding-left: 7px;
                width: 150px;
                height: 37px;
                font-size: 14px;
            }
            .custom-btn{
                width: 20px;
                height: 37px;
                font-size: 14px;
            }
            a:hover{
                cursor: pointer;
            }

            .btn-success{
                border: 1px solid #1a7edb;
                background: #009efb;
                border-radius: 6px;
                font-size: 16px;
                margin-left: 5px;
                width: 100px;
            }


            .divTable
            {
                border-radius: 10px;
                border: 1px solid lightgrey;
                margin-left: 10%;
                margin-bottom: 20px;
                width: 80%;
                height: 120px;
                background-color: white;
            }
            .left {
                width: 15%;
                height: 100%;
                /*background-color: red;*/
                float: left;
            }
            .right {
                width: 85%;
                height: 100%;
                /*background-color: yellow;*/
                float: left;
            }

            .top {
                padding-top: 2%;
                width: 100%;
                height: 50%;
                font-size: 18px;
                margin-bottom: 15px;
                margin-right: 20px;
                /*background-color: blue;*/
            }
            .bottom {
                width: 100%;
                height: 50%;
                /*background-color: pink;*/
            }
            a.action-icon.dropdown-toggle.top-right {
                float: left;
                width: 10%;
            }
            h2.group-name {
                float: left;
                width: 96%;
            }
            img.avatar {
                /*width: 130px;*/
                min-width: 100px;
                width: 65%;
                height: 100%;
                border-radius:10px;

            }
            div.left.doctor-img{
                margin-top: 20px;
                left: 25px;
            }

            @media screen and (max-width:1250px) {
                .left {
                    width:20%; 
                }
                .right {
                    width:75%; 
                }
                .divTable
                {

                    height: 150px;

                }
                .btn-success{
                    margin-top: 3%;
                    width: 80px;
                }
            }
            @media screen and (max-width:1400px) {
                .left {
                    width:20%; 
                }
                .right {
                    width:75%; 
                }
                .divTable
                {

                    height: 150px;

                }
                .btn-success{
                    margin-top: 3%;
                    width: 80px;
                }
            }
            @media screen and (max-width:690px) {
                .left {
                    width:30%; 
                }
                .right {
                    width:65%;
                    margin-left: 5px;
                }
                .divTable
                {

                    height: 180px;

                }
                .btn-success{
                    margin-top: 35px;
                    width: 80px;
                }
            }

            .timeRequest{
                margin-top: 2px;
                font-size: 14px;
                color: gray;
            }
        </style>

    </head>
    <%@include file="components/userHeader.html" %>
    <%@include file="components/userSidebar.html" %>
    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div id="title" class="col-sm-4 col-3">
                    <h4 class="page-title">Your Pending Requests</h4>
                </div>


            </div>
            <div id="pagination-1" class="row doctor-grid">

                <div id="clickToDetail" class="divTable" style="display: block;">
                    <div class="left doctor-img">
                        <a class="avatar"><img id="img-avt" alt="" src="https://firebasestorage.googleapis.com/v0/b/upload-image-45245.appspot.com/o/1607663291255-03e096599dc867963ed9.jpg?alt=media&token=1cac546f-8044-43c0-957e-1f7dc70c39ac"></a>
                    </div>
                    <div class="right">
                        <div class="top">
                            <span class="group-name"><a href="#">Bạn nhận được lời mời tham gia nhóm </a></span>
                            <span id='groupName'>[Tên Nhóm]</span>
                            <div id='groupLeader'></div>
                            <div id='time' class="timeRequest">Time: </div>

                        </div>
                        <div class="bottom">
                            <button class="btn-success" name="btnAccept" id="btnAccept">Accept</button>
                            <button class="btn-success" name="btnRefuse" id="btnRefuse">Refuse</button>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="components/userFooter.html" %>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

            <script type="text/javascript" src="assets/js/jQuery.paginate.js"></script>
            <script src="assets/js/popper.min.js"></script>
            <script src="assets/js/bootstrap.min.js"></script>
            <script src="assets/js/jquery.slimscroll.js"></script>
            <script src="assets/js/select2.min.js"></script>
            <script src="assets/js/moment.min.js"></script>

            <script src="assets/js/app.js"></script>
            <script type="text/javascript">
                $(document).ready(function () {
                    var token = localStorage.getItem("key");
                    var request = JSON.parse(localStorage.getItem("request"));
                    var response = localStorage.getItem("response");
                    var today = moment().format("YYYY-MM-DDTHH:mm:ss");
                    request.dateRequest = request.dateRequest.split("Z");
                    var time = request.dateRequest[0].split("T");
                    document.getElementById("time").innerHTML = time[1] + " " + time[0];
                    $.ajax({
                        type: "GET",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        headers: {
                            Authorization: 'Bearer ' + token},
                        url: "https://bt-application.herokuapp.com/api/userfamilygroup/findgroupleader/" + response,
                        success: function (data) {
                            console.log(data);
                            document.getElementById("groupName").innerHTML = data[0].familyGroupId.name;
                            document.getElementById("groupLeader").innerHTML = data[0].userId.fullname;
                            $('#img-avt').attr('src', data[0].userId.image);
                        }})
                    $(document).on('click', '[id^="btnAccept"]', function () {
                        $.ajax({
                            type: "POST",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            headers: {
                                Authorization: 'Bearer ' + token},
                            data: JSON.stringify({
                                "groupRole": "Member",
                                "userId": {
                                    "id": request.userId.id
                                },
                                "familyGroupId": {
                                    "id": request.familyGroupId.id
                                }
                            }),
                            url: "http://bt-application.herokuapp.com/api/userfamilygroup/insert",
                            complete: function (jqXHR, textStatus) {
                                if (jqXHR.status === 201) {
                                    $.ajax({
                                        type: "PUT",
                                        dataType: "json",
                                        contentType: "application/json; charset=utf-8",
                                        headers: {
                                            Authorization: 'Bearer ' + token},
                                        data: JSON.stringify({
                                            "id": request.id,
                                            "dateRequest": today + "Z",
                                            "status": "accept",
                                            "userId": {
                                                "id": request.userId.id
                                            },
                                            "familyGroupId": {
                                                "id": request.familyGroupId.id
                                            }
                                        }),
                                        url: "http://bt-application.herokuapp.com/api/request/edit",
                                        complete: function (jqXHR, textStatus) {
                                            console.log(jqXHR.status);
                                            if (jqXHR.status === 200) {
                                                window.location.href = "userIndex.jsp";
                                            }
                                        }
                                    });
                                }
                            }
                        });

                    });
                    $(document).on('click', '[id^="btnRefuse"]', function () {
                        $.ajax({
                            type: "PUT",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            headers: {
                                Authorization: 'Bearer ' + token},
                            data: JSON.stringify({
                                "id": request.id,
                                "dateRequest": today + "Z",
                                "status": "refuse",
                                "userId": {
                                    "id": request.userId.id
                                },
                                "familyGroupId": {
                                    "id": request.familyGroupId.id
                                }
                            }),
                            url: "http://bt-application.herokuapp.com/api/request/edit",
                            complete: function (jqXHR, textStatus) {
                                if (jqXHR.status === 200) {
                                    window.location.href = "userIndex.jsp";
                                }
                            }
                        })
                    });

                });


            </script>
            </body>
            </html>
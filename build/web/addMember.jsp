<!DOCTYPE html>
<html lang="en">


    <!-- blog23:34-->
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo-dark.png">
        <title>MPMR - Manage Personal Medical Record</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/customStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <style>
            .sidebar-menu li a {
                color: black;
                font-weight: 500;
            }

            .sidebar-menu li#aPatient a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }
            .custom-seach {
                border: 0.5px solid;
                width: 40%;
            }
            div.input-group {
                float: left;

            }
            #txtSearch {
                float: left;
                margin-right: 3%;
            }
            .input-group-btn :hover {
                background-color: #007bff;
            }
            div.row {
                margin-left: 20%;
            }
            #viewSearch {
                margin-top: 5%;
            }
            #viewSearch th {
                padding: 1%;
                background-color: #009efb;
                color: white;

                /*border: 0.5px #007bff solid;*/
            }
            #viewSearch td {
                padding: 1%;
                background-color: white;
                /*border: 0.5px #007bff solid;*/
            }
            button#btnAdd {
                width: 50px;
                border: none;
                background-color: #009efb;
                border-radius: 20px;
                height: 30px;
                color: white;
            }
            button#btnAdd:hover {
                background-color: #007bff;
                cursor: pointer;
            }
            button#btnSearch {
                width: 100px;
                border: none;
                background-color: #009efb;
                border-radius: 20px;
                height: 30px;
                color: white;
            }
            button#btnSearch:hover {
                background-color: #007bff;
                cursor: pointer;
            }
        </style>
    </head>

    <%@include file="components/userHeader.html" %>
    <%@include file="components/userSidebar.html" %>

    <!-- ============================================== Add Patient Form ================================================ -->

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <h4 class="page-title">Add Member in Group</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <input id="txtSearch" class="custom-seach" type="text" placeholder=" &nbsp; Search by phone" required/>
                    <button id="btnSearch">
                        <i class="fa fa-search"> Search</i>
                    </button>
                </div>

            </div>
            <div>
                <div id="table-viewSearch">

                </div>
            </div>
        </div>

    </div>

    <!-- ==================================Chat Box And Notification ======================================= -->


    <%@include file="components/footer.html" %>
    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.slimscroll.js"></script>
    <script src="assets/js/select2.min.js"></script>
    <script src="assets/js/moment.min.js"></script>
    <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
    <script src="assets/js/app.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    <script type="text/javascript">

        window.onload = function () {
            var token = localStorage.getItem("key");
            var familyGroupId = localStorage.getItem("familyGroupId");
            var listMember = JSON.parse(localStorage.getItem("listMember"));
            var today = moment().format("YYYY-MM-DDTHH:mm:ss");
//            console.log(listMember);
            var x = "";
            var phone = "";
            var y = "";
            var search = "";
            $("#btnSearch").click(function () {
                phone = $("#txtSearch").val();
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "http://bt-application.herokuapp.com/api/userinfor/findbyphone/" + phone.trim(),
                    success: function (values) {
                        if (values) {
                            search = values;
                            var sex = "";
                            if (values.gender === 1) {
                                sex = sex + "Femail";
                            } else if (values.gender === 0) {
                                sex = sex + "Male";
                            }
                            var phoneExist = [];
                            for (var i = 0; i < listMember.length; i++) {
                                phoneExist.push(listMember[i].userId.phone);
//                            console.log(phoneExist);
//                            console.log(phone);                     
                            }
                            if (phoneExist.includes(phone)) {
                                y = '<td><p>Added</p></td></tr></tbody></table>';
                            } else {
                                y = '<td><button id="btnAdd">Add</button></td></tr></tbody></table>';
                            }
                            x = '<table id="viewSearch" class="display" style="width:100%">'
                                    + '<thead><tr><th>Avatar</th><th>Name</th><th>Phone</th><th>Gender</th><th>Mail</th><th>Action</th></tr></thead>'
                                    + '<tbody><tr><td><img class="avatar" src="' + values.image + '" alt=""></td><td>' + values.fullname + '</td><td>' + values.phone + '</td><td>' + sex + '</td><td>' + values.mail + '</td>'
                                    + y;
                        } else {
                            x = '<table id="viewSearch" class="display" style="width:100%">'
                                    + '<thead><tr><th>Avatar</th><th>Name</th><th>Phone</th><th>Gender</th><th>Mail</th><th>Action</th></tr></thead>'
                                    + '<tbody><tr><td>No data available in table</td><td></td><td></td><td></td><td></td><td></td>';

                        }
                    }, error: function (jqXHR, textStatus, errorThrown) {
                    }, complete: function (jqXHR, textStatus) {
                        $("div#table-viewSearch").html(x);
                    }
                });
            });
            $(document).on('click', '[id^="btnAdd"]', function () {
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    data: JSON.stringify({
                        "dateRequest": today + "Z",
                        "status": "waiting",
                        "userId": {
                            "id": search.id
                        },
                        "familyGroupId": {
                            "id": familyGroupId
                        }
                    }),
                    url: "http://bt-application.herokuapp.com/api/request/insert",
                    complete: function (jqXHR, textStatus) {
                        if (jqXHR.status === 201) {
                            window.location.href = "groupDetail.jsp";
                        }
                    }
                })
            });
        };
    </script>
</body>


<!-- add-patient24:07-->
</html>

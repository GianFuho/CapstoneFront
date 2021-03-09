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
        </style>
    </head>

    <%@include file="components/userHeader.html" %>
    <%@include file="components/userSidebar.html" %>

    <!-- ============================================== Add Patient Form ================================================ -->

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <h4 class="page-title">Create new group</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <form id="myForm" >
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Group name</label>
                                    <input class="form-control" id='groupName' name="groupName" type="text" >
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Group avatar</label>
                                    <div class="profile-upload">
                                        <div class="upload-img">
                                            <img id='img' alt="" src="assets/img/user.jpg">
                                        </div>
                                        <div class="upload-input">
                                            <input id='avatar' type="file" name="avatar" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="m-t-20 text-center">
                            <button id="createNewGroup" class="btn btn-primary submit-btn">Create Group</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- ==================================Chat Box And Notification ======================================= -->

        <%@include file="components/footer.html" %>
        <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-storage.js"></script>
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

            $("#myForm").validate({
                rules: {
                    "groupName": {
                        required: true
                    }
                },
                messages: {
                    "groupName": {
                        required: "Không được để trống"
                    }
                },
                errorPlacement: function (label, element) {
                    label.addClass('mt-2 text-danger');
                    label.insertAfter(element);
                },
                highlight: function (element, errorClass) {
                    $(element).parent().addClass('has-danger');
                    $(element).addClass('form-control-danger');
                },
                unhighlight: function (element) {
                    $(element).css('background', '#ffffff');
                }

            });
//                =====================================Insert===============================================

            $(document).ready(function () {
                function readURL(input) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            $('#img').attr('src', e.target.result);
                        }
                        reader.readAsDataURL(input.files[0]); // convert to base64 string
                    }
                }
                $('#avatar').change(function () {
                    readURL(this);
                });
                function uuidv4() {
                    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
                        return v.toString(16);
                    });
                }
                ;

                $("#createNewGroup").click(function (event) {
                    event.preventDefault();
                    var idFamily = uuidv4();
                    var firebaseConfig = {
                        apiKey: "AIzaSyBf5hSMUpJ-kpx5c87kgll3dXePgK-j9mQ",
                        authDomain: "upload-image-45245.firebaseapp.com",
                        databaseURL: "https://upload-image-45245.firebaseio.com",
                        projectId: "upload-image-45245",
                        storageBucket: "upload-image-45245.appspot.com",
                        messagingSenderId: "758652365413",
                        appId: "1:758652365413:web:f009f179396e4af4de748c",
                        measurementId: "G-S5ECRSMKRB"
                    };
                    function uploadImage() {
                        const ref = firebase.storage().ref();
                        const file = document.querySelector("#avatar").files[0];
                        if (file) {
                            const name = +new Date() + "-" + file.name;
                            const metadata = {
                                contentType: file.type
                            };
                            const task = ref.child(name).put(file, metadata);
                            task.then(snapshot => snapshot.ref.getDownloadURL()).then(url => {
                                ajax(url);
                            });
                        } else {
                            ajax("assets/img/user.jpg");
                        }
                    }
                    // Initialize Firebase
                    firebase.initializeApp(firebaseConfig);
                    var groupName = $("input[id='groupName']").val(); //lấy giá trị trong input user
                    var token = localStorage.getItem("key");
                    var userId = localStorage.getItem("userId");
                    function ajax(url) {
                        return   $.ajax({
                            type: "POST",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            headers: {
                                Authorization: 'Bearer ' + token},
                            data: JSON.stringify({
                                "id": idFamily,
                                "avatar": url,
                                "name": groupName,
                                "status": "Active"
                            }),
                            url: "https://bt-application.herokuapp.com/api/familygroup/insert",
                            complete: function (jqXHR) {
                                console.log(jqXHR.status);
                                if (jqXHR.status === 201) {
                                    $.ajax({
                                        type: "POST",
                                        dataType: "json",
                                        contentType: "application/json; charset=utf-8",
                                        headers: {
                                            Authorization: 'Bearer ' + token},
                                        data: JSON.stringify({
                                            "groupRole": "Leader",
                                            "userId": {"id": userId},
                                            "familyGroupId": {
                                                "id": idFamily
                                            }
                                        }),
                                        url: "https://bt-application.herokuapp.com/api/userfamilygroup/insert",
                                        complete: function (jqXHR) {
                                            console.log(jqXHR.status);
                                            if (jqXHR.status === 201) {
                                                window.location.href = "viewGroupMemberUser.jsp";
                                            }
                                        }
                                    });
                                }
                            }
                        });
                    }
                    uploadImage();
                });
            });
        </script>
    </body>
</html>

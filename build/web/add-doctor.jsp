<!DOCTYPE html>
<html lang="en">


    <!-- blog23:34-->
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo-dark.png">
        <title>MPMR - Manage Personal Medical Record</title>
        <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/customStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <style>
            .sidebar-menu li a {
                color: black;
                font-weight: 500;
            }

            .sidebar-menu li#aDoctor a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }
            .error {
                border-color: #FF0000 !important;
            }
            #avatar{
                overflow: hidden
            }
        </style>
    </head>

    <%@include file="components/header.html" %>
    <%@include file="components/sidebar.html" %>
    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <h4 class="page-title">Add Doctor</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <form>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>First Name <span class="text-danger">*</span></label>
                                    <input id='inputFirstname' class="form-control" name="firstName" type="text" required>
                                    <span id='messageFirstname'></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Last Name <span class="text-danger">*</span></label>
                                    <input id='inputLastname' class="form-control" name="lastName" type="text" required>
                                    <span id='messageLastname'></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Username <span class="text-danger">*</span></label>
                                    <input id='inputUsername' class="form-control" name="username" type="text">
                                    <span id='messageUsername'></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input id='inputEmail' class="form-control" name="email" type="email">
                                    <span id='messageEmail'></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Password <span class="text-danger">*</span></label>
                                    <input  id='inputPassword' class="form-control" id="password" name="password" type="password" onkeyup='check()'>
                                    <span id='messagePassword'/></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Confirm Password <span class="text-danger">*</span></label>
                                    <input class="form-control" id="confirmPass" name="confirmPass" type="password" onkeyup='check()'>
                                    <span id='message'></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Date of Birth</label>
                                    <div class="cal-icon">
                                        <input type="text" name="dob" class="form-control datetimepicker">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group gender-select">
                                    <label class="gen-label">Gender:</label>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                            <input type="radio" name="gender" class="form-check-input" checked>Male
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                            <input type="radio" name="gender" class="form-check-input">Female
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>Address</label>
                                            <input type="text" name="address" class="form-control">
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Phone <span class="text-danger">*</span> </label>
                                    <input id='inputPhone' class="form-control" name="phone" type="number">
                                    <span id='messagePhone'/></span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Clinic</label><br/>
                                    <select id="clinicID" name="clinicID" class="select">

                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Avatar</label>
                                    <div class="profile-upload">
                                        <div class="upload-img">
                                            <img id="img" alt=""src="assets/img/user.jpg">
                                        </div>
                                        <div class="upload-input">
                                            <input id="avatar" type="file" name="avatar" accept="image/x-png,image/gif,image/jpeg" class="form-control" onchange="validateFileType()">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="display-block">Status</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="status" id="patient_active" value="on" checked>
                                <label class="form-check-label" for="patient_active">
                                    Active
                                </label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="status" id="patient_inactive" value="on">
                                <label class="form-check-label" for="patient_inactive">
                                    Inactive
                                </label>
                            </div>
                        </div>
                        <div class="m-t-20 text-center">
                            <button id="createPatient" class="btn btn-primary submit-btn">Create Doctor</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="components/footer.html" %>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-storage.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script type="text/javascript">
                                                //              ==================================Check Password==========================================

                                                function validateFileType() {
                                                    var fileName = document.getElementById("avatar").value;
                                                    var idxDot = fileName.lastIndexOf(".") + 1;
                                                    var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
                                                    if (extFile === "jpg" || extFile === "jpeg" || extFile === "png") {
                                                        function readURL(input) {
                                                            if (input.files && input.files[0]) {
                                                                var reader = new FileReader();
                                                                reader.onload = function (e) {
                                                                    $('#img').attr('src', e.target.result);
                                                                }

                                                                reader.readAsDataURL(input.files[0]); // convert to base64 string
                                                            }
                                                        }

                                                        readURL(document.getElementById("avatar"));
                                                    } else {
                                                        toastr["error"]("Only jpg/jpeg and png files are allowed!", "Error", {"progressBar": true, "closeButton": true, "positionClass": "toast-top-full-width"});
                                                        $("input[id='avatar']").val("");
                                                        $('#img').attr('src', "assets/img/user.jpg");
                                                    }
                                                }
                                                var check = function () {

                                                    if (document.getElementById('inputPassword').value ===
                                                            document.getElementById('confirmPass').value && document.getElementById('inputPassword').value !== "") {
                                                        document.getElementById('message').style.color = 'green';
                                                        document.getElementById('message').innerHTML = 'OK ???';
                                                        $("#createPatient").removeAttr("disabled");
                                                    } else {
                                                        if (document.getElementById('inputPassword').value !== "") {
                                                            document.getElementById('message').style.color = 'red';
                                                            document.getElementById('message').innerHTML = 'not matching ???';
                                                            $("#createPatient").attr("disabled", "disabled");
                                                        } else {
                                                            document.getElementById('message').innerHTML = '';
                                                        }

                                                    }

                                                };
//                =====================================Insert===============================================
                                                $(document).ready(function () {

                                                    $.ajax({
                                                        type: "GET",
                                                        dataType: "json",
                                                        contentType: "application/json; charset=utf-8",
                                                        headers: {
                                                            Authorization: 'Bearer ' + token},
                                                        url: "https://bt-application.herokuapp.com/api/clinic/getall",
                                                        success: function (data) {
                                                            var select = document.getElementById("clinicID");
                                                            for (var i in data) {
                                                                $(select).append('<option value=' + data[i].id + '>' + data[i].name + '</option>');
                                                            }
                                                        }
                                                    });
                                                    function uuidv4() {
                                                        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                                                            var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
                                                            return v.toString(16);
                                                        });
                                                    }


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
                                                    // Initialize Firebase
                                                    firebase.initializeApp(firebaseConfig);
                                                    function validateEmail(email)
                                                    {
                                                        var re = /\S{3,}@\S+\.\S+/;
                                                        return re.test(email);
                                                    }
                                                    function removeAscent(str) {
                                                        if (str === null || str === undefined) {
                                                            return str;
                                                        }
                                                        str = str.toLowerCase();
                                                        str = str.replace(/??|??|???|???|??|??|???|???|???|???|???|??|???|???|???|???|???/g, "a");
                                                        str = str.replace(/??|??|???|???|???|??|???|???|???|???|???/g, "e");
                                                        str = str.replace(/??|??|???|???|??/g, "i");
                                                        str = str.replace(/??|??|???|???|??|??|???|???|???|???|???|??|???|???|???|???|???/g, "o");
                                                        str = str.replace(/??|??|???|???|??|??|???|???|???|???|???/g, "u");
                                                        str = str.replace(/???|??|???|???|???/g, "y");
                                                        str = str.replace(/??/g, "d");
                                                        return str;
                                                    }
                                                    function validateName(name)
                                                    {
                                                        var re = /^[a-zA-Z ]+$/;
                                                        return re.test(name);
                                                    }
                                                    function validatePhone(phone)
                                                    {
                                                        var re = /((09|03|07|08|05)+([0-9]{8})\b)/g;
                                                        return re.test(phone);
                                                    }

                                                    $("#inputFirstname").click(function () {
                                                        $('#inputFirstname').removeClass('error');
                                                        document.getElementById('messageFirstname').innerHTML = '';
                                                    });
                                                    $("#inputLastname").click(function () {
                                                        $('#inputLastname').removeClass('error');
                                                        document.getElementById('messageLastname').innerHTML = '';
                                                    });
                                                    $("#inputUsername").click(function () {
                                                        $('#inputUsername').removeClass('error');
                                                        document.getElementById('messageUsername').innerHTML = '';
                                                    });
                                                    $("#inputPassword").click(function () {
                                                        $('#inputPassword').removeClass('error');
                                                        document.getElementById('messagePassword').innerHTML = '';
                                                    });
                                                    $("#inputPhone").click(function () {
                                                        $('#inputPhone').removeClass('error');
                                                        document.getElementById('messagePhone').innerHTML = '';
                                                    });
                                                    $("#inputEmail").click(function () {
                                                        $('#inputEmail').removeClass('error');
                                                        document.getElementById('messageEmail').innerHTML = '';
                                                    });
                                                    $("#createPatient").click(function (event) {
                                                        event.preventDefault();
                                                        $('#inputFirstname').removeClass('error');
                                                        document.getElementById('messageFirstname').innerHTML = '';
                                                        $('#inputLastname').removeClass('error');
                                                        document.getElementById('messageLastname').innerHTML = '';
                                                        $('#inputUsername').removeClass('error');
                                                        document.getElementById('messageUsername').innerHTML = '';
                                                        $('#inputPassword').removeClass('error');
                                                        document.getElementById('messagePassword').innerHTML = '';
                                                        $('#inputPassword').removeClass('error');
                                                        document.getElementById('messagePassword').innerHTML = '';
                                                        $('#inputPhone').removeClass('error');
                                                        document.getElementById('messagePhone').innerHTML = '';
                                                        $('#inputEmail').removeClass('error');
                                                        document.getElementById('messageEmail').innerHTML = '';
                                                        var count = 0;
                                                        var alluser = JSON.parse(localStorage.getItem("alluser"));
                                                        for (var i = 0; i < alluser.length; i++) {
                                                            if (alluser[i].username === document.getElementById('inputUsername').value) {
                                                                $('#inputUsername').addClass('error');
                                                                document.getElementById('messageUsername').style.color = 'red';
                                                                document.getElementById('messageUsername').innerHTML = 'Username already exists ???';
                                                                count = 1;
                                                            }
                                                            if (alluser[i].phone === document.getElementById('inputPhone').value) {
                                                                $('#inputPhone').addClass('error');
                                                                document.getElementById('messagePhone').style.color = 'red';
                                                                document.getElementById('messagePhone').innerHTML = 'Phone already exists ???';
                                                                count = 1;
                                                            }
                                                            if (alluser[i].mail === document.getElementById('inputEmail').value) {
                                                                $('#inputEmail').addClass('error');
                                                                document.getElementById('messageEmail').style.color = 'red';
                                                                document.getElementById('messageEmail').innerHTML = 'Email already exists ???';
                                                                count = 1;
                                                            }
                                                        }
                                                        var firstName = $("input[name='firstName']").val(); //l???y gi?? tr??? trong input user
                                                        var lastName = $("input[name='lastName']").val();
                                                        var username = $("input[name='username']").val();
                                                        var password = $("input[name='password']").val();
                                                        var dob = $("input[name='dob']").val();
                                                        var clinicID = $("select[id='clinicID']").val();
                                                        var gender = $("input[name='gender']").val();
                                                        var email = $("input[name='email']").val();
                                                        var address = $("input[name='address']").val();
                                                        var phone = $("input[name='phone']").val();
                                                        var status = $("input[name='status']").val();
                                                        var token = localStorage.getItem("key");
                                                        var selectGen = $('input[id="male"]:checked').val();
                                                        if (selectGen === "on") {
                                                            gender = 1;
                                                        } else {
                                                            gender = 0;
                                                        }

                                                        var selectSta = $('input[id="patient_active"]:checked').val();
                                                        if (selectSta === "on") {
                                                            status = "Active";
                                                        } else {
                                                            status = "Inactive";
                                                        }
                                                        if (firstName.length === 0 || !validateName(removeAscent(firstName)) || firstName.length > 14) {
                                                            $('#inputFirstname').addClass('error');
                                                            document.getElementById('messageFirstname').style.color = 'red';
                                                            document.getElementById('messageFirstname').innerHTML = 'First Name invalid ???';
                                                            if (lastName.length === 0 || !validateName(removeAscent(lastName)) || lastName.length > 35) {
                                                                $('#inputLastname').addClass('error');
                                                                document.getElementById('messageLastname').style.color = 'red';
                                                                document.getElementById('messageLastname').innerHTML = 'Last Name invalid ???';
                                                            }
                                                            if (username.length > 30 || username.length < 6) {
                                                                $('#inputUsername').addClass('error');
                                                                document.getElementById('messageUsername').style.color = 'red';
                                                                document.getElementById('messageUsername').innerHTML = 'Username must be between 6-30 charcters';
                                                            }
                                                            if (validateEmail(email) === false && email !== "") {
                                                                $('#inputEmail').addClass('error');
                                                                document.getElementById('messageEmail').style.color = 'red';
                                                                document.getElementById('messageEmail').innerHTML = 'Incorrect email format ???';
                                                            }
                                                            if (password.length > 30 || password.length < 6) {
                                                                $('#inputPassword').addClass('error');
                                                                document.getElementById('messagePassword').style.color = 'red';
                                                                document.getElementById('messagePassword').innerHTML = 'Password must be between 6-30 charcters';
                                                            }
                                                            if (phone.length !== 10 || !validatePhone(phone)) {
                                                                $('#inputPhone').addClass('error');
                                                                document.getElementById('messagePhone').style.color = 'red';
                                                                document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ???';
                                                            }

                                                        } else if (lastName.length === 0 || !validateName(removeAscent(lastName)) || lastName.length > 35) {
                                                            $('#inputLastname').addClass('error');
                                                            document.getElementById('messageLastname').style.color = 'red';
                                                            document.getElementById('messageLastname').innerHTML = 'Last Name invalid ???';
                                                            if (username.length > 30 || username.length < 6) {
                                                                $('#inputUsername').addClass('error');
                                                                document.getElementById('messageUsername').style.color = 'red';
                                                                document.getElementById('messageUsername').innerHTML = 'Username must be between 6-30 charcters';
                                                            }
                                                            if (validateEmail(email) === false && email !== "") {
                                                                $('#inputEmail').addClass('error');
                                                                document.getElementById('messageEmail').style.color = 'red';
                                                                document.getElementById('messageEmail').innerHTML = 'Incorrect email format ???';
                                                            }
                                                            if (password.length > 30 || password.length < 6) {
                                                                $('#inputPassword').addClass('error');
                                                                document.getElementById('messagePassword').style.color = 'red';
                                                                document.getElementById('messagePassword').innerHTML = 'Password must be between 6-30 charcters';
                                                            }
                                                            if (phone.length !== 10 || !validatePhone(phone)) {
                                                                $('#inputPhone').addClass('error');
                                                                document.getElementById('messagePhone').style.color = 'red';
                                                                document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ???';
                                                            }
                                                        } else if (username.length > 30 || username.length < 6) {
                                                            $('#inputUsername').addClass('error');
                                                            document.getElementById('messageUsername').style.color = 'red';
                                                            document.getElementById('messageUsername').innerHTML = 'Username must be between 6-30 charcters';
                                                            if (validateEmail(email) === false && email !== "") {
                                                                $('#inputEmail').addClass('error');
                                                                document.getElementById('messageEmail').style.color = 'red';
                                                                document.getElementById('messageEmail').innerHTML = 'Incorrect email format ???';
                                                            }
                                                            if (password.length > 30 || password.length < 6) {
                                                                $('#inputPassword').addClass('error');
                                                                document.getElementById('messagePassword').style.color = 'red';
                                                                document.getElementById('messagePassword').innerHTML = 'Password must be between 6-30 charcters';
                                                            }
                                                            if (phone.length !== 10 || !validatePhone(phone)) {
                                                                $('#inputPhone').addClass('error');
                                                                document.getElementById('messagePhone').style.color = 'red';
                                                                document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ???';
                                                            }
                                                        } else if (validateEmail(email) === false && email !== "") {
                                                            $('#inputEmail').addClass('error');
                                                            document.getElementById('messageEmail').style.color = 'red';
                                                            document.getElementById('messageEmail').innerHTML = 'Incorrect email format ???';
                                                            if (password.length > 30 || password.length < 6) {
                                                                $('#inputPassword').addClass('error');
                                                                document.getElementById('messagePassword').style.color = 'red';
                                                                document.getElementById('messagePassword').innerHTML = 'Password must be between 6-30 charcters';
                                                            }
                                                            if (phone.length !== 10 || !validatePhone(phone)) {
                                                                $('#inputPhone').addClass('error');
                                                                document.getElementById('messagePhone').style.color = 'red';
                                                                document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ???';
                                                            }
                                                        } else if (password.length > 30 || password.length < 6) {
                                                            $('#inputPassword').addClass('error');
                                                            document.getElementById('messagePassword').style.color = 'red';
                                                            document.getElementById('messagePassword').innerHTML = 'Password must be between 6-30 charcters';
                                                            if (phone.length !== 10 || !validatePhone(phone)) {
                                                                $('#inputPhone').addClass('error');
                                                                document.getElementById('messagePhone').style.color = 'red';
                                                                document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ???';
                                                            }
                                                        } else if (phone.length !== 10 || !validatePhone(phone)) {
                                                            $('#inputPhone').addClass('error');
                                                            document.getElementById('messagePhone').style.color = 'red';
                                                            document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ???';
                                                        } else if (count === 1) {

                                                        } else {
                                                            toastr["success"]("Create Successfully!", "Success", {"progressBar": true, "closeButton": true, "positionClass": "toast-top-full-width"});
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
                                                            function ajax(url) {
                                                                return  $.ajax({
                                                                    type: "POST",
                                                                    dataType: "json",
                                                                    contentType: "application/json; charset=utf-8",
                                                                    headers: {
                                                                        Authorization: 'Bearer ' + token},
                                                                    data: JSON.stringify({
                                                                        "address": address,
                                                                        "gender": gender,
                                                                        "dob": dob,
                                                                        "mail": email,
                                                                        "fullname": lastName + " " + firstName,
                                                                        "id": uuidv4(),
                                                                        "image": url,
                                                                        "password": password,
                                                                        "phone": phone,
                                                                        "roleId": {
                                                                            "id": 2

                                                                        },
                                                                        "status": status,
                                                                        "clinicId": {"id": clinicID},
                                                                        "token": "",
                                                                        "username": username


                                                                    }),
                                                                    url: "https://bt-application.herokuapp.com/api/userinfor/insert",
                                                                    complete: function (jqXHR) {
                                                                        console.log(jqXHR.status);
                                                                        if (jqXHR.status === 201) {
                                                                            window.location.href = "doctors.jsp";
                                                                        }
                                                                    }
                                                                });
                                                            }

                                                            uploadImage();
                                                        }
                                                    });
                                                });
        </script>
    </body>


    <!-- add-doctor24:06-->
</html>

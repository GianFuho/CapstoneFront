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

            .sidebar-menu li#aTestIndex a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }
        </style>
    </head>

    <%@include file="components/header.html" %>
    <%@include file="components/sidebar.html" %>

    <!-- ============================================== Add Patient Form ================================================ -->

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <h4 class="page-title">Edit Test Index</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <form id="myForm" >
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Name <span class="text-danger">*</span></label>
                                    <input class="form-control" id='name' name="name" type="text" >
                                    <span id='valiName'></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Description</label>
                                    <input class="form-control" id='description' name="description" type="text" >
                                    <span id='valiDes'></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Male Value Min. </label>
                                    <input class="form-control" id='maleMin' name="maleMin" type="number" required>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Male Value Max. </label>
                                    <input class="form-control" id='maleMax' name="maleMax" type="number">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Female Value Min. </label>
                                    <input class="form-control" id='femaleMin' name="femaleMin" type="number" required>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Female Value Max. </label>
                                    <input class="form-control" id='femaleMax' name="femaleMax" type="number">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Child Min. </label>
                                    <input class="form-control" id='childMin' name="childMin" type="number">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Child Max. </label>
                                    <input class="form-control" id='childMax' name="childMax" type="number">
                                </div>
                            </div>


                        </div>

                        <div class="m-t-20 text-center">
                            <button id="updateTestIndex" class="btn btn-primary submit-btn">Update Text Index</button>

                        </div>
                    </form>
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
        <script src="assets/js/app.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script type="text/javascript">

            $("#myForm").validate({
                rules: {
                    "name": {
                        required: true
                    },
                    "maleMin": {
                        required: true
                    },
                    "femaleMin": {
                        required: true
                    }
                },
                messages: {
                    "name": {
                        required: "Không được để trống"
                    },
                    "maleMin": {
                        required: "Không được để trống"
                    },
                    "femaleMin": {
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




// ======================================================Insert===============================================

            $(document).ready(function () {
                var data = localStorage.getItem("dataTest").split(',');
                var dataId = localStorage.getItem("dataTestId").split(',');
//                function uuidv4() {
//                    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
//                        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
//                        return v.toString(16);
//                    });
//                }
                console.log(dataId);

                var name = data[0];
                console.log(name);
                $("#updateTestIndex").attr('disabled','disabled');
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "https://bt-application.herokuapp.com/api/testresultdetail/findbytestidcheck/" + dataId[1],
                    success: function (data, textStatus, jqXHR) {
                        if(data.length === 0){
                            $("#updateTestIndex").removeAttr('disabled');
                        }
                    }});
                $("#name").val(name);
                var description = data[1];
                $("#description").val(description);
                var male = data[2].split('-');
                var maleMin = parseFloat(male[0]);
                $("#maleMin").val(maleMin);
                var maleMax = parseFloat(male[1]);
                $("#maleMax").val(maleMax);

                var feMale = data[3].split('-');
                var femaleMin = parseFloat(feMale[0]);
                $("#femaleMin").val(femaleMin);
                var femaleMax = parseFloat(feMale[1]);
                $("#femaleMax").val(femaleMax);

                var child = data[4].split('-');
                var childMin = parseFloat(child[0]);
                $("#childMin").val(childMin);
                var childMax = parseFloat(child[1]);
                $("#childMax").val(childMax);
                $("#updateTestIndex").click(function (event) {
                    event.preventDefault();
                    var name = $("input[name='name']").val(); //lấy giá trị trong input user
                    var description = $("input[name='description']").val();
                    var maleMin = $("input[name='maleMin']").val();

                    var maleMax = $("input[name='maleMax']").val();
                    var femaleMin = $("input[name='femaleMin']").val();
                    var femaleMax = $("input[name='femaleMax']").val();
                    var childMin = $("input[name='childMin']").val();
                    var childMax = $("input[name='childMax']").val();


                    var token = localStorage.getItem("key");
                    $.ajax({
                        type: "PUT",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        headers: {
                            Authorization: 'Bearer ' + token},
                        data: JSON.stringify({
                            "id": dataId[1],
                            "name": name,
                            "description": description,
                            "status": "Active"

                        }),
                        url: "https://bt-application.herokuapp.com/api/test/edit",
                        complete: function (jqXHR) {
                            console.log(jqXHR.status);
                            if (jqXHR.status === 200) {
                                if (maleMax !== null || maleMin !== null) {
                                    $.ajax({
                                        type: "PUT",
                                        dataType: "json",
                                        contentType: "application/json; charset=utf-8",
                                        headers: {
                                            Authorization: 'Bearer ' + token},
                                        data: JSON.stringify({
                                            "id": dataId[2],
                                            "indexesName": name,
                                            "description": description,
                                            "indexValueMax": maleMax,
                                            "indexValueMin": maleMin,
                                            "type": "Male",
                                            "testId": {
                                                "id": dataId[1]
                                            }
                                        }),
                                        url: "https://bt-application.herokuapp.com/api/testresultsample/edit",
                                        complete: function (jqXHR) {
                                            console.log(jqXHR.status);
                                            if (jqXHR.status === 200) {
                                                if (femaleMin !== null || femaleMax !== null) {
                                                    $.ajax({
                                                        type: "PUT",
                                                        dataType: "json",
                                                        contentType: "application/json; charset=utf-8",
                                                        headers: {
                                                            Authorization: 'Bearer ' + token},
                                                        data: JSON.stringify({
                                                            "id": dataId[3],
                                                            "indexesName": name,
                                                            "description": description,
                                                            "indexValueMax": femaleMax,
                                                            "indexValueMin": femaleMin,
                                                            "type": "Female",
                                                            "testId": {
                                                                "id": dataId[1]
                                                            }
                                                        }),
                                                        url: "https://bt-application.herokuapp.com/api/testresultsample/edit",
                                                        complete: function (jqXHR) {
                                                            console.log(jqXHR.status);
                                                            if (jqXHR.status === 200) {
                                                                if (childMin !== null || childMax !== null) {
                                                                    $.ajax({
                                                                        type: "PUT",
                                                                        dataType: "json",
                                                                        contentType: "application/json; charset=utf-8",
                                                                        headers: {
                                                                            Authorization: 'Bearer ' + token},
                                                                        data: JSON.stringify({
                                                                            "id": dataId[4],
                                                                            "indexesName": name,
                                                                            "description": description,
                                                                            "indexValueMax": childMax,
                                                                            "indexValueMin": childMin,
                                                                            "type": "Children",
                                                                            "testId": {
                                                                                "id": dataId[1]
                                                                            }
                                                                        }),
                                                                        url: "https://bt-application.herokuapp.com/api/testresultsample/edit",
                                                                        complete: function (jqXHR) {
                                                                            console.log(jqXHR.status);
                                                                            if (jqXHR.status === 200) {
                                                                                window.location.href = "testIndex.jsp";

                                                                            }
                                                                        }

                                                                    });
                                                                }
                                                            }
                                                        }

                                                    });
                                                }
                                            }
                                        }

                                    });
                                }


                            }



                        }
                    });

                });

            });

        </script>
    </body>


    <!-- add-patient24:07-->
</html>

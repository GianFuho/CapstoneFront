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
            .error {
                border-color: #FF0000 !important;
            }
            #description {
                height: 80px;
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
                    <h4 class="page-title">Add Test Index</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <form id="myForm" >
                        <div class="row">
                            <div class="col-sm-8">
                                <div class="form-group">
                                    <label>Name <span class="text-danger">*</span></label>
                                    <input class="form-control" id='inputName' name="name" type="text" >
                                    <span id='messageName'></span>
                                </div>
                            </div>
                            <div class="col-sm-4"></div>

                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Male Value Min. </label>
                                    <input class="form-control" id='maleMin' name="maleMin" type="number">
                                    <span id='messageMaleMin'></span>
                                </div>
                            </div>
                            <div class="col-sm-2"></div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Male Value Max. </label>
                                    <input class="form-control" id='maleMax' name="maleMax" type="number">
                                    <span id='messageMaleMax'></span>
                                </div>

                            </div>
                            <div class="col-sm-4"></div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Female Value Min. </label>
                                    <input class="form-control" id='femaleMin' name="femaleMin" type="number" >
                                    <span id='messageFemaleMin'></span>
                                </div>
                            </div>
                            <div class="col-sm-2"></div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Female Value Max. </label>
                                    <input class="form-control" id='femaleMax' name="femaleMax" type="number">
                                    <span id='messageFemaleMax'></span>
                                </div>
                            </div>
                            <div class="col-sm-4"></div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Child Min. </label>
                                    <input class="form-control" id='childMin' name="childMin" type="number">
                                    <span id='messageChildMin'></span>
                                </div>
                            </div>
                            <div class="col-sm-2"></div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Child Max. </label>
                                    <input class="form-control" id='childMax' name="childMax" type="number">
                                    <span id='messageChildMax'></span>
                                </div>
                            </div>
                            <div class="col-sm-4"></div>
                            <div class="col-sm-8">
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea style="resize:none" class="form-control" id='description' name="description"> </textarea>
                                    <span id='messageDes'></span>
                                </div>
                            </div>
                            <div class="col-sm-4"></div>
                        </div>

                        <div class="m-t-20 text-center">
                            <button id="createTestIndex" class="btn btn-primary submit-btn">Create Test Index</button>

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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script type="text/javascript">

//            $("#myForm").validate({
//                rules: {
//                    "name": {
//                        required: true
//                    },
//                    "maleMin": {
//                        required: true
//                    },
//                    "femaleMin": {
//                        required: true
//                    }
//                },
//                messages: {
//                    "name": {
//                        required: "Kh??ng ???????c ????? tr???ng"
//                    },
//                    "maleMin": {
//                        required: "Kh??ng ???????c ????? tr???ng"
//                    },
//                    "femaleMin": {
//                        required: "Kh??ng ???????c ????? tr???ng"
//                    }
//                },
//                errorPlacement: function (label, element) {
//                    label.addClass('mt-2 text-danger');
//                    label.insertAfter(element);
//                },
//                highlight: function (element, errorClass) {
//                    $(element).parent().addClass('has-danger');
//                    $(element).addClass('form-control-danger');
//                },
//                unhighlight: function (element) {
//                    $(element).css('background', '#ffffff');
//                }
//
//            });




// ======================================================Insert===============================================

            $(document).ready(function () {
                function uuidv4() {
                    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
                        return v.toString(16);
                    });
                }
                $("#inputName").click(function () {
                    $('#inputName').removeClass('error');
                    document.getElementById('messageName').innerHTML = '';
                });
                $("#description").click(function () {
                    $('#description').removeClass('error');
                    document.getElementById('messageDes').innerHTML = '';
                });
                $("#maleMin").click(function () {
                    $('#maleMin').removeClass('error');
                    document.getElementById('messageMaleMin').innerHTML = '';
                });
                $("#maleMax").click(function () {
                    $('#maleMax').removeClass('error');
                    document.getElementById('messageMaleMax').innerHTML = '';
                });
                $("#femaleMin").click(function () {
                    $('#femaleMin').removeClass('error');
                    document.getElementById('messageFemaleMin').innerHTML = '';
                });
                $("#femaleMax").click(function () {
                    $('#femaleMax').removeClass('error');
                    document.getElementById('messageFemaleMax').innerHTML = '';
                });
                $("#childMin").click(function () {
                    $('#childMin').removeClass('error');
                    document.getElementById('messageChildMin').innerHTML = '';
                });
                $("#childMax").click(function () {
                    $('#childMax').removeClass('error');
                    document.getElementById('messageChildMax').innerHTML = '';
                });
                $("#createTestIndex").click(function (event) {
                    event.preventDefault();
                    $('#inputName').removeClass('error');
                    document.getElementById('messageName').innerHTML = '';
                    $('#description').removeClass('error');
                    document.getElementById('messageDes').innerHTML = '';
                    $('#maleMin').removeClass('error');
                    document.getElementById('messageMaleMin').innerHTML = '';
                    $('#maleMax').removeClass('error');
                    document.getElementById('messageMaleMax').innerHTML = '';
                    $('#femaleMin').removeClass('error');
                    document.getElementById('messageFemaleMin').innerHTML = '';
                    $('#femaleMax').removeClass('error');
                    document.getElementById('messageFemaleMax').innerHTML = '';
                    $('#childMin').removeClass('error');
                    document.getElementById('messageChildMin').innerHTML = '';
                    $('#childMax').removeClass('error');
                    document.getElementById('messageChildMax').innerHTML = '';
                    var regexp = /^\d{1,3}(\.\d{1})?$/;
                    var name = $("input[name='name']").val(); //l???y gi?? tr??? trong input user
                    var description = $("textarea[name='description']").val();
                    var maleMin = $("input[name='maleMin']").val();
                    var maleMax = $("input[name='maleMax']").val();
                    var femaleMin = $("input[name='femaleMin']").val();
                    var femaleMax = $("input[name='femaleMax']").val();
                    var childMin = $("input[name='childMin']").val();
                    var childMax = $("input[name='childMax']").val();
                    var token = localStorage.getItem("key");
                    var count = 0;
                    console.log(regexp.test(maleMax));
                    var allTestIndex = JSON.parse(localStorage.getItem("allTestIndex"));
                    for (var i = 0; i < allTestIndex.length; i++) {
                        if (allTestIndex[i][0] === name) {
                            count = 1;
                        }
                    }
                    console.log(maleMin);
                    console.log(maleMax);
                    console.log(parseFloat(maleMax) > parseFloat(maleMin));
                    var testId = uuidv4();
                    if (name.length === 0) {
                        $('#inputName').addClass('error');
                        document.getElementById('messageName').style.color = 'red';
                        document.getElementById('messageName').innerHTML = 'Name is empty ???';
                        if (description.length > 255) {
                            $('#description').addClass('error');
                            document.getElementById('messageDes').style.color = 'red';
                            document.getElementById('messageDes').innerHTML = 'Descreption must be less than 255 in length ???';
                        }
                        if (!regexp.test(maleMin)) {
                            $('#maleMin').addClass('error');
                            document.getElementById('messageMaleMin').style.color = 'red';
                            document.getElementById('messageMaleMin').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(maleMax)) {
                            $('#maleMax').addClass('error');
                            document.getElementById('messageMaleMax').style.color = 'red';
                            document.getElementById('messageMaleMax').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(femaleMin)) {
                            $('#femaleMin').addClass('error');
                            document.getElementById('messageFemaleMin').style.color = 'red';
                            document.getElementById('messageFemaleMin').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(femaleMax)) {
                            $('#femaleMax').addClass('error');
                            document.getElementById('messageFemaleMax').style.color = 'red';
                            document.getElementById('messageFemaleMax').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(childMin)) {
                            $('#childMin').addClass('error');
                            document.getElementById('messageChildMin').style.color = 'red';
                            document.getElementById('messageChildMin').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(childMax)) {
                            $('#childMax').addClass('error');
                            document.getElementById('messageChildMax').style.color = 'red';
                            document.getElementById('messageChildMax').innerHTML = 'Value invalid ???';
                        }
                    } else if (count === 1) {
                        $('#inputName').addClass('error');
                        document.getElementById('messageName').style.color = 'red';
                        document.getElementById('messageName').innerHTML = 'Name already exists ???';
                        if (description.length > 255) {
                            $('#description').addClass('error');
                            document.getElementById('messageDes').style.color = 'red';
                            document.getElementById('messageDes').innerHTML = 'Descreption must be less than 255 in length ???';
                        }
                        if (!regexp.test(maleMin)) {
                            $('#maleMin').addClass('error');
                            document.getElementById('messageMaleMin').style.color = 'red';
                            document.getElementById('messageMaleMin').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(maleMax)) {
                            $('#maleMax').addClass('error');
                            document.getElementById('messageMaleMax').style.color = 'red';
                            document.getElementById('messageMaleMax').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(femaleMin)) {
                            $('#femaleMin').addClass('error');
                            document.getElementById('messageFemaleMin').style.color = 'red';
                            document.getElementById('messageFemaleMin').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(femaleMax)) {
                            $('#femaleMax').addClass('error');
                            document.getElementById('messageFemaleMax').style.color = 'red';
                            document.getElementById('messageFemaleMax').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(childMin)) {
                            $('#childMin').addClass('error');
                            document.getElementById('messageChildMin').style.color = 'red';
                            document.getElementById('messageChildMin').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(childMax)) {
                            $('#childMax').addClass('error');
                            document.getElementById('messageChildMax').style.color = 'red';
                            document.getElementById('messageChildMax').innerHTML = 'Value invalid ???';
                        }
                    } else if (description.length > 255) {
                        $('#description').addClass('error');
                        document.getElementById('messageDes').style.color = 'red';
                        document.getElementById('messageDes').innerHTML = 'Descreption must be less than 255 in length ???';

                        if (!regexp.test(maleMin)) {
                            $('#maleMin').addClass('error');
                            document.getElementById('messageMaleMin').style.color = 'red';
                            document.getElementById('messageMaleMin').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(maleMax)) {
                            $('#maleMax').addClass('error');
                            document.getElementById('messageMaleMax').style.color = 'red';
                            document.getElementById('messageMaleMax').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(femaleMin)) {
                            $('#femaleMin').addClass('error');
                            document.getElementById('messageFemaleMin').style.color = 'red';
                            document.getElementById('messageFemaleMin').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(femaleMax)) {
                            $('#femaleMax').addClass('error');
                            document.getElementById('messageFemaleMax').style.color = 'red';
                            document.getElementById('messageFemaleMax').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(childMin)) {
                            $('#childMin').addClass('error');
                            document.getElementById('messageChildMin').style.color = 'red';
                            document.getElementById('messageChildMin').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(childMax)) {
                            $('#childMax').addClass('error');
                            document.getElementById('messageChildMax').style.color = 'red';
                            document.getElementById('messageChildMax').innerHTML = 'Value invalid ???';
                        }
                    } else if (!regexp.test(maleMin)) {
                        $('#maleMin').addClass('error');
                        document.getElementById('messageMaleMin').style.color = 'red';
                        document.getElementById('messageMaleMin').innerHTML = 'Value invalid ???';

                        if (!regexp.test(maleMax)) {
                            $('#maleMax').addClass('error');
                            document.getElementById('messageMaleMax').style.color = 'red';
                            document.getElementById('messageMaleMax').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(femaleMin)) {
                            $('#femaleMin').addClass('error');
                            document.getElementById('messageFemaleMin').style.color = 'red';
                            document.getElementById('messageFemaleMin').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(femaleMax)) {
                            $('#femaleMax').addClass('error');
                            document.getElementById('messageFemaleMax').style.color = 'red';
                            document.getElementById('messageFemaleMax').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(childMin)) {
                            $('#childMin').addClass('error');
                            document.getElementById('messageChildMin').style.color = 'red';
                            document.getElementById('messageChildMin').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(childMax)) {
                            $('#childMax').addClass('error');
                            document.getElementById('messageChildMax').style.color = 'red';
                            document.getElementById('messageChildMax').innerHTML = 'Value invalid ???';
                        }
                    } else if (!regexp.test(maleMax)) {
                        $('#maleMax').addClass('error');
                        document.getElementById('messageMaleMax').style.color = 'red';
                        document.getElementById('messageMaleMax').innerHTML = 'Value invalid ???';

                        if (!regexp.test(femaleMin)) {
                            $('#femaleMin').addClass('error');
                            document.getElementById('messageFemaleMin').style.color = 'red';
                            document.getElementById('messageFemaleMin').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(femaleMax)) {
                            $('#femaleMax').addClass('error');
                            document.getElementById('messageFemaleMax').style.color = 'red';
                            document.getElementById('messageFemaleMax').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(childMin)) {
                            $('#childMin').addClass('error');
                            document.getElementById('messageChildMin').style.color = 'red';
                            document.getElementById('messageChildMin').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(childMax)) {
                            $('#childMax').addClass('error');
                            document.getElementById('messageChildMax').style.color = 'red';
                            document.getElementById('messageChildMax').innerHTML = 'Value invalid ???';
                        }
                    } else if (!regexp.test(femaleMin)) {
                        $('#femaleMin').addClass('error');
                        document.getElementById('messageFemaleMin').style.color = 'red';
                        document.getElementById('messageFemaleMin').innerHTML = 'Value invalid ???';

                        if (!regexp.test(femaleMax)) {
                            $('#femaleMax').addClass('error');
                            document.getElementById('messageFemaleMax').style.color = 'red';
                            document.getElementById('messageFemaleMax').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(childMin)) {
                            $('#childMin').addClass('error');
                            document.getElementById('messageChildMin').style.color = 'red';
                            document.getElementById('messageChildMin').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(childMax)) {
                            $('#childMax').addClass('error');
                            document.getElementById('messageChildMax').style.color = 'red';
                            document.getElementById('messageChildMax').innerHTML = 'Value invalid ???';
                        }
                    } else if (!regexp.test(femaleMax)) {
                        $('#femaleMax').addClass('error');
                        document.getElementById('messageFemaleMax').style.color = 'red';
                        document.getElementById('messageFemaleMax').innerHTML = 'Value invalid ???';

                        if (!regexp.test(childMin)) {
                            $('#childMin').addClass('error');
                            document.getElementById('messageChildMin').style.color = 'red';
                            document.getElementById('messageChildMin').innerHTML = 'Value invalid ???';
                        }
                        if (!regexp.test(childMax)) {
                            $('#childMax').addClass('error');
                            document.getElementById('messageChildMax').style.color = 'red';
                            document.getElementById('messageChildMax').innerHTML = 'Value invalid ???';
                        }
                    } else if (!regexp.test(childMin)) {
                        $('#childMin').addClass('error');
                        document.getElementById('messageChildMin').style.color = 'red';
                        document.getElementById('messageChildMin').innerHTML = 'Value invalid ???';

                        if (!regexp.test(childMax)) {
                            $('#childMax').addClass('error');
                            document.getElementById('messageChildMax').style.color = 'red';
                            document.getElementById('messageChildMax').innerHTML = 'Value invalid ???';
                        }
                    } else if (!regexp.test(childMax)) {
                        $('#childMax').addClass('error');
                        document.getElementById('messageChildMax').style.color = 'red';
                        document.getElementById('messageChildMax').innerHTML = 'Value invalid ???';
                    } else if (parseFloat(maleMax) < parseFloat(maleMin)) {
                        $('#maleMax').addClass('error');
                        document.getElementById('messageMaleMax').style.color = 'red';
                        document.getElementById('messageMaleMax').innerHTML = 'Value max less than value min ???';
                    } else if (femaleMax < femaleMin) {
                        $('#femaleMax').addClass('error');
                        document.getElementById('messageFemaleMax').style.color = 'red';
                        document.getElementById('messageFemaleMax').innerHTML = 'Value max less than value min ???';
                    } else if (childMax < childMin) {
                        $('#childMax').addClass('error');
                        document.getElementById('messageChildMax').style.color = 'red';
                        document.getElementById('messageChildMax').innerHTML = 'Value max less than value min ???';
                    } else {
                        toastr["success"]("Create Successfully!", "Success", {"progressBar": true, "closeButton": true, "positionClass": "toast-top-full-width"});
                        $.ajax({
                            type: "POST",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            headers: {
                                Authorization: 'Bearer ' + token},
                            data: JSON.stringify({
                                "id": testId,
                                "name": name,
                                "description": description,
                                "status": "Active"

                            }),
                            url: "https://bt-application.herokuapp.com/api/test/insert",
                            complete: function (jqXHR) {
                                console.log(jqXHR.status);
                                if (jqXHR.status === 201) {
                                    if (maleMax !== null || maleMin !== null) {
                                        $.ajax({
                                            type: "POST",
                                            dataType: "json",
                                            contentType: "application/json; charset=utf-8",
                                            headers: {
                                                Authorization: 'Bearer ' + token},
                                            data: JSON.stringify({
                                                "id": uuidv4(),
                                                "indexesName": name,
                                                "description": description,
                                                "indexValueMax": maleMax,
                                                "indexValueMin": maleMin,
                                                "type": "Male",
                                                "testId": {
                                                    "id": testId
                                                }
                                            }),
                                            url: "https://bt-application.herokuapp.com/api/testresultsample/insert",
                                            complete: function (jqXHR) {
                                                if (jqXHR.status === 201) {
                                                    if (femaleMin !== null || femaleMax !== null) {
                                                        $.ajax({
                                                            type: "POST",
                                                            dataType: "json",
                                                            contentType: "application/json; charset=utf-8",
                                                            headers: {
                                                                Authorization: 'Bearer ' + token},
                                                            data: JSON.stringify({
                                                                "id": uuidv4(),
                                                                "indexesName": name,
                                                                "description": description,
                                                                "indexValueMax": femaleMax,
                                                                "indexValueMin": femaleMin,
                                                                "type": "Female",
                                                                "testId": {
                                                                    "id": testId
                                                                }
                                                            }),
                                                            url: "https://bt-application.herokuapp.com/api/testresultsample/insert",
                                                            complete: function (jqXHR) {
                                                                if (jqXHR.status === 201) {
                                                                    if (childMin !== null || childMax !== null) {
                                                                        $.ajax({
                                                                            type: "POST",
                                                                            dataType: "json",
                                                                            contentType: "application/json; charset=utf-8",
                                                                            headers: {
                                                                                Authorization: 'Bearer ' + token},
                                                                            data: JSON.stringify({
                                                                                "id": uuidv4(),
                                                                                "indexesName": name,
                                                                                "description": description,
                                                                                "indexValueMax": childMax,
                                                                                "indexValueMin": childMin,
                                                                                "type": "Children",
                                                                                "testId": {
                                                                                    "id": testId
                                                                                }
                                                                            }),
                                                                            url: "https://bt-application.herokuapp.com/api/testresultsample/insert",
                                                                            complete: function (jqXHR) {
                                                                                if (jqXHR.status === 201) {
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
                    }
                });
            });

        </script>
    </body>


    <!-- add-patient24:07-->
</html>

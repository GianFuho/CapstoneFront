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
            div.dropdown.dropdown-action{
                float: right;
            }
            #indexTable {
                width: 100% !important;
            }
            #description{
                display: none;    
            }

        </style>
    </head>

    <%@include file="components/recepHeader.html" %>
    <%@include file="components/recepSidebar.html" %>

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-sm-4 col-3">
                    <h4 class="page-title">All Test Indexes</h4>
                </div>
                <!--                <div class="col-sm-8 col-9 text-right m-b-20">
                                    <a href="add-testIndex.jsp" class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Add Test Index</a>
                                </div>-->
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">

                        <table id="indexTable" class="table table-border table-striped custom-table datatable mb-0">

                            <thead>
                                <tr>
                                    <th style="width: 20%">Name</th>
                                    <th id='description' style="width: 30%">Description</th>
                                    <th style="width: 20%">Male Value</th>
                                    <th style="width: 20%">FeMale Value</th>
                                    <th style="width: 10%">Children Value</th>
                                    <!--<th style="width: 5%" class="text-right">Action</th>-->
                                </tr>
                            </thead>

                            <tbody>

                                <tr> 

                                    <td id="name"></td>
                                    <td id="description"></td>
                                    <td id="maleVal"></td>
                                    <td id="femaleVal"></td>
                                    <td id="childVal"></td>
                                    <!--                                    <td  class="text-right">
                                                                            <div class="dropdown dropdown-action">
                                                                                <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                                                                <div id="d" class="dropdown-menu dropdown-menu-right">
                                                                                    <a class="dropdown-item" href="edit-testIndex.jsp"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_patient"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                                                                </div>
                                                                            </div>
                                                                        </td>-->
                                </tr>



                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/recepFooter.html" %>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap4.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script type="text/javascript">

            window.onload = function () {
                var token = localStorage.getItem("key");
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "https://bt-application.herokuapp.com/api/testresultsample/getall",
                    success: function (data) {
                        var valueArray = [];
                        var valueArrayTotal = [];
                        var valueId = [];
                        var valueIdTotal = [];
                        var idData = "";
                        for (var i = 0; i < data.length; i++) {
                            if (data[i] !== undefined) {
                                valueArray.push(data[i].testId.name);
                                valueArray.push(data[i].testId.description);
                                valueId.push(data[i].testId.name);
                                valueId.push(data[i].testId.id);
                                if (data[i].type === 'Male') {
                                    valueArray.splice(2, 0, data[i].indexValueMin + " - " + data[i].indexValueMax);
                                    valueId.splice(2, 0, data[i].id);

                                }
                                if (data[i].type === 'Female') {
                                    valueArray.splice(3, 0, data[i].indexValueMin + " - " + data[i].indexValueMax);
                                    valueId.splice(3, 0, data[i].id);

                                }
                                if (data[i].type === 'Children') {
                                    valueArray.splice(4, 0, data[i].indexValueMin + " - " + data[i].indexValueMax);
                                    valueId.splice(4, 0, data[i].id);

                                }
                                idData = data[i].testId.id;
                                delete data[i];
                                for (var k = 0; k < data.length; k++) {
                                    if (data[k] !== undefined) {
                                        if (data[k].testId.id === idData) {
                                            if (data[k].type === 'Male') {
                                                valueArray.splice(2, 0, data[k].indexValueMin + " - " + data[k].indexValueMax);
                                                valueId.splice(2, 0, data[k].id);

                                            }
                                            if (data[k].type === 'Female') {
                                                valueArray.splice(3, 0, data[k].indexValueMin + " - " + data[k].indexValueMax);
                                                valueId.splice(3, 0, data[k].id);

                                            }
                                            if (data[k].type === 'Children') {
                                                valueArray.splice(4, 0, data[k].indexValueMin + " - " + data[k].indexValueMax);
                                                valueId.splice(4, 0, data[k].id);

                                            }
                                            delete data[k];

                                        }

                                    }
                                }
                                if (valueArray.length === 5) {
                                    valueArrayTotal.push(valueArray);
                                    valueArray = [];
                                } else if (valueArray.length === 4) {
                                    valueArrayTotal.push(valueArray);
                                    valueArray = [];
                                }
                                if (valueId.length === 5) {
                                    valueIdTotal.push(valueId);
                                    valueId = [];
                                }

                            }
                        }
                        var a = JSON.stringify(data);
                        var b = JSON.parse(a);
                        $('#indexTable tbody').on('click', 'td', function ()
                        {
                            var tr = $(this).closest("tr");
                            var rowindex = tr.index();
                            table = document.getElementById("indexTable");
                            tr = table.getElementsByTagName("tr");
                            td = tr[rowindex + 1].getElementsByTagName("td")[0];
                            txtValue = td.textContent;

                            $.each(valueArrayTotal, function (index, value) {
                                console.log(value[0]);
                                if (value[0] === txtValue) {
                                    localStorage.setItem("dataTest", value);
                                }
                            });
                            $.each(valueIdTotal, function (index, value) {
                                console.log(value[0]);
                                if (value[0] === txtValue) {
                                    localStorage.setItem("dataTestId", value);
                                }
                            });
                        }
                        );
//                                   


//
                        $('#indexTable').DataTable({
                            data: valueArrayTotal,
                            columns: [
                                {data: '0'},
                                {data: '1'},
                                {data: '2'},
                                {data: '3'},
                                {data: '4'},
//                                {
//                                    defaultContent: '<td id="actionIcon" class="text-right"><div class ="dropdown dropdown-action"><a href = "#" class="action-icon dropdown-toggle" data-toggle = "dropdown" aria-expanded = "false"> <i class = "fa fa-ellipsis-v" > </i></a><div id = "d" class = "dropdown-menu dropdown-menu-right" ><a class = "dropdown-item" href = "edit-testIndex.jsp"> <i class = "fa fa-pencil m-r-5" > </i> Edit</a>  <a class = "dropdown-item" href = "#" data - toggle = "modal" data - target = "#delete_patient"> <i class = "fa fa-trash-o m-r-5" > </i> Delete</a > </div></div></td>'
//
//                                }
                            ],
                            "bDestroy": true,
                            "bFilter": true,
                            language: {
                                search: 'Search:',
                                searchPlaceholder: ""
                            }, "createdRow": function (row, data, dataIndex) {
                                $('td:eq(1)', row).css('display', 'none');
                            }
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(' Error in processing! ' + textStatus);
                    }

                })
            };

        </script>


    </body>


    <!-- patients23:19-->
</html>
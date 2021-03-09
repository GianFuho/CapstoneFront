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

            .sidebar-menu li#aViewGroupUser a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }

            div.dropdown.dropdown-action{
                float: right;
            }

            #buttonOutGroup {
                margin-left: 50%;
                border-radius: 5px;
                height: 32px;
                width: 50%;
                border: 0.1px gainsboro solid;
            }
        </style>

    </head>
    <%@include file="components/userHeader.html" %>
    <%@include file="components/userSidebar.html" %>
    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-sm-4 col-3">
                    <h4 class="page-title">Member List</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">

                        <table id="groupMemberTable" class="table table-border table-striped custom-table datatable mb-0">

                            <thead>
                                <tr>

                                    <th style="width: 5%">Avatar</th>
                                    <th style="width: 10%">Name</th>
                                    <th style="width: 10%">Phone</th>
                                    <th style="width: 30%">Address</th>
                                    <th style="width: 5%">Leader</th>
                                    <th style="width: 10%" class="text-right">Action</th>
                                </tr>
                            </thead>

                            <tbody>

                                <tr>
                                    <td id="avatar"><img width="40" height="40" src="assets/img/user-02.jpg" class="rounded-circle m-r-5"></td>
                                    <td id="name"></td>
                                    <td id="phoneNum"></td>
                                    <td id="address"></td>
                                    <td id="leader"></td>
                                    <td  class="text-right">
                                        <div class="dropdown dropdown-action">
                                            <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                            <div id="d" class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="view-medical-information.jsp"><i class="fa fa-pencil m-r-5"></i>View</a>
                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_patient"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <%@include file="components/userFooter.html" %>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap4.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script type="text/javascript">
            window.onload = function () {
                var token = localStorage.getItem("key");
                var familyGroupId = localStorage.getItem("familyGroupId");
                var userId = localStorage.getItem("userId");
                var phone = localStorage.getItem("phone");
                var array = [];
                var arrayTotal = [];
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "https://bt-application.herokuapp.com/api/userfamilygroup/findByGroupId/" + familyGroupId,
                    success: function (data) {
                        for (var i = 0; i < data.length; i++) {
                            array.push('<a class="avatar"><img alt="" src="' + data[i].userId.image + '"></a>');
                            array.push(data[i].userId.fullname);
                            array.push(data[i].userId.phone);
                            array.push(data[i].userId.address);
                            array.push(data[i].groupRole);
                            arrayTotal.push(array);
                            array = [];
                        }
                         $('#groupMemberTable tbody').on('click', 'td', function ()
                        {
                            var tr = $(this).closest("tr");
                            var rowindex = tr.index();
                            table = document.getElementById("groupMemberTable");
                            tr = table.getElementsByTagName("tr");
                            td = tr[rowindex + 1].getElementsByTagName("td")[2];
                            txtValue = td.textContent;
                            console.log(txtValue);
                            $.each(data, function (index, value) {
                                if (value.userId.phone === txtValue) {
                                    localStorage.setItem("dataUser", JSON.stringify(value.userId));
                                }
                            });

                        }
                        );
                        $('#groupMemberTable').DataTable({
                            data: arrayTotal,
                            columns: [
                                {data: '0'},
                                {data: '1'},
                                {data: '2'},
                                {data: '3'},
                                {data: '4'},
                                {
                                    "render": function (data, type, row) {
                                        if (row[2] === phone) {
                                            return '<input id="buttonOutGroup" type="submit" value="Leave"></input>';
                                        } else {
                                            return '<td id="actionIcon" class="text-right"><div class ="dropdown dropdown-action"><a class="action-icon dropdown-toggle" data-toggle = "dropdown" aria-expanded = "false"> <i class = "fa fa-ellipsis-v" > </i></a><div id = "d" class = "dropdown-menu dropdown-menu-right" ><a href="view-medical-information.jsp" class = "dropdown-item"> <i class = "fa fa-pencil m-r-5" > </i> View</a>  <a class = "dropdown-item" href = "#" data - toggle = "modal"> <i class = "fa fa-trash-o m-r-5" > </i> Delete</a > </div></div></td>';
                                        }

                                    }
                                }
                            ],
                            "bDestroy": true,
                            "bFilter": true,
                            language: {
                                search: 'Search:',
                                searchPlaceholder: ""
                            },
                            "createdRow": function (row, data, dataIndex) {
                                if (data.status === "Inactive") {
                                    $('td', row).css('color', '#b5b5b5');
                                    $('td', row).css('font-style', 'italic');
                                }
                                if (data.status === "Active") {
                                    $('td:eq(5)', row).css('color', '#2a9c31');
                                    $('td:eq(5)', row).css('font-weight', 'bolder');
                                }
                            }
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(' Error in processing! ' + textStatus);
                    }

                });
            };



        </script>
    </body>

</html>
<!DOCTYPE html>
<html>
<head>
    <title>Report</title>
    <meta name="layout" content="main"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css"/>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css" rel="stylesheet"
          crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"/>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
</head>
<body>
<div class="container" style="margin-top:80px">

    <h1 class="pb-2 border-bottom row">
        <span class="col-sm-6 pb-4">Report</span>
        <sec:ifAnyGranted roles="ROLE_EDIT">
            <span class="col-sm-6 text-sm-right pb-4">
                <a href="/department/create" class="btn btn-primary btn-outline-primary d-block d-sm-inline-block">Create Department</a>
                <a href="/employee/create" class="btn btn-primary btn-outline-primary d-block d-sm-inline-block">Create Employee</a>
            </span>
        </sec:ifAnyGranted>
    </h1>

    <g:if test="${flash.message}">
    <div class="alert alert-info">
        <h3>${flash.message}</h3>
    </div>
    </g:if>

    <div class="mt-5">
        <table id="employeeTable" class="table table-striped table-bordered" style="width:100%">
            <thead>
            <tr>
                <th>Name</th>
                <th>Department</th>
            </tr>
            </thead>
        </table>
    </div>

</div>
<script>
  let url = '/employee/data_for_datatable';

  $(document).ready(function () {
  $('#employeeTable').DataTable({
    "ajax": url,
    "processing": true,
    "serverSide": true,
    "columns": [
      {
        "data": "name",
        "render": function (data, type, row, meta) {
          return '<a href="/employee/edit/' + row.id + '">' + data + '</a>';
        }
      },
      {
        "data": "department.title",
        "render": function (data, type, row, meta) {
          return '<a href="/department/edit/' + row.department?.id + '">' + data + '</a>';
        }
      },
    ]
  });
  });
</script>
</body>
</html>

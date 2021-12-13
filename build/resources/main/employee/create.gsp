<%@ page import="uvic.employee.roster.Department" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Employee</title>
    <meta name="layout" content="main"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css" rel="stylesheet"
          crossorigin="anonymous">

</head>
<body>
<div class="container" style="margin-top:80px">
    <h1 class="pb-2 border-bottom row">
        <span class="col-sm pb-4">New Employee Details</span>
    </h1>
    <div class="mt-5 card card-body bg-light">
        <form action="/employee/save" class="form" method="post">

            <g:hasErrors bean="${this.employee}">
                <div class="alert alert-danger">
                <ul>
                    <g:eachError bean="${this.employee}" var="error">
                        <li><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
                </div>
            </g:hasErrors>

            <div class="row">
                <div class="form-group col-12">
                    <label>Name</label>
                    <input class="form-control" name="name" required maxlength="100" value="${employee?.name}"/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-12">
                    <label>Tile</label>
                    <input class="form-control" name="title" required maxlength="100" value="${employee?.title}"/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-12">
                    <label>Email Address</label>
                    <input class="form-control" name="email" required maxlength="100" value="${employee?.email}"/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-12">
                    <label>Phone Number</label>
                    <input class="form-control" name="phone" maxlength="15" value="${employee?.phone}"/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-12">
                    <label>Department</label>
                    <g:select class="form-control" name="department" from="${Department?.list()}" optionKey="id" optionValue="title" required="" value="${employee?.department?.id}"
                    />
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <button type="submit" class="btn btn-success btn-block">Create Employee</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>

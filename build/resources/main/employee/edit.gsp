<%@ page import="uvic.employee.roster.Department" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Edit Employee</title>
    <meta name="layout" content="main"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css" rel="stylesheet"
          crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
<div class="container" style="margin-top:80px">
    <h1 class="pb-2 border-bottom row">
        <span class="col-sm-6 pb-4">Employee</span>
        <sec:ifAnyGranted roles="ROLE_EDIT">
            <span class="col-sm-6 text-sm-right pb-4">
                <form action="/employee/delete" method="post" onsubmit="return confirm('Are you sure?');">
                    <input type="hidden" name="id" value="${employee?.id}"/>
                    <button class="btn btn-danger btn-outline-danger d-block d-sm-inline-block">Delete Employee</button>
                </form>
            </span>
        </sec:ifAnyGranted>
    </h1>
    <div class="mt-5 card card-body bg-light">
        <form action="/employee/update" class="form" method="post">

            <g:hasErrors bean="${employee}">
                <div class="alert alert-danger">
                    <ul>
                        <g:eachError bean="${employee}" var="error">
                            <li><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </div>
            </g:hasErrors>

            <input name="id" type="hidden" value="${employee?.id}"/>

            <div class="row">
                <div class="form-group col-12">
                    <label>Name</label>
                    <input class="form-control" name="name" required maxlength="100" value="${employee?.name}" ${sec.ifNotGranted(roles:'ROLE_EDIT'){ 'readonly="readonly"' }}/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-12">
                    <label>Tile</label>
                    <input class="form-control" name="title" required maxlength="100" value="${employee?.title}" ${sec.ifNotGranted(roles:'ROLE_EDIT'){ 'readonly="readonly"' }}/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-12">
                    <label>Email Address</label>
                    <input class="form-control" name="email" required maxlength="100" value="${employee?.email}" ${sec.ifNotGranted(roles:'ROLE_EDIT'){ 'readonly="readonly"' }}/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-12">
                    <label>Phone Number</label>
                    <input class="form-control" name="phone" maxlength="15" value="${employee?.phone}" ${sec.ifNotGranted(roles:'ROLE_EDIT'){ 'readonly="readonly"' }}/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-12">
                    <label>Department</label>
                    <g:select class="form-control" name="department" from="${Department?.list()}" optionKey="id" optionValue="title" required="" value="${employee?.department?.id}"
                    disabled="${sec.ifNotGranted(roles:'ROLE_EDIT')?true:false}"
                    />
                </div>
            </div>
            <sec:ifAnyGranted roles="ROLE_EDIT">
                <div class="row">
                    <div class="col">
                        <button type="submit" class="btn btn-success btn-block">Save Changes</button>
                    </div>
                </div>
            </sec:ifAnyGranted>
        </form>
    </div>
</div>
</body>
</html>

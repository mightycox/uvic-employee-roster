<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Edit Department</title>
    <meta name="layout" content="main"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css" rel="stylesheet"
          crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
<div class="container" style="margin-top:80px">
    <h1 class="pb-2 border-bottom row">
        <span class="col-sm-6 pb-4">Department</span>
        <sec:ifAnyGranted roles="ROLE_EDIT">
            <span class="col-sm-6 text-sm-right pb-4">
                <form action="/department/delete/${department?.id}" method="post" onsubmit="return confirm('Are you sure?');">
                    <input type="hidden" name="id" value="${department?.id}"/>
                    <button class="btn btn-danger btn-outline-danger d-block d-sm-inline-block">Delete Department</button>
                </form>
            </span>
        </sec:ifAnyGranted>
    </h1>
    <div class="mt-5 card card-body bg-light">
        <form action="/department/update" class="form" method="post">

            <g:hasErrors bean="${department}">
                <div class="alert alert-danger">
                    <ul>
                        <g:eachError bean="${department}" var="error">
                            <li><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </div>
            </g:hasErrors>

            <input name="id" type="hidden" value="${department?.id}"/>

            <div class="row">
                <div class="form-group col-12">
                    <label>Code</label>
                    <input class="form-control" name="code" required maxlength="100" value="${department?.code}" ${sec.ifNotGranted(roles:'ROLE_EDIT'){ 'readonly="readonly"' }}/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-12">
                    <label>Tile</label>
                    <input class="form-control" name="title" required maxlength="100" value="${department?.title}" ${sec.ifNotGranted(roles:'ROLE_EDIT'){ 'readonly="readonly"' }}/>
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

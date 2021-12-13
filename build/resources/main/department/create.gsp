<!DOCTYPE html>
<html>
<head>
    <title>Edit Department</title>
    <meta name="layout" content="main"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css" rel="stylesheet"
          crossorigin="anonymous">
</head>
<body>
<div class="container" style="margin-top:80px">
    <h1 class="pb-2 border-bottom row">
        <span class="col-sm pb-4">New Department Details</span>
    </h1>
    <div class="mt-5 card card-body bg-light">
        <form action="/department/save" class="form" method="post">

            <g:hasErrors bean="${this.department}">
                <div class="alert alert-danger">
                    <ul>
                        <g:eachError bean="${this.department}" var="error">
                            <li><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </div>
            </g:hasErrors>

            <div class="row">
                <div class="form-group col-12">
                    <label>Code</label>
                    <input class="form-control" name="code" required maxlength="4" value="${department?.code}"/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-12">
                    <label>Tile</label>
                    <input class="form-control" name="title" required maxlength="100" value="${department?.title}"/>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <button type="submit" class="btn btn-success btn-block">Create Department</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>

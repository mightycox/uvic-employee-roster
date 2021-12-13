package uvic.employee.roster

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/employee/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}

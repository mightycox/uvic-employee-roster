package uvic.employee.roster

import grails.converters.JSON
import grails.validation.ValidationException

class DepartmentController {

    DepartmentService departmentService

    def index() { }

    def create() {
        respond new Department(params)
    }

    def save(Department departmentInstance) {
        try {
            departmentService.save(departmentInstance)
        } catch (ValidationException e) {
            respond departmentInstance, view:'create'
            return
        }

        flash.message = "Department created successfully"

        redirect(controller: 'employee', action: 'index')

    }

    def edit(Long id) {
        respond departmentService.get(id)
    }

    def update(Department department) {

        try {
            departmentService.save(department)
        } catch (ValidationException e) {
            respond department.errors, view:'edit'
            return
        }

        flash.message = "Department updated successfully!"

        redirect(controller: 'employee', action: 'index')
    }

    def delete(Long id) {
        try {
            departmentService.delete(id)

            flash.message = "Department Deleted"
        } catch (Exception ex) {
            flash.message = "Could not delete department"
        }

        redirect(controller: 'employee', action: 'index')
    }

    def getAllDepartmentCodes() {
        def codes = departmentService.findAll()
        render codes as JSON
    }
}

package uvic.employee.roster

import grails.converters.JSON
import grails.gorm.PagedResultList
import grails.validation.ValidationException

class EmployeeController {

    EmployeeService employeeService

    def index() { }

    def data_for_datatable() {
        int draw = params.int("draw")
        int length = params.int("length")
        int start = params.int("start")

        String dataTableOrderColumnIdx = params["order[0][column]"]
        String dataTableOrderColumnName = "columns[" + dataTableOrderColumnIdx + "][data]"

        String sortName = params[dataTableOrderColumnName] ?: "id"
        String sortDir = params["order[0][dir]"] ?: "asc"

        String queryString = params["search[value]"]

        PagedResultList criteriaResult = Employee.createCriteria().list([max: length, offset:start]) {
            readOnly true
            or {
                ilike('name', '%' + queryString + '%')
            }
            order sortName, sortDir
        }

        Map dataTableResults = [
            draw: draw,
            recordsTotal: criteriaResult.totalCount,
            recordsFiltered: criteriaResult.totalCount,
            data: criteriaResult
        ]
        JSON.use("deep") {
            render dataTableResults as JSON
        }
    }

    def create() {
        respond new Employee(params)
    }

    def save(Employee employeeInstance) {
        try {
            employeeService.save(employeeInstance)
        } catch (ValidationException e) {
            respond employeeInstance, view:'create'
            return
        }

        flash.message = "Employee created successfully"

        redirect(action: "index")

    }

    def edit(Long id) {
        respond employeeService.get(id)
    }

    def update(Employee employee) {

        try {
            employeeService.save(employee)
        } catch (ValidationException e) {
            respond employee.errors, view:'edit'
            return
        }

        flash.message = "Employee updated successfully!"

        redirect(action: "index")
    }

    def delete(Long id) {
        try {
            employeeService.delete(id)

            flash.message = "Employee Deleted"
        } catch (Exception ex) {
            flash.message = "Could not delete employee"
        }

        redirect action:'index'
    }
}

package uvic.employee.roster

import grails.gorm.services.Service

@Service(Department)
interface DepartmentService {

    Department get(Serializable id)

    Collection<Department> findAll()

    void delete(Serializable id)

    Department save(Department customer)
}

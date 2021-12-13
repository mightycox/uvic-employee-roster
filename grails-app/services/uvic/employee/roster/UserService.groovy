package uvic.employee.roster

import grails.gorm.services.Service

@Service(User)
interface UserService {

    User save(String username, String password)

    User findByUsername(String username)
}

package uvic.employee.roster

import grails.gorm.services.Service

@Service(SecurityRole)
interface SecurityRoleService {

    SecurityRole save(String authority)

    SecurityRole findByAuthority(String authority)
}

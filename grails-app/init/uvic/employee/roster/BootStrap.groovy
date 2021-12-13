package uvic.employee.roster

import org.h2.tools.Server

class BootStrap {

    final String[] args = [
            "-tcpPort", "8092",
            "-tcpAllowOthers"]

    Server server
    UserService userService
    SecurityRoleService securityRoleService
    UserSecurityRoleService userSecurityRoleService

    def init = { servletContext ->
        List<String> authorities = ['ROLE_READ', 'ROLE_EDIT']
        authorities.each { String authority ->
            if ( !securityRoleService.findByAuthority(authority) ) {
                securityRoleService.save(authority)
            }
        }
        if ( !userService.findByUsername('readUser') ) {
            User u = userService.save('readUser', 'password')
            userSecurityRoleService.save(u, securityRoleService.findByAuthority('ROLE_READ'))
        }

        if ( !userService.findByUsername('editUser') ) {
            User u = userService.save('editUser', 'password')
            userSecurityRoleService.save(u, securityRoleService.findByAuthority('ROLE_EDIT'))
        }
        server = Server.createTcpServer(args).start()
    }

    def destroy = {
        server.stop()
    }
}

grails {
    plugin {
        springsecurity {
            rest {
                token {
                    storage {
                        jwt {
                            secret = 'pleaseChangeThisSecretForANewOne'
                        }
                    }
                }
            }
            securityConfigType = "InterceptUrlMap"
            filterChain {
                chainMap = [
                        [pattern: '/api/**',filters: 'JOINED_FILTERS,-anonymousAuthenticationFilter,-exceptionTranslationFilter,-authenticationProcessingFilter,-securityContextPersistenceFilter,-rememberMeAuthenticationFilter'],
                        [pattern: '/**', filters: 'JOINED_FILTERS,-restTokenValidationFilter,-restExceptionTranslationFilter']
                ]
            }
            userLookup {
                userDomainClassName = 'uvic.employee.roster.User'
                authorityJoinClassName = 'uvic.employee.roster.UserSecurityRole'
            }
            authority {
                className = 'uvic.employee.roster.SecurityRole'
            }
            interceptUrlMap = [
                    [pattern: '/',                      access: ['ROLE_READ', 'ROLE_EDIT']],
                    [pattern: '/error',                 access: ['permitAll']],
                    [pattern: '/index',                 access: ['permitAll']],
                    [pattern: '/index.gsp',             access: ['permitAll']],
                    [pattern: '/shutdown',              access: ['permitAll']],
                    [pattern: '/assets/**',             access: ['permitAll']],
                    [pattern: '/**/js/**',              access: ['permitAll']],
                    [pattern: '/**/css/**',             access: ['permitAll']],
                    [pattern: '/**/images/**',          access: ['permitAll']],
                    [pattern: '/**/favicon.ico',        access: ['permitAll']],
                    [pattern: '/login/**',              access: ['permitAll']],
                    [pattern: '/logout',                access: ['permitAll']],
                    [pattern: '/logout/**',             access: ['permitAll']],
                    [pattern: '/employee',          access: ['ROLE_READ', 'ROLE_EDIT']],
                    [pattern: '/employee/index',    access: ['ROLE_READ', 'ROLE_EDIT']],
                    [pattern: '/employee/create',   access: ['ROLE_EDIT']],
                    [pattern: '/employee/save',     access: ['ROLE_EDIT']],
                    [pattern: '/employee/update',   access: ['ROLE_EDIT']],
                    [pattern: '/employee/delete/*', access: ['ROLE_EDIT']],
                    [pattern: '/employee/edit/*',   access: ['ROLE_READ', 'ROLE_EDIT']],
                    [pattern: '/employee/show/*',   access: ['ROLE_READ', 'ROLE_EDIT']],
                    [pattern: '/department',          access: ['ROLE_READ', 'ROLE_EDIT']],
                    [pattern: '/department/index',    access: ['ROLE_READ', 'ROLE_EDIT']],
                    [pattern: '/department/create',   access: ['ROLE_EDIT']],
                    [pattern: '/department/save',     access: ['ROLE_EDIT']],
                    [pattern: '/department/update',   access: ['ROLE_EDIT']],
                    [pattern: '/department/delete/*', access: ['ROLE_EDIT']],
                    [pattern: '/department/edit/*',   access: ['ROLE_READ', 'ROLE_EDIT']],
                    [pattern: '/department/show/*',   access: ['ROLE_READ', 'ROLE_EDIT']],
                    [pattern: '/api/login',             access: ['ROLE_ANONYMOUS']],
                    [pattern: '/oauth/access_token',    access: ['ROLE_ANONYMOUS']],
                    [pattern: '/employee',     access: ['ROLE_READ', 'ROLE_EDIT'], httpMethod: 'GET'],
                    [pattern: '/employee/*',   access: ['ROLE_READ', 'ROLE_EDIT'], httpMethod: 'GET'],
                    [pattern: '/employee/*',   access: ['ROLE_EDIT'], httpMethod: 'DELETE'],
                    [pattern: '/employee',     access: ['ROLE_EDIT'], httpMethod: 'POST'],
                    [pattern: '/employee/*',   access: ['ROLE_EDIT'], httpMethod: 'PUT'],
                    [pattern: '/department',     access: ['ROLE_READ', 'ROLE_EDIT'], httpMethod: 'GET'],
                    [pattern: '/department/*',   access: ['ROLE_READ', 'ROLE_EDIT'], httpMethod: 'GET'],
                    [pattern: '/department/*',   access: ['ROLE_EDIT'], httpMethod: 'DELETE'],
                    [pattern: '/department',     access: ['ROLE_EDIT'], httpMethod: 'POST'],
                    [pattern: '/department/*',   access: ['ROLE_EDIT'], httpMethod: 'PUT']
            ]
        }
    }
}

package uvic.employee.roster

class Employee {

    String name
    String title
    String phone
    String email
    Department department

    static belongsTo = [department: Department]

    static constraints = {
        name blank: false
        title blank: false
        email blank: false
        name maxSize: 100
        title maxSize: 100
        phone maxSize: 15
        email maxSize: 100
    }
}

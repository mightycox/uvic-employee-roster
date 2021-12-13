package uvic.employee.roster

class Department {

    String code;
    String title;

    static hasMany = [employee: Employee]

    static constraints = {
        code blank: false
        title blank: false
        code maxSize: 4
        title maxSize: 100
        code unique: true
        title unique: true
    }
}

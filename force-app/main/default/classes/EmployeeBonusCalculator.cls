public class EmployeeBonusCalculator {
    public static integer bonusCalculator(integer baseSalary, String employeeType){
        Integer salary = 0;
        //switch calulate the bonus return the salary 
        switch on employeeType{
            when 'regular'{
                salary = baseSalary + 25000;
            }
            when 'manager'{
                salary = baseSalary + 30000;
            }
            when 'regional head'{
                salary = baseSalary + 35000;
            }
            when 'svp'{
                salary = baseSalary + 40000;
            }
            when 'vp'{
                salary = baseSalary + 50000;
            }
            when else {
                salary = baseSalary + 75000;
            }
        }
        return salary;
    }
}
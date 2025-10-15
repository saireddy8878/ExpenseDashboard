using com.demo.expenses as db from '../db/schema';

service ExpenseService @(requires: 'employeeRole') {
  entity Employees as projection on db.Employees;
  entity Expenses  as projection on db.Expenses;
  entity ExpenseItems as projection on db.ExpenseItems;
}

using com.demo.expenses as db from '../db/schema';

service AdminService @(requires: 'admin') {
entity Expenses as projection on db.Expenses 
actions {
      action approve();
      action reject();
    };
  entity ExpenseItems  as projection on db.ExpenseItems;
  entity Employees     as projection on db.Employees;
}



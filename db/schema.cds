namespace com.demo.expenses;

using { Currency , cuid, managed } from '@sap/cds/common';

entity Employees : cuid, managed {
  @mandatory
  name       : String(111); 
  email : String(255)
  @mandatory
  @assert.format : '^[^\s@]+@[^\s@]+\.[^\s@]+$';

  expenses   : Composition of many Expenses on expenses.employee = $self; 
}
entity Expenses : cuid, managed {
  employee   : Association to Employees;
  @mandatory
  tripName   : String(255);
  tripDate   : Date;
  @readonly:true
  status     : String(20) default 'Draft';
  items      : Composition of many ExpenseItems on items.expense = $self;
}

entity ExpenseItems : cuid, managed {
  expense     : Association to Expenses;
  description : String(255);
  amount      : Decimal(9,2);
  currency    : Currency;
  receipt     : LargeBinary @Core.MediaType : 'image/png';
  
  receiptUrl  : String @Core.Computed : true;
}

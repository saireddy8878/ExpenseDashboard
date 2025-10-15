using ExpenseService as service from '../../srv/expenses-service';

// Root: Employees (draft enabled in service definition)
annotate service.Employees with @odata.draft.enabled;

annotate service.Employees with @(
  UI.HeaderInfo : {
    TypeName        : 'Employee',
    TypeNamePlural  : 'Employees',
    Title           : { Value : name },
    Description     : { Value : email }
  },
  UI.FieldGroup #GeneralInfo : {
    Data : [
      { Value : name,  Label : 'Name' },
      { Value : email, Label : 'Email' }
    ]
  },
  UI.Facets : [
    {
      $Type  : 'UI.ReferenceFacet',
      ID     : 'GeneralInformation',
      Label  : 'General Information',
      Target : '@UI.FieldGroup#GeneralInfo'
    },
    {
      $Type  : 'UI.ReferenceFacet',
      ID     : 'EmployeeExpenses',
      Label  : 'Expenses',
      Target : 'expenses/@UI.LineItem'  
    }
  ],
  UI.LineItem : [
    { Value : name,  Label : 'Name' },
    { Value : email, Label : 'Email' }
  ]
);

// Expenses: sub-object of Employees
annotate service.Expenses with @(
  UI.HeaderInfo : {
    TypeName        : 'Expense',
    TypeNamePlural  : 'Expenses',
    Title           : { Value : tripName },
    Description     : { Value : status }
  },
  UI.Facets : [
    {
      $Type  : 'UI.ReferenceFacet',
      ID     : 'ExpenseGeneralInfo',
      Label  : 'General Information',
      Target : '@UI.FieldGroup#ExpenseInfo'
    },
    {
      $Type  : 'UI.ReferenceFacet',
      ID     : 'ExpenseItemsFacet',
      Label  : 'Expense Items',
      Target : 'items/@UI.LineItem'    
    }
  ],
  UI.FieldGroup #ExpenseInfo : {
    Data : [
      { Value : tripName, Label : 'Trip' },
      { Value : tripDate, Label : 'Date' },
      { Value : status,   Label : 'Status' }
    ]
  },
  UI.LineItem : [
    { Value : tripName, Label : 'Trip' },
    { Value : tripDate, Label : 'Date' },
    { Value : status,   Label : 'Status' }
  ],
  UI.DataField: { maxValue: $now }
);


annotate service.ExpenseItems with @(
  UI.HeaderInfo : {
    TypeName        : 'Expense Item',
    TypeNamePlural  : 'Expense Items',
    Title           : { Value : description },
    Description     : { Value : amount }
  },
  UI.FieldGroup #ItemInfo : {
    Data : [
      { Value : description, Label : 'Description' },
      { Value : amount,      Label : 'Amount' },
      { Value : currency,    Label : 'Currency' }
    ]
  },
  UI.LineItem : [
    { Value : description, Label : 'Description' },
    { Value : amount,      Label : 'Amount' },
    { Value : currency_code,    Label : 'Currency' },

    {
      Value: receipt,
      Label: 'Book Image',
      @UI.DataField: {type:'Edm.Stream'} 
    }
  ]
);

using ExpenseService as service from '../../srv/expenses-service';
using {sap} from '@sap/cds/common';

using {
  sap.common,
  sap.common.Currencies
} from '@sap/cds/common';

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
      { Value : tripDate, Label : 'Date' }
      
    ]
  },
  UI.LineItem : [
    { Value : tripName, Label : 'Trip' },
    { Value : tripDate, Label : 'Date' }
   
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
annotate sap.common.Currencies with @(
  Common.SemanticKey: [code],
  Identification    : [{Value: code}],
  UI                : {
    SelectionFields: [
      name,
      descr
    ],
    LineItem       : [
      {Value: descr},
      {Value: symbol},
      {Value: code},
    ],
  }
);
annotate Currencies with {
  symbol @Common.Label: '{i18n>Currency}';
}
annotate common.Currencies with @(UI: {
  HeaderInfo         : {
    TypeName      : '{i18n>Currency}',
    TypeNamePlural: '{i18n>Currencies}',
    Title         : {Value: descr},
    Description   : {Value: code}
  },
  Facets             : [{
    $Type : 'UI.ReferenceFacet',
    Label : '{i18n>Details}',
    Target: '@UI.FieldGroup#Details'
  }],
  FieldGroup #Details: {Data: [
    {Value: name},
    {Value: symbol},
    {Value: code},
    {Value: descr}
  ]}
});

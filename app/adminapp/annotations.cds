using AdminService as service from '../../srv/admin-service';
// Define the ExpenseItemsGroup FieldGroup

annotate service.Expenses with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Trip Name',
                Value : tripName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Trip Date',
                Value : tripDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : status,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
    $Type  : 'UI.ReferenceFacet',
    ID     : 'ExpenseItemsFacet',
    Label  : 'Expense Items',
    Target : 'items/@UI.LineItem'   
}

    ],
    UI.Identification : [
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'approve',  
            Label  : 'Approve'
        },
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'reject',   
            Label  : 'Reject'
        }
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'TripName',
            Value : tripName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Trip Date',
            Value : tripDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : status,
        },
    ],
);
annotate service.ExpenseItems with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Ddescription',
            Value : description
        },
        {
            $Type : 'UI.DataField',
            Label : 'Amount',
            Value : amount
        },
        {
            $Type : 'UI.DataField',
            Label : 'Currency',
            Value : currency_code
        },
        
        {
            $Type : 'UI.DataField',
            Label : 'Receipty',
            Value: receipt
        },
        {
    $Type : 'UI.DataFieldForUrl',
    Label : 'Receipt',
    Url   : receiptUrl,
    Value : 'Download',
    Target: '_blank'
}

    ]
);
annotate service.Expenses with {
    employee @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Employees',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : employee_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
        ],
    }
};




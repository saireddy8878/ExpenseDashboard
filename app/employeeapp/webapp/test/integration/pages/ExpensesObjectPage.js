sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.demo.employeeapp.employeeapp',
            componentId: 'ExpensesObjectPage',
            contextPath: '/Employees/expenses'
        },
        CustomPageDefinitions
    );
});
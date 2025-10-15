sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/demo/employeeapp/employeeapp/test/integration/pages/EmployeesList",
	"com/demo/employeeapp/employeeapp/test/integration/pages/EmployeesObjectPage",
	"com/demo/employeeapp/employeeapp/test/integration/pages/ExpensesObjectPage"
], function (JourneyRunner, EmployeesList, EmployeesObjectPage, ExpensesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/demo/employeeapp/employeeapp') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeesList: EmployeesList,
			onTheEmployeesObjectPage: EmployeesObjectPage,
			onTheExpensesObjectPage: ExpensesObjectPage
        },
        async: true
    });

    return runner;
});


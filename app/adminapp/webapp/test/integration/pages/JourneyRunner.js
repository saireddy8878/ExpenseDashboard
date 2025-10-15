sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/demo/admin/adminapp/test/integration/pages/ExpensesList",
	"com/demo/admin/adminapp/test/integration/pages/ExpensesObjectPage",
	"com/demo/admin/adminapp/test/integration/pages/ExpenseItemsObjectPage"
], function (JourneyRunner, ExpensesList, ExpensesObjectPage, ExpenseItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/demo/admin/adminapp') + '/test/flp.html#app-preview',
        pages: {
			onTheExpensesList: ExpensesList,
			onTheExpensesObjectPage: ExpensesObjectPage,
			onTheExpenseItemsObjectPage: ExpenseItemsObjectPage
        },
        async: true
    });

    return runner;
});


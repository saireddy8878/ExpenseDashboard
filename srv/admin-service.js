const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
  const { Expenses, ExpenseItems } = this.entities;

  // Approve
  this.on('approve', Expenses, async (req) => {
    const { ID } = req.params[0];
    await UPDATE(Expenses).set({ status: 'Approved' }).where({ ID });
    return true;
  });

  // Reject
  this.on('reject', Expenses, async (req) => {
    const { ID } = req.params[0];
    await UPDATE(Expenses).set({ status: 'Rejected' }).where({ ID });
    return true;
  });

  // ✅ Inject receipt download link for FE
this.after('READ', ExpenseItems, (each, req) => {
  console.log('Hello, handler fired');

  // Always set receiptUrl if ID exists
  if (each && each.ID) {
    each.receiptUrl = `/odata/v4/${req.target.name}(${each.ID})/receipt/$value`;

    console.log('[READ] Injected receiptUrl:', each.receiptUrl);
  }
});

});

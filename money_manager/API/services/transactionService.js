const Transaction = require('../models/Transaction');

const addTransaction = async (data) => {
    const transaction = new Transaction(data);
    await transaction.save();
    return transaction;
};

const getTransactionsByUser = async (user) => {
    return Transaction.find({ user }).sort({ date: -1 });
};

module.exports = { addTransaction, getTransactionsByUser }; 
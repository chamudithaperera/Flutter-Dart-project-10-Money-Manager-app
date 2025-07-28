const { addTransaction, getTransactionsByUser } = require('../services/transactionService');

const createTransaction = async (req, res) => {
    try {
        const transaction = await addTransaction(req.body);
        res.status(201).json({ message: 'Transaction added', transaction });
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
};

const getUserTransactions = async (req, res) => {
    try {
        const { user } = req.query;
        const transactions = await getTransactionsByUser(user);
        res.status(200).json({ transactions });
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
};

module.exports = { createTransaction, getUserTransactions }; 
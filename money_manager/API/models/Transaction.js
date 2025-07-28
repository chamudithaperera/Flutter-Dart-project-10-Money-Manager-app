const mongoose = require('mongoose');

const transactionSchema = new mongoose.Schema({
    user: { type: String, required: true }, // user email or id
    icon: { type: String, required: true },
    title: { type: String, required: true },
    time: { type: String, required: true },
    amount: { type: Number, required: true },
    isExpense: { type: Boolean, required: true },
    comment: { type: String },
    date: { type: Date, required: true },
}, { timestamps: true });

module.exports = mongoose.model('Transaction', transactionSchema); 
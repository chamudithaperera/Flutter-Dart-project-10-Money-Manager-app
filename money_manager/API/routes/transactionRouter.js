const express = require('express');
const router = express.Router();
const { createTransaction, getUserTransactions } = require('../controllers/transactionController');

// Add a new transaction
router.post('/', createTransaction);

// Get transactions for a user (by user email or id)
router.get('/', getUserTransactions);

module.exports = router; 
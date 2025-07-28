const express = require('express');
const connectDB = require('./config/db');
const userRouter = require('./routes/userRouter');
const transactionRouter = require('./routes/transactionRouter');

const app = express();
const port = 8500;

app.use(express.json());

connectDB();

app.get('/', (req, res) => {
  res.status(200).send('HELLO EXPRESS !');
});

app.use('/api/users', userRouter);
app.use('/api/transactions', transactionRouter);

app.listen(port, () => {
  console.log('API connect successfully..');
});
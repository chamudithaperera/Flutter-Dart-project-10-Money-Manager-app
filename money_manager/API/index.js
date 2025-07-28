const express = require('express');
const mongoose = require('mongoose');
const userRouter = require('./routes/userRouter');

const app = express();
const port = 8500;

app.use(express.json());

mongoose.connect('mongodb://127.0.0.1:27017/MoneyManager');

app.get('/', (req, res) => {
  res.status(200).send('HELLO EXPRESS !');
});

app.use('/api/users', userRouter);

app.listen(port, () => {
  console.log('API connect successfully..');
});
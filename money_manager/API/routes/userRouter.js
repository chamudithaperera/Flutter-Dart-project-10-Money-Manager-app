// routes/userRouter.js
const express = require('express');
const router = express.Router();
const { register, login } = require('../controllers/userController');

router.post('/register', register);
router.post('/login', login);

// Example route
router.get('/', (req, res) => {
  res.send('User route is working!');
});

module.exports = router;

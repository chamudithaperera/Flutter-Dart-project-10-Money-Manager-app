const { registerUser, loginUser } = require('../services/userService');

const register = async (req, res) => {
    try {
        const user = await registerUser(req.body);
        res.status(201).json({ message: 'User registered successfully', user: { username: user.username, email: user.email } });
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
};

const login = async (req, res) => {
    try {
        const user = await loginUser(req.body);
        res.status(200).json({ message: 'Login successful', user: { username: user.username, email: user.email } });
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
};

module.exports = { register, login }; 
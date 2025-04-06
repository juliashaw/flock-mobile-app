import express from "express";
import Flock from "./controller/Flock.ts";

const app = express();
const PORT = 3000;
const flock = new Flock();

app.use(express.json());

// endpoint for addUser
app.post('/signup', async (req, res) => {
    const { username, password } = req.body;
    try {
        const newUser = await flock.addUser(username, password);
        res.status(201).json(newUser);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
});

app.post('/login', async (req, res) => {
    const { username, password } = req.body;
    try {
        const user = await flock.authenticateUser(username, password);
        res.status(200).json(user);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
});

app.get("/users", async (req, res) => {
    try {
        const users = await flock.getUsers();
        res.status(200).json(users);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
})

// endpoint for updateUserProfile
app.put('/users/:username', async (req, res) => {
    const { username } = req.params;
    const { name, bio } = req.body;
    try {
        const updatedUser = await flock.updateUserProfile(username, name, bio);
        res.status(201).json(updatedUser);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
});

// endpoint for getUser
app.get('/users/:username', async (req, res) => {
    const { username } = req.params;
    try {
        const user = await flock.getUser(username);
        res.status(201).json(user);
    } catch (error) {
        res.status(404).json({ message: error.message });
    }
});

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});
import User from "./User.ts";
import path from "path";
import fs from "fs-extra";

export default class UserManager {
    private dataDirectory: string = "data/users.json";

    public async addUser(username: string, password: string): Promise<User> {
        const trimmedUsername = username.trim();
        const trimmedPassword = password.trim();

        // 1) load users from disk
        const users: User[] = await this.loadDataFromDisk();

        // 2) check that the username and password are well formatted
        if (!this.isValid(trimmedUsername) || !this.isValid(trimmedPassword)) {
            throw new Error("addUser: Username and Password must not contain any special characters.");
        }

        // 3) check that the username is available
        if (await this.isUsernameTaken(trimmedUsername)) {
            throw new Error("addUser: Username is unavailable");
        }

        // 4) add user to users variable
        const user: User = {
            username: trimmedUsername,
            password: trimmedPassword,
            name: trimmedUsername,
            bio: "",
        }
        users.push(user);

        console.log("Users: " + users.length);

        // 5) add users to disk
        await this.saveDataToDisk(users);

        // 6) return the user
        return user;
    }

    public async updateUserProfile(username: string, name: string, bio: string): Promise<User> {
        const trimmedUsername = username.trim();
        const trimmedName = name.trim();
        const trimmedBio = bio.trim();

        // 1) Validate the username and name (ensure they contain only alphanumeric characters and are not empty)

        if (!this.isValid(trimmedUsername) || !this.isValid(trimmedName)) {
            throw new Error("updateUserProfile: Username and name must contain only alphanumeric characters and not be empty.");
        }

        // 2) Load users from disk
        const users: User[] = await this.loadDataFromDisk();

        // 3) Find the user with the matching username
        const user = users.find(u => u.username === trimmedUsername);

        // 4) If no user is found, throw an error
        if (!user) {
            throw new Error(`updateUserProfile: User with username "${trimmedUsername}" not found.`);
        }

        // 5) Update the user's name and bio
        user.name = trimmedName;
        user.bio = trimmedBio;

        // 6) Save the updated user data back to disk
        await this.saveDataToDisk(users);

        // 7) Return the updated user
        return user;
    }


    public async getUser(username: string): Promise<User> {
        const trimmedUsername = username.trim();

        if (!this.isValid(trimmedUsername)) {
            throw new Error("getUser: Username must not contain any special characters.");
        }

        // 1) load users from disk
        const users: User[] = await this.loadDataFromDisk();

        // 2) Find user with matching username
        const user = users.find(u => u.username === trimmedUsername);

        // 3) If no user is found, throw an error
        if (!user) {
            throw new Error(`getUser: User with username "${trimmedUsername}" not found.`);
        }

        // 4) Return the matching user
        return user;
    }

    public async authenticateUser(username: string, password: string): Promise<Boolean> {
        const trimmedUsername = username.trim();
        const trimmedPassword = password.trim();

        // 1) load users from database
        const users = await this.loadDataFromDisk();

        // 2) return true if a user with given username and password is found
        return users.some((user: {username: string, password: string}) => (
            user.username === trimmedUsername) && (user.password === trimmedPassword));
    }

    public async getUsers(): Promise<User[]> {
        const data: User[] = await this.loadDataFromDisk();

        const users: User[] = data.map((elm) => ({
            username: elm.username,
            password: elm.password,
            name: elm.name,
            bio: elm.bio
        }));

        return await Promise.all(users);
    }

    private async saveDataToDisk(users: User[]): Promise<void> {
        try {
            await fs.outputJSON(this.dataDirectory, users);
        } catch (err) {
            console.log("Error in saveDataToDisk: " + err.message);
            return;
        }
    }

    private async loadDataFromDisk(): Promise<User[]> {
        try {
            return await fs.readJSON(this.dataDirectory);
        } catch (err) {
            console.log("Error in loadDataFromDisk: " + err.message);
            return [];
        }
    }

    private isValid(text: string): Boolean {
        const trimmedText = text.trim();

        if (trimmedText.length === 0) {
            return false;
        }

        const alphanumericRegex = /^[a-zA-Z0-9]+$/;
        return alphanumericRegex.test(trimmedText);
    }

    private async isUsernameTaken(username: string): Promise<boolean> {
        const trimmedUsername = username.trim();
        const users = await this.loadDataFromDisk();
        return users.some((user: { username: string }) => user.username === trimmedUsername);
    }
}
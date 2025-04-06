import User from "./User";
import * as fs from "fs-extra";


export default class UserManager {
    private dataDirectory: string = "data/users.json";

    public async addUser(username: string, password: string): Promise<User> {
        // 1) load users from disk
        const users: User[] = await this.loadDataFromDisk();

        // 2) check that the username and password are well formatted
        if (!this.isValid(username) || !this.isValid(password)) {
            throw new Error("addUser: Username and Password must not contain any special characters.");
        }

        // 3) check that the username is available
        if (await this.isUsernameTaken(username)) {
            throw new Error("addUser: Username is unavailable");
        }

        // 4) add user to users variable
        const user: User = {
            username: username,
            password: password,
            name: username,
            bio: "",
        }
        users.push(user);

        // 5) add users to disk
        await this.saveDataToDisk(users);

        // 6) return the user
        return user;
    }

    public async updateUserProfile(username: string, name: string, bio: string): Promise<User> {
        // 1) Validate the username and name (ensure they contain only alphanumeric characters and are not empty)
        if (!this.isValid(username) || !this.isValid(name)) {
            throw new Error("updateUserProfile: Username and name must contain only alphanumeric characters and not be empty.");
        }

        // 2) Load users from disk
        const users: User[] = await this.loadDataFromDisk();

        // 3) Find the user with the matching username
        const user = users.find(u => u.username === username);

        // 4) If no user is found, throw an error
        if (!user) {
            throw new Error(`updateUserProfile: User with username "${username}" not found.`);
        }

        // 5) Update the user's name and bio
        user.name = name;
        user.bio = bio;

        // 6) Save the updated user data back to disk
        await this.saveDataToDisk(users);

        // 7) Return the updated user
        return user;
    }


    public async getUser(username: string): Promise<User> {
        if (!this.isValid(username)) {
            throw new Error("getUser: Username must not contain any special characters.");
        }

        // 1) load users from disk
        const users: User[] = await this.loadDataFromDisk();

        // 2) Find user with matching username
        const user = users.find(u => u.username === username);

        // 3) If no user is found, throw an error
        if (!user) {
            throw new Error(`getUser: User with username "${username}" not found.`);
        }

        // 4) Return the matching user
        return user;
    }

    private async saveDataToDisk(users: User[]): Promise<void> {
        try {
            await fs.outputJSON(this.dataDirectory, users);
        } catch {
            return;
        }
    }

    private async loadDataFromDisk(): Promise<User[]> {
        try {
            return await fs.readJSON(this.dataDirectory);
        } catch {
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
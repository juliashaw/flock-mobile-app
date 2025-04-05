import User from "./User";
import * as fs from "fs-extra";


export default class UserManager {
    private dataDirectory: string = "data/users.json";

    public async addUser(username: string, password: string): Promise<User> {
        // 1) load users from disk
        const users: User[] = await this.loadDataFromDisk();

        // 2) check that the username and password are well formatted
        if (!this.isValid(username) || !this.isValid(password)) {
            throw new Error("Username and Password must not contain any special characters.");
        }

        // 3) check that the username is available
        if (await this.isUsernameTaken(username)) {
            throw new Error("Username is unavailable");
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
        throw new Error("TODO");
    }

    public async getUser(username: string): Promise<User> {
        throw new Error("TODO");
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
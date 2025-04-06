import User from "../model/User";
import UserManager from "../model/UserManager";

export default class Flock {
    private userManager: UserManager;

    constructor() {
        this.userManager = new UserManager();
    }
    /**
     * Add a user to FLockApp
     *
     * @param username The username of the user being added
     * @param password The password of the user being added
     *
     * The promise should fulfill on a successful add, and reject for any failures.
     * The promise should fulfill with the User that was added.
     * The promise should reject with an Error describing the error.
     *
     * The username is invalid if it contains characters that are not alphanumeric characters, or if
     * it only contains whitespace.
     * If the username is the same as the id of an already added user, the user should be rejected and not saved.
     *
     * The password is invalid if it contains characters that are not alphanumeric characters, or if
     * it only contains whitespace.
     */
    public async addUser(username: string, password: string): Promise<User> {
       return await this.userManager.addUser(username, password);
    }


    /**
     * Update a users profile
     *
     * @param username The username of the user being modified
     * @param name The new display name of the user
     * @param bio The new bio of the user
     *
     * The promise should fulfill with the User after modification.
     *
     * The username, string, and bio are invalid if they contain characters that are not alphanumeric characters, or if
     * they only contain whitespace.
     * The promise should reject with an error if a user with the given username is not found.
     */
    public async updateUserProfile(username: string, name: string, bio: string): Promise<User> {
        return await this.userManager.updateUserProfile(username, name, bio);
    }

    /**
     * Return
     *
     * @param username
     * @param group
     */
    public async updateUserGroups(username: string, group: string): Promise<User> {
        throw new Error("TODO");
    }
    /**
     *
     * @param username The username of the user to be returned
     *
     * The username is invalid if it contains characters that are not alphanumeric characters, or if
     * it only contains whitespace.
     *
     * The promise should reject if a user with the given username does not exist
     */
    public async getUser(username: string): Promise<User> {
        return await this.userManager.getUser(username);
      }
}


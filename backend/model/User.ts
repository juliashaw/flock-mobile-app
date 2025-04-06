
export default class User {
    public username: string;
    public password: string;
    public name: string;
    public bio: string;

    constructor(
        username: string,
        password: string,
        name: string,
        bio: string
    ) {
        this.username = username;
        this.password = password;
        this.name     = name;
        this.bio      = bio;
    }
}

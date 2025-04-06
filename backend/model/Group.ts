import User from "./User.ts";

export default class Group {
    constructor(
        public name: string,
        public members: User[],
    ) {}
}
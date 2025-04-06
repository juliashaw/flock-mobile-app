import User from "./User";

export default class Group {
    constructor(
        public name: string,
        public members: User[],
    ) {}
}
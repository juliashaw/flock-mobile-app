import * as path from "path";
import { promises as fs } from "fs";
import Flock from "../../backend/controller/Flock";

const dataPath = path.join(__dirname, "../../../data/users.json");

describe("Flock class tests", () => {
  let flock: Flock;

  beforeEach(async () => {
    try {
      await fs.unlink(dataPath);
    } catch (err) {
    }
    await fs.writeFile(dataPath, JSON.stringify([]), "utf-8");
    flock = new Flock();
  });

  // ==== addUser ====
  it("should add a valid user", async () => {
    const user = await flock.addUser("validUser1", "password1");
    expect(user.username).toBe("validUser1");
  });

  it("should throw error if username is invalid", async () => {
    await expect(flock.addUser("   ", "password1")).rejects.toThrow(
      "addUser: Username and Password must not contain any special characters."
    );
  });

  it("should throw error if password is invalid", async () => {
    await expect(flock.addUser("validUser2", "    ")).rejects.toThrow(
      "addUser: Username and Password must not contain any special characters."
    );
  });

  it("should throw error if username already exists", async () => {
    await flock.addUser("duplicateUser", "password3");
    await expect(flock.addUser("duplicateUser", "password3")).rejects.toThrow(
      "addUser: Username is unavailable"
    );
  });

  // ==== updateUserProfile ====
  it("should successfully update user profile", async () => {
    await flock.addUser("profileUser", "password4");
    const updated = await flock.updateUserProfile("profileUser", "Kimia", "Hi I'm Kimia");
    expect(updated.name).toBe("Kimia");
    expect(updated.bio).toBe("Hi I'm Kimia");
  });

  it("should throw error if username in profile update is invalid", async () => {
    await expect(flock.updateUserProfile("   ", "Kimia", "bio")).rejects.toThrow(
      "updateUserProfile: Username and name must contain only alphanumeric characters and not be empty."
    );
  });

  it("should throw error if name in profile update is invalid", async () => {
    await flock.addUser("badNameUser", "password5");
    await expect(flock.updateUserProfile("badNameUser", "   ", "bio")).rejects.toThrow(
      "updateUserProfile: Username and name must contain only alphanumeric characters and not be empty."
    );
  });

  it("should throw error if user not found in profile update", async () => {
    await expect(flock.updateUserProfile("nonexistent", "Name", "Bio")).rejects.toThrow(
      'updateUserProfile: User with username "nonexistent" not found.'
    );
  });

  // ==== getUser ====
  it("should return a user if found", async () => {
    await flock.addUser("getUser123", "pass123");
    const user = await flock.getUser("getUser123");
    expect(user.username).toBe("getUser123");
  });

  it("should throw error if username is invalid in getUser", async () => {
    await expect(flock.getUser("   ")).rejects.toThrow(
      "getUser: Username must not contain any special characters."
    );
  });

  it("should throw error if user does not exist in getUser", async () => {
    await expect(flock.getUser("missingUser")).rejects.toThrow(
      'getUser: User with username "missingUser" not found.'
    );
  });

  // ==== updateUserGroups ====
  it("should throw TODO error for updateUserGroups", async () => {
    await expect(flock.updateUserGroups("anyuser", "anygroup")).rejects.toThrow("TODO");
  });
});

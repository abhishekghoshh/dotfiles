## Generate a New SSH Key
```sh
ssh-keygen -t ed25519 -C "your_email@example.com"
```

### SSH Related Files
- `~/.ssh/config`
- `~/.ssh/id_ed25519`
- `~/.ssh/id_ed25519.pub`

When you generate new SSH keys using `ssh-keygen` and change the default key name, the keys are saved in the directory you specify. If you don't specify a directory, the keys are saved in the current working directory.

### Contents of `~/.ssh/config`
```sh
Host *
   AddKeysToAgent yes
   UseKeychain yes
   IdentityFile ~/.ssh/id_ed25519
```

### Multiple GitHub Accounts on a Single Machine
```sh
# Default GitHub account (Old account, if any)
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519

# New GitHub account
Host github.com-personal
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519_personal
```

Set the remote URL for the new GitHub account:
```sh
git remote set-url origin git@github.com-personal:abhishekghoshh/github-helper.git
```

Clone the repository using the new GitHub account:
```sh
git clone git@github.com-personal:abhishekghoshh/github-helper.git
```

Also, set the git config `user.email` and `user.name` otherwise it will take the default.

### Check SSH Configuration
```sh
ssh -T git@github.com
ssh -T git@github.com-personal
```

### Check SSH Key List
```sh
ssh-add -l
```

### Add a Key to SSH Key Set
```sh
ssh-add ~/.ssh/id_ed25519_personal
```

> **Note:** While pushing using git SSH, if you see it is showing another user and it has no access (which is normal), change the git remote URL.

## Working with Git SHA and Blob Files
```sh
# Get SHA1 for a file
git ls-files -s

# Get type of object (blob or tree)
git cat-file -t SHA1_for_Object

# Get size of object (blob or tree)
git cat-file -s SHA1_for_Object

# Get content of the object (blob or tree)
git cat-file -p SHA1_for_Object

# Shows the details of a specific commit, including its changes
git show

# Display content of commit
git show SHA1_of_commit
```




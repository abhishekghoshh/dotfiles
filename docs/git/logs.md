## Git log

**How to see your commit history in Git:**  
This command shows the commit history for the current repository.  
```
git log
```

**Only display commits that have the specified file:**  
```
git log -- <file>
```

**List commit history of the current branch (-n count limits list to last n commits):**  
```
git log [-n count]
```

**How to see your commit history including changes in Git:**  
This command shows the commit's history including all files and their changes.  
```
git log -p
```

**How to see a minimal git log with commit ID and message only:**  
This command lists commits with commit ID and commit message.  
```
git log --oneline
```

**Display all commits from local and remote:**  
```
git log --oneline --all
```

**List one commit per line (-n tag can limit the number of commits displayed, e.g., -5):**  
```
git log --oneline [-n]
```

**Log commits after some date:**  
A sample value can be "2020-10-04" or keywords such as "yesterday", "last month", etc.  
```
git log --oneline --after="YYYY-MM-DD"
```

**Log commits before some date:**  
Both `--after` and `--before` tags can be used for date ranges.  
```
git log --oneline --before="last year"
```

**How to show the commit log as a graph in Git:**  
We can use `--graph` to display the commit log as a graph. Adding `--oneline` limits commit messages to a single line.  
```
git log --graph --oneline
```

**How to show the commit log as a graph of all branches in Git:**  
Does the same as the command above but for all branches.  
```
git log --graph --oneline --all
```

**Show a graph with branch names or tags:**  
```
git log --graph --decorate
```

**An overview with reference labels and history graph (one commit per line):**  
```
git log --oneline --graph --decorate
```

**How to see log stats in Git:**  
This command will show statistics about changes in each commit, including lines changed and file names.  
```
git log --stat
```

**Show all commit logs with indication of any paths that moved:**  
```
git log --stat -M
```

**Search for commits with a commit message that matches `<pattern>`:**  
```
git log --grep=<pattern>
```

**How to check the current commit log of a remote repo in Git:**  
Find out the remote repository log using this command:  
```
git log origin/main
```

**Show the commits on `branchA` that are not on `branchB`:**  
```
git log branchB..branchA
```

**Show the commits that changed a file, even across renames:**  
Lists version history for a file, including renames.  
```
git log --follow [file]
```

**List commits present on the current branch but not merged into ref (a branch name or a tag name):**  
```
git log ref .
```

**List commits present on ref but not merged into the current branch:**  
```
git log .ref
```

**Lists version history for the current branch from a certain author:**  
```
git log --author=[name]
```

**Shows who changed what and when in a file:**  
```
git blame [file]
```

**List operations (e.g., checkouts or commits) made on the local repository:**  
Display all commits, including hidden ones. Show a log of changes to the local repository's HEAD.  
Add `--relative-date` flag to show date info or `--all` to show all refs.  
```
git reflog
```

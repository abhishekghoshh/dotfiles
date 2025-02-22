## Git rebase (REWRITE HISTORY)

You can transfer completed work from one branch to another using git rebase. Apply commits of the current working branch and apply them to the HEAD of [branch] to make the history of your branch more linear.

### Basic Rebase Command
Rebase the current branch onto `<branch_name>`. `<branch_name>` can be a commit ID, branch name, a tag, or a relative reference to HEAD. Reapplies commits on the current branch onto the tip of the specified branch.

```sh
git rebase <branch_name>
```

> **Warning:** Git Rebase can get really messy if you don't do it properly. Before using this command, I suggest that you re-read the official documentation [here](https://git-scm.com/book/it/v2/Git-Branching-Rebasing).

### Interactive Rebase
You can run git rebase interactively using the `-i` flag. It will open the editor and present a set of commands you can use. Interactively rebase the current branch onto `<base>`. Launches editor to enter commands for how each commit will be transferred to the new base.

```sh
git rebase -i <base>
```

Example:
```sh
git rebase -i master
```

### Interactive Rebase Commands
- `p`, `pick` = use commit
- `r`, `reword` = use commit, but edit the commit message
- `e`, `edit` = use commit, but stop for amending
- `s`, `squash` = use commit, but meld into previous commit
- `f`, `fixup` = like "squash", but discard this commit's log message
- `x`, `exec` = run command (the rest of the line) using shell
- `d`, `drop` = remove commit

### Handling Conflicts
There can be conflicts while doing git rebase. Solve the conflicts like normal merge conflicts, then do:

```sh
git add <resolved_files>
git rebase --continue
```

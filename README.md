# git-compare-branches
Lists unmerged feature branches between 'source' and 'target' branch

## Installation:

From your terminal (in BAS), run the following command:
```bash
curl -L https://raw.githubusercontent.com/qualiture/git-compare-branches/main/git-compare-branches.sh >> ~/.bashrc
```

Then, open a new terminal (or restart the current one with `exec bash`) for the changes to take effect.

## Usage:

```
gitcompare <SOURCE> <TARGET>
```

To compare feature branches merged on `ACC` but not merged on `master`:
```bash
gitcompare ACC master
```

To compare feature branches merged on `DEV` but not on a feature/project branch:
```bash
gitcompare DEV feature/MY-PROJECT-BRANCH
```

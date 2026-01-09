## Git Commands You Know – Corrected & Explained (Simple)

This document **corrects mistakes**, **explains each command**, and **adds missing important Git concepts** you should know for DevOps.
## ✅ Corrected Commands + Explanation

### 1️⃣ `git init`

Initializes a new Git repository in the current folder.
👉 Creates the hidden `.git` directory.

---

### 2️⃣ `git status`

Shows the current state of the repository.
👉 Tells which files are modified, staged, or untracked.

---

### 3️⃣ `git add .`

Adds **all modified and new files** to the staging area.
👉 Prepares files for commit.

---

### 4️⃣ `git commit -m "message"`

Saves staged changes permanently in Git history.
👉 Creates a snapshot of your code.

---

### ❌ Wrong Command You Wrote

`git add origin main` ❌

### ✅ Correct Command

`git remote add origin <repo-url>`

👉 Adds a remote repository URL and names it `origin`.

Check remotes:
`git remote -v`

---

### 5️⃣ `git push origin main`

Uploads local commits to the remote repository.
👉 Pushes `main` branch to GitHub.

---

### 6️⃣ `git pull origin main`

Downloads latest changes from remote and merges them.
👉 Equivalent to `git fetch + git merge`.

---

### 7️⃣ `git clone <repo-url>`

Copies an existing remote repository to your local machine.
👉 Used when starting work on an existing project.

---

### 8️⃣ Branch Commands

#### ❌ Wrong

`git checkout master -b`

#### ✅ Correct

`git checkout -b branch_name`

👉 Creates **and switches** to a new branch.

---

### 9️⃣ `git branch`

Lists all local branches.

Switch branch:
`git checkout branch_name`

---

### 🔁 Modern Way (Recommended)

```bash
git switch branch_name
git switch -c new_branch
```

---

### 🔟 `git log`

Shows commit history.
👉 Displays commit id, author, date, message.

Short version:
`git log --oneline`

---

### 1️⃣1️⃣ Git Config (User Details)

#### ❌ Wrong

`git config add user.name`

#### ✅ Correct

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

Unset:

```bash
git config --global --unset user.name
git config --global --unset user.email
```

Check config:
`git config --list`

---

### 1️⃣2️⃣ Forking

Forking = creating **your own copy** of someone else’s repo on GitHub.
👉 Used for open-source contributions.

---

## ⭐ IMPORTANT COMMANDS YOU MUST ALSO KNOW

### 🔹 `git fetch`

Downloads changes but does NOT merge.
👉 Safe way to see remote updates.

---

### 🔹 `git diff`

Shows differences between files.
👉 Used before commit.

---

### 🔹 `git reset`

Moves files back from staging.

```bash
git reset file.txt
```

---

### 🔹 `git restore`

Discards file changes.

```bash
git restore file.txt
```

---

### 🔹 `.gitignore`

Used to ignore files like:

* node_modules
* .env
* logs

---

### 🔹 `git stash`

Temporarily saves changes without committing.

```bash
git stash
git stash pop
```

---

## 🧠 Git Workflow (DevOps View)

```text
Code → git add → git commit → git push
↓
CI/CD Pipeline triggers
```

---

## ✅ Final Notes (Very Important)

* Git tracks **content**, not files
* Commit often, push less
* Never push secrets (.env)
* Branch before big changes

---

✅ After this knowledge, you are **Git-ready for DevOps**.

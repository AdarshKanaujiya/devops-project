These are actually very standard DevOps lab experiments. If you practice these once properly, you can perform most of them in exam.

The good thing:

* Mostly Git + GitHub Actions + Docker basics
* Only Ansible at the end is slightly new for beginners

I’ll perform all experiments step-by-step with commands you can directly write/use in practicals.

---

# 🔹 1. Initialize Git Repo + Add + Commit

```bash
mkdir devops-lab
cd devops-lab

git init

echo "Hello DevOps" > file.txt

git add file.txt

git commit -m "Initial commit"
```

---

# 🔹 2. Create GitHub Repo + Push Local Project

## Create repository on GitHub first

Then run:

```bash
git remote add origin https://github.com/username/repo-name.git

git branch -M main

git push -u origin main
```

---

# 🔹 3. Create Two Branches + Merge

```bash
git checkout -b branch1

echo "Branch1 changes" >> file.txt

git add .
git commit -m "Updated in branch1"

git checkout main

git checkout -b branch2

echo "Branch2 changes" >> file.txt

git add .
git commit -m "Updated in branch2"

git checkout main

git merge branch1

git merge branch2
```

---

# 🔹 4. Create Pull Request + Resolve Merge Conflict

## Simulate conflict

### Branch A

```bash
git checkout -b branchA
```

Edit same line in file.

```bash
git commit -am "BranchA change"
```

---

### Branch B

```bash
git checkout main
git checkout -b branchB
```

Edit same line differently.

```bash
git commit -am "BranchB change"
```

---

### Merge

```bash
git checkout main

git merge branchA

git merge branchB
```

Conflict appears.

Open file:

```text
<<<<<<< HEAD
BranchA code
=======
BranchB code
>>>>>>> branchB
```

Remove markers manually.

Then:

```bash
git add .
git commit -m "Resolved merge conflict"
```

---

# 🔹 5. GitHub Actions Workflow (Build Success Message)

Create:

```bash
mkdir -p .github/workflows
```

File:

```bash
nano .github/workflows/main.yml
```

Paste:

```yaml
name: Basic Workflow

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Display message
      run: echo "Build Successful!"
```

Push to GitHub.

Go to:

* GitHub Repo
* Actions tab

Workflow runs automatically.

---

# 🔹 6. Simple CI/CD for Static HTML

## Create HTML file

```bash
echo "<h1>Hello CI/CD</h1>" > index.html
```

Workflow:

```yaml
name: Deploy Static Site

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3

    - name: Deploy
      run: echo "Static site deployed"
```

---

# 🔹 7. Automated Testing using GitHub Actions

## Python Example

Create:

```bash
nano test.py
```

```python
def test():
    assert 2 + 2 == 4

test()
```

Workflow:

```yaml
name: Python Test

on: [push]

jobs:
  test:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3

    - name: Setup Python
      uses: actions/setup-python@v4

    - name: Run Test
      run: python test.py
```

---

# 🔹 8. Dockerfile + Build Image

## Create app.py

```python
print("Hello Docker")
```

---

## Dockerfile

```dockerfile
FROM python:3.10

WORKDIR /app

COPY . .

CMD ["python", "app.py"]
```

---

## Build image

```bash
docker build -t myapp .
```

Run:

```bash
docker run myapp
```

---

# 🔹 9. Docker Compose (Web + DB)

## docker-compose.yml

```yaml
version: '3'

services:

  web:
    image: nginx
    ports:
      - "8080:80"

  db:
    image: mysql
    environment:
      MYSQL_ROOT_PASSWORD: root
```

Run:

```bash
docker-compose up
```

Stop:

```bash
docker-compose down
```

---

# 🔹 10. Ansible Playbook (Install Nginx)

## Install ansible

```bash
sudo apt update
sudo apt install ansible -y
```

---

## inventory file

```bash
nano inventory
```

```text
localhost ansible_connection=local
```

---

## playbook.yml

```yaml
- hosts: localhost
  become: yes

  tasks:

  - name: Install nginx
    apt:
      name: nginx
      state: present

  - name: Start nginx
    service:
      name: nginx
      state: started
```

---

## Run playbook

```bash
ansible-playbook -i inventory playbook.yml
```

---

# 🎯 Most Important Experiments

If external examiner asks important ones:

### HIGH PRIORITY

* Git commands
* GitHub Actions
* Dockerfile
* Docker Compose

### MODERATE

* Merge conflict
* CI/CD

### LOW

* Ansible

---

# ⚡ Viva Questions They May Ask

## Git

* Difference between git pull & git fetch
* What is merge conflict?

## Docker

* Docker vs VM
* What is image vs container?

## CI/CD

* Difference between Continuous Delivery & Deployment

## GitHub Actions

* Why automation?

---

# 🔥 Practical Exam Strategy

If something breaks:

* Don’t panic
* Explain steps confidently
* Most examiners care about workflow understanding

Because even experienced people get Docker/Git issues sometimes.

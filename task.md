Yes — that’s actually the best way to learn this practical.

Instead of memorizing 10 separate experiments, do **ONE mini-project scenario** that naturally covers:

* Git
* Branching
* PR/Merge conflict
* GitHub Actions
* CI/CD
* Docker
* Docker Compose
* Ansible

---

# 🚀 SIMPLE FULL DEVOPS SCENARIO

## 📌 Scenario

You are deploying a simple website for your company:

### Website:

A basic HTML page:

```html id="q9ktj8"
<h1>Welcome to My DevOps Project</h1>
```

You will:

1. Create project locally
2. Push to GitHub
3. Create branches
4. Resolve merge conflict
5. Automate build using GitHub Actions
6. Dockerize app
7. Use Docker Compose
8. Install Nginx using Ansible

This covers almost entire syllabus naturally.

---

# 🔹 STEP 1 — Create Project

## Create folder

```bash id="pk6k0f"
mkdir devops-project
cd devops-project
```

---

## Create HTML file

```bash id="xzjsv4"
nano index.html
```

Paste:

```html id="q58g0l"
<h1>Welcome to My DevOps Project</h1>
```

Save.

---

# 🔹 STEP 2 — Initialize Git

```bash id="39j8w5"
git init
```

---

## Add and Commit

```bash id="vg8yl1"
git add .

git commit -m "Initial project commit"
```

✅ Experiment 1 completed.

---

# 🔹 STEP 3 — Push to GitHub

Create repo on GitHub:

```text id="cwq77v"
devops-project
```

Then:

```bash id="jlwm9u"
git remote add origin https://github.com/username/devops-project.git

git branch -M main

git push -u origin main
```

✅ Experiment 2 completed.

---

# 🔹 STEP 4 — Create Branches

## Branch 1

```bash id="gl9tn7"
git checkout -b feature1
```

Edit HTML:

```html id="sv1n0k"
<h1>Feature1 Added</h1>
```

Commit:

```bash id="4te3o5"
git add .
git commit -m "Updated from feature1"
```

---

## Branch 2

```bash id="1kex11"
git checkout main

git checkout -b feature2
```

Edit SAME line differently:

```html id="5ykcrg"
<h1>Feature2 Added</h1>
```

Commit:

```bash id="1t7d0d"
git add .
git commit -m "Updated from feature2"
```

---

# 🔹 STEP 5 — Merge Conflict

```bash id="g0p0y2"
git checkout main

git merge feature1

git merge feature2
```

Conflict appears.

File becomes:

```html id="q95tx2"
<<<<<<< HEAD
<h1>Feature1 Added</h1>
=======
<h1>Feature2 Added</h1>
>>>>>>> feature2
```

Resolve manually:

```html id="dh9ng1"
<h1>Feature1 and Feature2 Added</h1>
```

Then:

```bash id="aq8prn"
git add .

git commit -m "Resolved merge conflict"
```

✅ Experiment 3 + 4 completed.

---

# 🔹 STEP 6 — GitHub Actions Workflow

Create folders:

```bash id="s7m37p"
mkdir -p .github/workflows
```

Create workflow:

```bash id="vq7i0z"
nano .github/workflows/main.yml
```

Paste:

```yaml id="x86m5q"
name: CI Workflow

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3

    - name: Build Success
      run: echo "Website Build Successful"
```

Push changes.

Go GitHub → Actions tab.

✅ Experiment 5 completed.

---

# 🔹 STEP 7 — Simple CI/CD

Update workflow:

```yaml id="7wh5ep"
name: Deploy Website

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
      run: echo "Website Deployed Successfully"
```

✅ Experiment 6 completed.

---

# 🔹 STEP 8 — Dockerize Website

Create Dockerfile:

```bash id="4g34b8"
nano Dockerfile
```

Paste:

```dockerfile id="s9e8v4"
FROM nginx:latest

COPY index.html /usr/share/nginx/html/index.html
```

Build image:

```bash id="2qjod2"
docker build -t devops-site .
```

Run container:

```bash id="vj38l0"
docker run -d -p 8080:80 devops-site
```

Open:

```text id="lby9t5"
http://localhost:8080
```

✅ Experiment 8 completed.

---

# 🔹 STEP 9 — Docker Compose

Create:

```bash id="a35gk5"
nano docker-compose.yml
```

Paste:

```yaml id="y1m2jf"
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

```bash id="2vqq0d"
docker-compose up
```

✅ Experiment 9 completed.

---

# 🔹 STEP 10 — Ansible

Install ansible:

```bash id="b0m1ur"
sudo apt install ansible -y
```

---

## inventory

```bash id="mfl1bx"
nano inventory
```

```text id="16t14m"
localhost ansible_connection=local
```

---

## playbook

```bash id="7t0w5s"
nano playbook.yml
```

Paste:

```yaml id="94hlqj"
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

Run:

```bash id="3cwqnd"
ansible-playbook -i inventory playbook.yml
```

✅ Experiment 10 completed.

---

# 🎯 WHY THIS METHOD IS BEST

This ONE scenario teaches:

* Real workflow
* Real sequence
* Real DevOps lifecycle

Instead of memorizing isolated commands.

---

# 🔥 Best Practice Strategy

Tomorrow:

1. Perform full flow once slowly
2. Perform second time without seeing notes
3. Third time → only remember commands logically

After that you’ll easily handle viva + practical.

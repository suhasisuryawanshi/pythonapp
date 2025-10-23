
# Python app deployment on Amazon linux aws ec2
*"From virtual envirnment to Gunicorn, Deploying my first python App on the Cloud"*
---
## Overview
This project demonstrates how I deployed a ** Python application** on a **Amazon linux EC2 instance**. It convers Installing Python, creating a virtual environment, installing dependencies, running the app locally, and deplying it using **Gunicorn** as a production-ready server.

---

## Prerequisites
Before starting make sure you have 
1. **AWS EC2 instance**
        -  Running Amazong linux 2
        - Accesible wia SSh with a valid key pair
    
2. **Security Group Setup**
        - Port **22 (SSH)** open for connecting
        - Port **5000 (or your Python app port )** open for serving the app
    
3. **GitHub Repository**
        - A Python app stored in a public or private Gt repository
    
---

 ## Steps followed

### 1. Update packages and install python3
 ```bash
sudo yum update -y
sudo yum install python3 -y
sudo yum install python3-pip -y
```

---

### 2. Install Git and Clone Application

```bash
git -v  #check if git installed
sudo yum install git -y
sudo git clone <url>
ls
cd pythonapp/
```

---

### 3. Creat and active virtial environment

```bash
pthon3 -m venv myenv
sudo bash myenv/bin/activate
```

---

### 4. Install Dependencies
```bash
sudo pip install -r requirements.txt
```

---

### 5. Run the app locally
```bash
pathon3 app.py
```

---

### 6. Deploy with Gunicorn (Production Server)
```bash
sudo gunicorn --bind 0.0.0.0:5000 app:app -daemon
```

---

### 7. test localy
```bash
curl localhost
```
    
---

### 8. Access in Browser
Copy your **EC2 Public IP** and visit:
```
http://<your ec2 public ip>:5000
```

---

## Common error and fixes

### 1. Port Not Accessible

* **Issue**: Application runs but browser shows *connection* refused.
* **Fix**: Update your EC2 **Security Group** -> add inbound rule for port 5000
(on the port your app uses) with source set to 0.0.0.0/0.

---

### 2. Virtual Environment Not Activating

* **Issue**: Error like 'permission denied' while activating virtual environment.
* **Fix**: Ensure you are using the correct path:
    
```bash
source myenv/bin/activate
```

if needed, run with 'sudo bash myenv/bin/activate'.

---

### 3. Gunicorn Not Installed
* **Issue**: 'Command not found Gunicorn'.
* **Fix**: Install it inside your environment.

```bash
pip install gunicorn
```

---

## Result

My Python web application is running on Amazon linux EC2. **Gunicorn**, the app stays active as a production-grade WSGI server accessivle over the public IP.

![alt text](image.png)

---

## Tech Stack

* **OS**: Amazon Linux 2
* **Language**: Python 3
* **Package Manganer**: Pip
* **Web Server Gateway**: Gunicorn
* **Hosting**: AWS EC2

---

## Summary

In this project, I diployed a python applicaton on an AWS EC2 instance. After installing pytho. I cloned repositiory, crated, created a virtual environment, install depedencies, and deployed the app with Gunicorn. This marks my first successfull Python web app deployment on the cloud.

#!/bin/bash
#display_python_app.sh
#script to display a python web app on Amazon Linux EC2 with Gunicorn

echo "=== Updatin system packages ==="
sudo yum update -y

echo "=== Installing Python 3 and pip ==="
sudo yum install python3 -y
sudo yum install python3-pip -y

echo "=== Checking Git Installation ==="
git -v  || echo "git not found installing..."
sudo yum install git -y

echo "=== Cloning Python Application Repository ==="
sudo git clone <url>
ls
cd pythonapp/

echo "=== Creating Virtual Environment ==="
pthon3 -m venv myenv
sudo python3 -m venv myenv

echo "=== Avtivation Virtual Environment ==="
sudo bash myenv/bin/activate

echo "=== Installing Python Dependencies ==="
sudo pip install -r requirements.txt

echo "=== Running the App locally ==="
python3 app.py

echo "=== Deploying app with Gunicorn (Production Server) ==="
sudo gunicor --bind 0.0.0.0:5000 app:app --daemon

echo "=== Testing with curl ==="
curl localhost

echo "=== Script Complited ==="
echo "Now open http://<your ec2 public ip>:5000 in your browser to verify the app"
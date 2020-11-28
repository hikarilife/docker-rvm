# docker-rvm
RVM on docker
    
# How to use
## Step1
ファイルをローカルにダウンロードします。  
The mirror of the docker-rvm can be checked out with the following command:
```
git clone https://github.com/hikarilife/docker-rvm.git
```
  
## Step 2
コンテナ上のrvmユーザ用のパスワードを設定します。  
Set your own password of rvm user in docker container with the following command:
```
export RVM_PASS="<your password>"
```
  
## Step 3
ビルドして動かします。  
Build and run docker-rvm container with the following command:
```
docker-compose up -d --build
```
  
## Step 4
コンテナに入ります。  
Enter running container with the following command:
```
docker exec -it <container> bash --login
```

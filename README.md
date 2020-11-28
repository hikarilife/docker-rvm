# docker-rvm
RVM on docker

# How to use
## Step1
The mirror of the docker-rvm can be checked out with the following command:
ファイルをローカルにダウンロードします。
```
git clone https://github.com/hikarilife/docker-rvm.git
```

## Step 2
Set your own password of rvm user in docker container with the following command:
コンテナ上のrvmユーザ用のパスワードを設定します。
```
export RVM_PASS="<your password>"
```

## Step 3
Build and run docker-rvm container with the following command:
ビルドして動かします。
```
docker-compose up -d --build
```

## Step 4
Enter running container with the following command:
コンテナに入ります。
```
docker exec -it <container> bash --login
```

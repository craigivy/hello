# hello
Prints the value of the provider header.

## Desktop usage (assumes golang installed)
```
go run main.go
 curl --header "provider: google" localhost:8080/hello
```

## Docker usage (assumes docker installed)
```
docker build -t hello . 
docker run --rm -p 8080:8080 -d hello 
curl -H "provider: google" localhost:8080/hello
```

## Deploy to kubernetes (assumes use of existing kubernetes cluster)
```
kubectl create namespace app
kubectl -n app apply -k k8s
ENDPOINT=$(kubectl -n app get svc hello | grep -v EXTERNAL-IP | awk '{ print $4}')
curl -H "provider: google" $ENDPOINT/hello
```

## Docker build notes
```
docker build -t us-central1-docker.pkg.dev/ivy-15-project/docker-repo/hello .
docker push us-central1-docker.pkg.dev/ivy-15-project/docker-repo/hello

docker pull us-central1-docker.pkg.dev/ivy-15-project/docker-repo/hello:latest
```

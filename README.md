# hello
Prints the value of the provider header.
```
go run main.go
 curl --header "provider: google" localhost:8080/hello
```

```
docker build -t hello . 
docker run --rm -p 8080:8080 -d hello 
curl -H "provider: google" localhost:8080
```
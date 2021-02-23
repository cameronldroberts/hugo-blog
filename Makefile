build:
	mkdir -p functions
	GOOS=linux GOARCH=amd64 go build -o ./netlify/functions/main ./functions/main.go
	hugo --gc --minify
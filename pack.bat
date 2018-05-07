@echo off
set GOOS=linux
set GOPACH=amd64
go build zcron.go
pause

package main

import (
	"fmt"
	"net/http"

	"github.com/opam22/form/config"
)

func main() {
	fmt.Printf("server started at localhost%s\n", config.PORT)
	errListen := http.ListenAndServe(config.PORT, Route().Init())
	if errListen != nil {
		fmt.Println(errListen.Error())
	}
}

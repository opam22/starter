package auth

import (
	"encoding/json"
	"fmt"
	"net/http"
)

type AuthController struct {
	Service UseCase
}

func (c *AuthController) Login(w http.ResponseWriter, r *http.Request) {

	var (
		loginCredential LoginCredential
		httpResponse    HTTPResponse
	)

	httpResponse.Message = "Success"

	if err := json.NewDecoder(r.Body).Decode(&loginCredential); err != nil {
		httpResponse.Message = err.Error()
	}

	tokenString, expirationTime, err := c.Service.Login(loginCredential)
	if err != nil {
		httpResponse.Message = err.Error()
	}

	fmt.Printf("%v", expirationTime)

	http.SetCookie(w, &http.Cookie{
		Name:    "jwttokenvanara",
		Value:   tokenString,
		Expires: expirationTime,
		Path:    "/",
	})

	httpResponse.StatusCode = http.StatusOK

	if err := json.NewEncoder(w).Encode(httpResponse); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

}

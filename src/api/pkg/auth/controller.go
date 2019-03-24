package auth

import (
	"encoding/json"
	"net/http"
	"time"

	"github.com/opam22/form/helper"
)

type AuthController struct {
	Service UseCase
}

func (c *AuthController) Login(w http.ResponseWriter, r *http.Request) {

	var (
		loginCredential LoginCredential
		httpResponse    helper.HTTPResponse
	)

	if err := json.NewDecoder(r.Body).Decode(&loginCredential); err != nil {
		httpResponse.Message = err.Error()
		httpResponse.Status = "error"

		if err := json.NewEncoder(w).Encode(httpResponse); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
		}

		return

	}

	tokenString, expirationTime, err := c.Service.Login(loginCredential)
	if err != nil {
		httpResponse.Message = err.Error()
		httpResponse.Status = "error"

		if err := json.NewEncoder(w).Encode(httpResponse); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
		}

		return
	}

	http.SetCookie(w, &http.Cookie{
		Name:    "jwttokenvanara",
		Value:   tokenString,
		Expires: expirationTime,
		Path:    "/",
	})

	httpResponse.Status = "ok"

	if err := json.NewEncoder(w).Encode(httpResponse); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

}

func (c *AuthController) Logout(w http.ResponseWriter, r *http.Request) {

	var (
		httpResponse helper.HTTPResponse
	)

	cookie, err := r.Cookie("jwttokenvanara")
	if err != nil {
		httpResponse.Message = "unauthorized"
		httpResponse.Status = "error"

		if err := json.NewEncoder(w).Encode(httpResponse); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
		}

		return
	}

	// Get the JWT string from the cookie
	tokenStr := cookie.Value
	errToken := c.Service.Logout(tokenStr)

	if errToken != nil {
		httpResponse.Message = errToken.Error()
		httpResponse.Status = "error"

		if err := json.NewEncoder(w).Encode(httpResponse); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
		}

		return
	}

	// delete cookie
	cookie = &http.Cookie{
		Name:    "jwttokenvanara",
		Value:   "",
		Path:    "/",
		Expires: time.Unix(0, 0),
	}

	http.SetCookie(w, cookie)

	httpResponse.Status = "ok"

	if err := json.NewEncoder(w).Encode(httpResponse); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

}

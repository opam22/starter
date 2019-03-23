package auth

import (
	"encoding/json"
	"net/http"
)

type AuthController struct {
	Service UseCase
}

func (c *AuthController) Login(w http.ResponseWriter, r *http.Request) {

	var loginCredential LoginCredential

	if err := json.NewDecoder(r.Body).Decode(&loginCredential); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}

	res, err := c.Service.Login(loginCredential)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}

	if err := json.NewEncoder(w).Encode(res); err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
	}

}

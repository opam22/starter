package main

import (
	"encoding/json"
	"net/http"

	"github.com/opam22/form/driver"
	"github.com/opam22/form/helper"
)

func mustLogin(next http.HandlerFunc) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {

		var (
			httpResponse helper.HTTPResponse
		)

		httpResponse.Status = "ok"

		cookie, err := r.Cookie("jwttokenvanara")
		if err != nil {
			httpResponse.Status = "error"
			httpResponse.Message = "unauthorized"

			if err := json.NewEncoder(w).Encode(httpResponse); err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
			}

			return
		}

		// Get the JWT string from the cookie
		tokenStr := cookie.Value
		JWTHandler := &driver.Claim{}
		errCheck := JWTHandler.CheckJWT(tokenStr)
		if errCheck != nil {
			httpResponse.Message = errCheck.Error()

			if err := json.NewEncoder(w).Encode(httpResponse); err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
			}

			return
		}

		next.ServeHTTP(w, r)
	}
}

package main

import (
	"net/http"

	"github.com/opam22/form/driver"
)

func mustLogin(next http.HandlerFunc) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {

		cookie, err := r.Cookie("jwttokenvanara")
		if err != nil {
			http.Error(w, "Unauthorized", http.StatusForbidden)
			return
		}

		// Get the JWT string from the cookie
		tokenStr := cookie.Value

		JWTHandler := &driver.Claim{}

		errCheck := JWTHandler.CheckJWT(tokenStr)
		if errCheck != nil {
			http.Error(w, "Unauthorized", http.StatusForbidden)
		}

		next.ServeHTTP(w, r)
	}
}

package driver

import (
	"errors"
	"time"

	"github.com/dgrijalva/jwt-go"
	"github.com/opam22/form/config"
)

var jwtKey = []byte(config.JWT_SECRET_KEY)

type Claim struct {
	Email string `json:"email"`
	jwt.StandardClaims
}

func (claim *Claim) SetJWT(email string) (string, time.Time, error) {

	expirationTime := time.Now().Add(24 * time.Hour)

	claim.Email = email
	claim.StandardClaims = jwt.StandardClaims{
		// In JWT, the expiry time is expressed as unix milliseconds
		ExpiresAt: expirationTime.Unix(),
	}

	// Declare the token with the algorithm used for signing, and the claims
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claim)

	// Create the JWT string
	tokenString, err := token.SignedString(jwtKey)
	if err != nil {
		// If there is an error in creating the JWT return an internal server error
		return "", time.Time{}, err
	}

	return tokenString, expirationTime, nil
}

func (claim *Claim) CheckJWT(tokenString string) error {

	// Parse the JWT string and store the result in `claims`.
	// Note that we are passing the key in this method as well. This method will return an error
	// if the token is invalid (if it has expired according to the expiry time we set on sign in),
	// or if the signature does not match
	token, err := jwt.ParseWithClaims(tokenString, claim, func(token *jwt.Token) (interface{}, error) {
		return jwtKey, nil
	})

	if !token.Valid {
		return errors.New("unauthorized")
	}

	if err != nil {
		if err == jwt.ErrSignatureInvalid {
			return errors.New("unauthorized")
		}
		return errors.New("bad request")
	}

	return nil

}

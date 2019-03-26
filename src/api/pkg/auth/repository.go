package auth

import (
	"errors"
	"fmt"
	"time"

	"github.com/opam22/starter/driver"
)

type AuthRepository struct {
	DB  driver.DBHandler
	JWT driver.JWTHandler
}

func (r *AuthRepository) Login(loginCredential LoginCredential) (string, time.Time, error) {

	var count int

	err := r.DB.QueryRow(fmt.Sprintf("SELECT count(*) FROM users WHERE email = '%s' AND password = '%x' LIMIT 1", loginCredential.Email, loginCredential.Password)).Scan(&count)

	if err != nil {
		return "", time.Time{}, err
	}

	if count == 0 {
		return "", time.Time{}, errors.New("Account not found")
	}

	tokenString, expirationTime, err := r.JWT.SetJWT(fmt.Sprintf("%s", loginCredential.Email))

	if err != nil {
		return "", time.Time{}, err
	}

	return tokenString, expirationTime, nil
}

func (r *AuthRepository) Logout(tokenStr string) error {

	err := r.JWT.CheckJWT(tokenStr)
	if err != nil {
		return err
	}
	return nil
}

package auth

import (
	"crypto/sha512"
	"errors"
	"time"
)

type AuthService struct {
	Repo Repository
}

func (s *AuthService) Login(loginCredential LoginCredential) (string, time.Time, error) {
	// logic here

	// convert type interface{} to string
	if strPassword, ok := loginCredential.Password.(string); ok {
		// encrypt password using sha512
		crypter := sha512.New()
		crypter.Write([]byte(strPassword))
		loginCredential.Password = crypter.Sum(nil)

		return s.Repo.Login(loginCredential)
	}

	return "", time.Time{}, errors.New("Something wrong with your password.")

}

func (s *AuthService) Logout(tokenStr string) error {

	return s.Repo.Logout(tokenStr)

}

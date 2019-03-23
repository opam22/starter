package auth

import (
	"crypto/sha512"
	"errors"
)

type AuthService struct {
	Repo Repository
}

func (s *AuthService) Login(loginCredential LoginCredential) (int64, error) {
	// logic here

	// convert type interface{} to string
	if strPassword, ok := loginCredential.Password.(string); ok {
		// encrypt password using sha512
		crypter := sha512.New()
		crypter.Write([]byte(strPassword))
		loginCredential.Password = crypter.Sum(nil)

		return s.Repo.Login(loginCredential)
	}

	return 0, errors.New("Something wrong with your password.")

}

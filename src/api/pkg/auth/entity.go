package auth

import (
	"github.com/dgrijalva/jwt-go"
)

type LoginCredential struct {
	Email    string `json:"email"`
	Password interface{}
	jwt.StandardClaims
}

type HTTPResponse struct {
	StatusCode int    `json:"status_code"`
	Message    string `json:"message"`
}

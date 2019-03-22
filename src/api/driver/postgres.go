package driver

import (
	"database/sql"

	_ "github.com/lib/pq"
)

type PostgresHandler struct {
	Conn *sql.DB
}

func (handler *PostgresHandler) Execute(statement string) (sql.Result, error) {
	res, err := handler.Conn.Exec(statement)
	if err != nil {
		return nil, err
	}

	return res, nil
}

func (handler *PostgresHandler) Query(statement string) (Row, error) {
	rows, err := handler.Conn.Query(statement)

	if err != nil {
		return new(MySQLRow), err
	}
	row := new(MySQLRow)
	row.Rows = rows

	return row, nil
}

type PostgresRow struct {
	Rows *sql.Rows
}

func (r PostgresRow) Scan(dest ...interface{}) error {
	err := r.Rows.Scan(dest...)
	if err != nil {
		return err
	}

	return nil
}

func (r PostgresRow) Next() bool {
	return r.Rows.Next()
}

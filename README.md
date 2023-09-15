# README

This README would normally document whatever steps are necessary to get the
application up and running.

- Docker + docker-compose:
  ```bash
  docker-compose build
  docker-compose up
  ```

DEMO: https://quanghn.onrender.com

APIs
- Sign up
  ```http
  POST /api/users
  ```
  Body
  ```json
  {
    "user": {
      "email": "quanghn@mail.com",
      "name": "quang",
      "password": "123123"
    }
  }
  ```
  Response
  ```json
  {
    "email": "quanghn@mail.com",
    "access_token": "xxx"
  }
  ```

- Log in
  ```http
  POST /api/users/log_in
  ```
  Body
  ```json
  {
    "email": "quanghn@mail.com",
    "password": "123123"
  }
  ```
  Response
  ```json
  {
    "access_token": "xxx"
  }
  ```

- Shorten generate
  ```http
  POST /api/v1/short_links
  ```
  Body
  ```json
  {
    "original_url": "https://google.com"
  }
  ```
  Response
  ```json
  {
    "short_link": "https://quanghn.onrender.com/PTlS9"
  }
  ```

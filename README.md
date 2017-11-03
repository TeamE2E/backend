**Sign In**
----
  Sign in.

* **URL**

  /auth/sign_in

* **Method:**

  `POST`

*  **URL Params**

   None

* **Data Params**

  **Required:**

   `email=[string]`

   `password=[string]`

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{
      "data": {
        "id": 1,
        "email": "test@test.com",
        "provider": "email",
        "uid": "test@test.com",
        "name": null,
        "nickname": null,
        "image": null
      }
    }`

* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{
      "errors": [
        "Invalid login credentials. Please try again."
      ]
    }`

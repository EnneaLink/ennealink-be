<!-- PROJECT INFO -->
<h1 align="center">
  <br>
  <a href="https://github.com/EnneaLink/ennealink-be">
    <img src="" alt="Logo" width="200" height="200"></a>
  <br>
  EnneaLink API
  <br>
</h1>
  
  
<!-- CONTENTS -->
<p align="center">
  <a href="#about-the-project">About The Project</a> •
  <a href="#tools-used">Tools Used</a> •
  <a href="#set-up">Set Up</a> •
  <a href="#installation">Installation</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#database-schema">Database Schema</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#acknowledgements">Acknowledgements</a>
</p>



## About The Project


### Learning Goals




## Tools Used

| Development | Testing       | Gems            |
|   :----:    |    :----:     |    :----:       |
| Ruby 2.7.2  | RSpec         | Pry             |
| Rails 5.2.5 | WebMock       | ShouldaMatchers |
| JSON        | VCR           | Faraday         |
| Atom        | SimpleCov     | Figaro          |
| Github      | FactoryBot    | FastJSON        |
| CircleCI    | Faker         |                 |
| Heroku      | Rubocop       |                 |



## Set Up

1. To clone and run this application, you'll need Ruby 2.7.2 and Rails 2.5.3. Using [rbenv](https://github.com/rbenv/rbenv) you can install Ruby 2.7.2 (if you don't have it already) with:
```sh
rbenv install 2.7.2
```
2. With rbenv you can set up your Ruby version for a directory and all subdirectories within it. Change into a directory that will eventually contain this repo and then run:
```sh
rbenv local 2.7.2
```
You can check that your Ruby version is correct with `ruby -v`

3. Once you have verified your Ruby version is 2.7.2, check if you have Rails. From the command line:
```sh
rails -v
```
4. If you get a message saying rails is not installed or you do not have version 5.2.5, run
```sh
gem install rails --version 5.2.6
```
5. You may need to quit and restart your terminal session to see these changes show up



## Installation
1. Fork this repo
2. Clone your new repo
   ```sh
   git clone git@github.com:EnneaLink/ennealink-be.git
   ```
3. Install PostgresQL
   ```
   brew install postgresql
   ```
4. Install PostgresQL app [here](https://www.postgresql.org/download/)
5. Install gems
   ```sh
   bundle install
   ```
6. Setup the database
    ```sh
   rails db:create
   rails db:migrate
   ```


## How To Use




### Endpoint Documentation

Request:
POST `/graphql`

Query:
```graphql
{
   getUserStats(id: "#{@u1.id}") {
     id
     username
     enneagram{
       id
       number
       name
       description
       link
     }
     myersBrigg{
       id
       typeOf
       name
       description
       link
     }
     friends{
       id
       username
       enneagram{
       id
       number
       name
       description
       link
       }
       myersBrigg{
         id
         typeOf
         name
         d  
         link
       }
     }
   }
 }
 ```

Response:
```json
{"data":
  {"getUserStats":
    {"id":"4",
     "username":"funbucket",
     "enneagram":
      {"id":"1",
       "number":1,
       "name":"The Reformer",
       "description":"Ones are conscientious and ethical, with a strong sense of right and wrong… Well-organized, orderly, and fastidious, they try to mai
ntain high standards, but can slip into being critical and perfectionistic.",
       "link":"https://www.enneagraminstitute.com/type-1"},
     "myersBrigg":
      {"id":"2",
       "typeOf":"ISFJ",
       "name":"The Defender",
       "description":"These people tend to be warm and unassuming in their own steady way. They’re efficient and responsible, giving careful attention to
practical details in their daily lives.",
       "link":"https://www.16personalities.com/isfj-personality"},
     "friends":
      [{"id":"5",
        "username":"gerdy",
        "enneagram":
         {"id":"1",
          "number":1,
          "name":"The Reformer",
          "description":"Ones are conscientious and ethical, with a strong sense of right and wrong… Well-organized, orderly, and fastidious, they try to
maintain high standards, but can slip into being critical and perfectionistic.",
          "link":"https://www.enneagraminstitute.com/type-1"},
        "myersBrigg":
         {"id":"2",
          "typeOf":"ISFJ",
          "name":"The Defender",
          "description":"These people tend to be warm and unassuming in their own steady way. They’re efficient and responsible, giving careful attention
to practical details in their daily lives.",
          "link":"https://www.16personalities.com/isfj-personality"}}]}}}
```

Request:
POST `/graphql`

Query:
```graphql
mutation {
  user: createUser(
  authProvider: {
    credentials: {
      username: "Gertie",
      password: "password"
    }
  }
  {
    id
    username
    }
  }
 ```

Response:
```json
{
"data":{
  "user":{
    "id":"2",
    "username":"Gertie"
    }
  }
}
```

## Database Schema




## Contributing

👤  **Kim Abcouwer**
- [GitHub](https://github.com/kabcouwer)
- [LinkedIn](https://www.linkedin.com/in/kim-abcouwer)

👤  **Gunnar Runkle**
- [GitHub](https://github.com/gunnarrunner)
- [LinkedIn]()

👤  **Hayley Witherell**
- [GitHub](https://github.com/hayleyw7)
- [LinkedIn]()

👤  **Mark Cawthray**
- [GitHub](https://github.com/MTCawthray)
- [LinkedIn]()

👤  **Natalie McIntyre**
- [GitHub](https://github.com/nataliemcintyre2021)
- [LinkedIn]()

<!-- PROJECT INFO -->
<h1 align="center">
  <br>
  <a href="https://github.com/EnneaLink/ennealink-be">
    <img src="https://user-images.githubusercontent.com/76886492/139290920-ef1226f4-dbfa-47e1-9676-cc7c61b34b58.png" alt="Logo" width="200" height="200"></a>
  <br>
  EnneaLink API
  <br>
</h1>
 
 <p allight="center"> <a href="https://app.circleci.com/pipelines/github/EnneaLink/ennealink-be">
    <img src="https://circleci.com/gh/EnneaLink/ennealink-be.svg?style=svg" alt="build_badge">
  </a>
  </p>
<!-- CONTENTS -->
<p align="center">
  <a href="#about-the-project">About The Project</a> •
  <a href="#tools-used">Tools Used</a> •
  <a href="#set-up">Set Up</a> •
  <a href="#installation">Installation</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#endpoint-documentation">Endpoint Documentation</a> •
  <a href="#database-schema">Database Schema</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#acknowledgements">Acknowledgements</a>
</p>



## About The Project

A social app that is used to make connections with friends and learn more about personality profiles.


### Learning Goals
- Create a full stack app with a React Front End and a Rails Back End
- Implement GraphQL queries and mutations
- Secure Authentication through GraphQL queries
- Using CORS for secure connection and optimized security



## Tools Used

| Development | Testing       | Gems            |
|   :----:    |    :----:     |    :----:       |
| Ruby 2.7.2  | RSpec         | Pry             |
| Rails 5.2.5 | SimpleCov     | ShouldaMatchers |
| GraphQL     | FactoryBot    | BCrypt          |
| Atom        | Faker         | Rack-cors       |
| Github      | Rubocop       |                 |
| CircleCI    |               |                 |
| Heroku      |               |                 |



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
   rails db:seed
   ```


## How To Use
The Front End React app posts to the `/graphql` endpoint and sends request queries or mutations in order to create new users, login existing users, update profiles with personality data, or create/remove friends. To learn more about GraphQL implementation in Ruby on Rails visit [this site](https://www.howtographql.com/).



## Endpoint Documentation

### Get User Stats
Request Query:
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
       "description":
        "Ones are conscientious and ethical, with a strong sense of right and wrong… Well-organized, orderly, and fastidious, they try to maintain high standards, but can slip into being critical and perfectionistic.",
       "link":"https://www.enneagraminstitute.com/type-1"},
     "myersBrigg":
      {"id":"2",
       "typeOf":"ISFJ",
       "name":"The Defender",
       "description":
        "These people tend to be warm and unassuming in their own steady way. They’re efficient and responsible, giving careful attention to practical details in their daily lives.",
       "link":"https://www.16personalities.com/isfj-personality"},
     "friends":
      [{"id":"5",
        "username":"gerdy",
        "enneagram":
         {"id":"1",
          "number":1,
          "name":"The Reformer",
          "description":
           "Ones are conscientious and ethical, with a strong sense of right and wrong… Well-organized, orderly, and fastidious, they try to maintain high standards, but can slip into being critical and perfectionistic.",
          "link":"https://www.enneagraminstitute.com/type-1"},
        "myersBrigg":
         {"id":"2",
          "typeOf":"ISFJ",
          "name":"The Defender",
          "description":
           "These people tend to be warm and unassuming in their own steady way. They’re efficient and responsible, giving careful attention to practical details in their daily lives.",
          "link":"https://www.16personalities.com/isfj-personality"
          }
        }
      ]
    }
  }
}
```

### Get User
Request Query:
```graphql
{
  getUser(id: "#{@u1.id}") {
    id
    username
  }
}
```

Response:
```json
{
"data": { 
  "getUser": {
    "id": "15",
    "username": "funbucket"
    }
  }
}
```

### Get All Users
Request Query:
```graphql
{
  getAllUsers {
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
  }
}
```

Response:
```json
{"data":
  {"getAllUsers":
    [{"id": "12",
      "username": "funbucket",
      "enneagram":
       {"id": "19",
        "number": 1,
        "name": "The Reformer",
        "description": 
         "Ones are conscientious and ethical, with a strong sense of right and wrong… Well-organized, orderly, and fastidious, they try to maintain high standards, but can slip into being critical and perfectionistic.",
        "link": "https://www.enneagraminstitute.com/type-1"},
      "myersBrigg": 
       {"id": "34",
        "typeOf": "ISFJ",
        "name": "The Defender",
        "description": 
         "These people tend to be warm and unassuming in their own steady way. They're efficient and responsible, giving careful attention to practical details in their daily lives.",
        "link": "https://www.16personalities.com/isfj-personality"}},
     {"id": "13",
      "username": "gertie",
      "enneagram": 
       {"id": "19",
        "number": 1,
        "name": "The Reformer",
        "description": 
         "Ones are conscientious and ethical, with a strong sense of right and wrong… Well-organized, orderly, and fastidious, they try to maintain high standards, but can slip into being critical and perfectionistic.",
        "link": "https://www.enneagraminstitute.com/type-1"},
      "myersBrigg": 
       {"id": "34",
        "typeOf": "ISFJ",
        "name": "The Defender",
        "description": 
         "These people tend to be warm and unassuming in their own steady way. They're efficient and responsible, giving careful attention to practical details in their daily lives.",
        "link": "https://www.16personalities.com/isfj-personality"
        }
      }
    ]
  }
}
```


### User Registration
Request Mutation:
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

### User Login
Request Mutation:
```graphql
mutation {
  loginUser(
    username: "Gertie",
    password: "password"
  )
    {
      id
      success
    }
  }
 ```
 
 Response:
 ```json
 {
 "loginUser": {
    "id": "8", 
    "success": true
    }
 }
 ```
 
 ### Update User Profile
 Request Mutation:
 ```graphql
 mutation {
    updateUser(
        id: "#{@pam.id}"
        username: "Carl Crockett"
        myersBrigg: "ESFJ"
        enneagram: "8"
      )
      {
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
      }
    }
 ```
 
 Response:
 ```json
 {
 "updateUser": {
   "id": "10",
   "username": "peter.trantow",
   "enneagram": {
     "id": "8",
     "number": 8,
     "name": "The Challenger",
     "description":
      "Eights are self-confident, strong, and assertive. Protective, resourceful, straight-talking, and decisive, but can also be ego-centric and domineering.",
     "link": "https://www.enneagraminstitute.com/type-8"},
   "myersBrigg": {
     "id": "14",
     "typeOf": "ESFJ",
     "name": "The Consul",
     "description": 
      "They are attentive and people-focused, and they enjoy taking part in their social community. Their achievements are guided by decisive values, and they willingly offer guidance to others.",
     "link": "https://www.16personalities.com/esfj-personality"
     }
   }
 }
 ```
 
 ### Add Friend
 Request Mutation:
 ```graphql
 mutation {
   addFriend(
       userId: "#{@pam.id}"
       friendId: "#{@metal.id}"
     )
     {
       success
     }
   }
 ```
 
 Response:
 ```json
 {
 "addFriend": {
   "success": true
   }
 }
 ```
 
 ### Remove Friend
 Request Mutation:
 ```graphql
 mutation {
    deleteFriend(
        userId: "#{@pam.id}"
        friendId: "#{@metal.id}"
      )
      {
        success
      }
    }
 
 ```
 
 Response:
 ```json
 {
 "deleteFriend": {
   "success": true
   }
 }
 ```

## Database Schema
![image](https://user-images.githubusercontent.com/80797707/139114722-95286571-1472-4b14-8968-a382707d6f13.png)



## Contributing

👤  **Kim Abcouwer**
- [GitHub](https://github.com/kabcouwer)
- [LinkedIn](https://www.linkedin.com/in/kim-abcouwer)

👤  **Gunnar Runkle**
- [GitHub](https://github.com/gunnarrunner)
- [LinkedIn](https://www.linkedin.com/in/gunnar-runkle/)

👤  **Hayley Witherell**
- [GitHub](https://github.com/hayleyw7)
- [LinkedIn](https://www.linkedin.com/in/hayleywitherell/)

👤  **Mark Cawthray**
- [GitHub](https://github.com/MTCawthray)
- [LinkedIn](https://www.linkedin.com/in/mark-cawthray-996522212/)

👤  **Natalie McIntyre**
- [GitHub](https://github.com/nataliemcintyre2021)
- [LinkedIn](https://www.linkedin.com/in/nataliemcintyre1/)

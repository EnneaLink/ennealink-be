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
gem install rails --version 5.2.5
```
5. You may need to quit and restart your terminal session to see these changes show up



## Installation



## How To Use




### Endpoint Documentation

Request:
`/api/v1/users/:id`

Response:
```json
{
  "data": {
  "id": "133",
  "type": "user",
  "attributes": {
    "usernamename": "funbucket89",
    "email": "shameka_goyette@bartell.co",
    "myers_briggs": {
      "id": "1",
      "type": "ENFP",
      "name": "The Campaigner",
      "descriptions": "A Campaigner (ENFP) is someone with the Extraverted, Intuitive, Feeling, and Prospecting personality traits..."
      }
      "enneagram": {
      "id": "1",
      "number": "7",
      "name": "The Enthusiast",
      "descriptions": "Enneagram Sevens have the motivational need to experience life to the fullest and avoid pain. Sevens value a sense of freedom and focus on optimism..."
      }
    }
  }
}
```


<br>
Request:
`/api/v1/users/:id/friends`

Response:
```json
{
  "data": [
      {
        "id": 175,
        "type": "friend",
        "attributes": {
          "username": "gunbunz",
          "myers_briggs": "INTP",
          "enneagram": 4,
          "user_id": 145
        }
      },
      {
        "id": 184,
        "type": "friend",
        "attributes": {
          "username": "samip",
          "myers_briggs": "INFP",
          "enneagram": 3,
          "user_id": 145
        }
      }
   ]
}
```


<br>
Request:
`/api/v1/users`

Response:
```json
{
  "data": [
      {
        "id": 17,
        "type": "user",
        "attributes": {
          "username": "pizzaslice95",
          "myers_briggs": "INTP",
          "enneagram": 4,
        }
      },
      {
        "id": 18,
        "type": "user",
        "attributes": {
          "username": "samip",
          "myers_briggs": "INFP",
          "enneagram": 3,
        }
      }
   ]
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

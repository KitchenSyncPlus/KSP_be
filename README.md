<div id="header" align="center">

<img width="762" alt="KitchenSync Logo" src="https://images.prismic.io/carbmanager/68bd7d46-5f50-413c-97fe-e37b1c816159_Header-LowFODMAP.jpg?auto=compress%2Cformat&w=0.5&auto=format&fit=max">
</div>

<h1 align="center"> Welcome to KitchenSync+</h1>
<h2 align="center">Helping you synchronize meal planning </h2>

(Want to hire the devs that worked on this project? Click [this link](#contributors) to jump to our project contributors!)

This repo is the Back End part of a project built by students at [Turing School of Software and Design](https://turing.edu/). The project itself is an original web app designed by combined Front End and Back End teams. Its purpose is to help individuals search for recipes and create a shopping list of ingredients that can be divvied up among members of an event or group. 

Visit our Front End Site!
- [KitchenSync+]()

Our Back End is hosted here and requires API keys from [Kroger](https://developer.kroger.com/reference) and [Edamam](https://www.edamam.com/) to access:
- [KitchenSync+ API]()




## Setup
If you'd like to demo this API on your local machine:
1. Ensure that you have the prerequisites or equivalent
2. Clone this repo and navigate to the root folder `cd KSP_be`
3. Run `bundle install`
4. Run `bundle exec figaro install`
5. In `application.yml` add the corresponding keys and ids from [Kroger](https://developer.kroger.com/reference) and [Edamam](https://www.edamam.com/)
```yml
edamam_app_id: 
edamam_app_key:
kroger_key_encoded:
``` 
6. Run `rails db:{drop,create,migrate,seed}`
5. (Optional) To run the test suite, run `bundle exec rspec`
6. Run `rails s`

You should now be able to hit the API endpoints using Postman or a similar tool.<br>
Default host is `http://localhost:3001`


## Database Schema
![Database Schema Image](/app/assets/images/schema_design.png)


## Endpoints
- Recipes
  - `GET /api/v1/recipe`
  - ```
    {
        "label": 
        "image": 
        "yield": 
        "ingredientLines": [
        ],
        "ingredients": [
            {
                "quantity": 
                "measure": 
                "food": 
                "image": 
            },
            {
                "quantity": 
                "measure": 
                "food": 
                "image": 
        ],
        "ext_id": 
        "source_url": 
    }
- Users
  - `GET /api/v1/users/:id`
  - ```
    {
        "data": {
            "id": 
            "type": 
            "attributes": {
                "name": 
                "email": 
                "groups": 
            }
        }
    }
    ```
- Groups
  - `GET /api/v1/groups`
  - ```
    {
    "data": [
        {
            "id": "1",
            "type": "group",
            "attributes": {
                "name": 
                "about": 
                "users": 
            }
        },
        {
            "id": "2",
            "type": "group",
            "attributes": {
                "name" 
                "about": 
                "users": 
            }
        }
    }
    ```






## Contributors

<table>
  <tr>
    <td><img src="https://avatars.githubusercontent.com/u/108506841?v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/35391349?v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/106942456?v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/99838997?v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/98673086?v=4"></td>
    <td><img src="https://avatars.githubusercontent.com/u/36166420?v=4"></td>
    
  </tr>
  <tr>
    <td>Mackenzie Leng</td>
    <td>Michael Marchand</td>
    <td>Astrid Hecht</td>
    <td>Sage Skaff</td>
    <td>Lucas Cowell</td>
    <td>Kevin Ta</td>
  </tr>
  <tr>
    <td>
      <a href="https://github.com/kenzjoy">GitHub</a><br>
      <a href="https://www.linkedin.com/in/kenzjoydev/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/MarchandMD">GitHub</a><br>
      <a href="https://www.linkedin.com/in/mmarchand1/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/Astrid-Hecht">GitHub</a><br>
      <a href="https://www.linkedin.com/in/astrid-hecht/">LinkedIn</a>
    </td>
    <td>
      <a href="https://github.com/sage-skaff">GitHub</a><br>
      <a href="https://www.linkedin.com/in/sageskaff/">LinkedIn</a>
    </td>
     <td>
      <a href="https://github.com/sage-skaff">GitHub</a><br>
      <a href="https://www.linkedin.com/in/sageskaff/">LinkedIn</a>
    </td>
     <td>
      <a href="https://github.com/lcole37">GitHub</a><br>
      <a href="https://www.linkedin.com/in/lucas-colwell-b3a753179/">LinkedIn</a>
    </td>
  </tr>
</table>

### Instructor/Project Manager
Meg Stang
# Store API

## Versions
below are the versions used to create this app
- ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux]
- Rails 7.0.4.2
- node v19.3.0
- yarn 1.22.19
- database: postgres (PostgreSQL) 15.1

## Getting Started

Clone the repo:
```sh
git@github.com:desoto13/store_api.git
```

Run the bundler
```sh
bundle install
```

Assuming the postgresql has already been setup with the app, intiate the database
```sh
pg_ctl start
(Note: kindly create a postgres user profile store_user via postgres CLI) 
rails db:create
```
Run the migrations
```sh
rails db:migrate
```

## Running the app
Seeding the tasks (There should be a total of 1 store and 4 products)
```sh
rails db:seed
```
Run the server
```sh
rails s
```

## API definitions
Store
| VERB | Endpoints | Body Params | Description |
|:----:|:---------:|:-----------:|:-----------:|
| GET | /api/v1/stores | N/A | List all of the stores |
| GET | /api/v1/stores/`store_id` | N/A | Retrieve a store |
| POST | /api/v1/stores | { "name": `store name`, "url": `store url` } | Create a store |
| PATCH/PUT | /api/v1/stores/`store_id` | { "name": `store name`, "url": `store url` } | Update a store |
| DELETE | /api/v1/stores/`store_id` | N/A | Delete a store |


Products
| VERB | Endpoints | Body Params | Description |
|:----:|:---------:|:-----------:|:-----------:|
| GET | /api/v1/stores/`store_id`/products | N/A | List all of the products in a store |
| GET | /api/v1/stores/`store_id`/products/`product_id` | N/A | Retrieve a product |
| POST | /api/v1/stores/`store_id`/products | { "name": `product name`, "sku": `product sku`, "inventory_quantity": `quantity of the product in the inventory` } | Create a product |
| PATCH/PUT | /api/v1/stores/`store_id`/products/`product_id`/inventory | { "inventory_quantity": `quantity of the product in the inventory` } | Update the product inventory |
| DELETE | /api/v1/stores/`store_id`/products/`product_id` | N/A | Delete the product |


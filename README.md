![Ruby on Rails Badge](https://img.shields.io/badge/Ruby_on_Rails-7.0-orange)
[![Rails Build & Tests](https://github.com/Beleg-6-EAP/demo-soa-ecommerce/actions/workflows/rails-build-test.yml/badge.svg)](https://github.com/Beleg-6-EAP/demo-soa-ecommerce/actions/workflows/rails-build-test.yml)

# Service-oriented Architecture E-Commerce Demo

This repository provides a minimal example showcasing the Service-oriented Architecture in an E-Commerce setting.
This setting includes orders, payment and shipping.

This demo is part of an article on Enterprise Architecture-Patterns.
The article, including the complete explanation of the E-Commerce-Example, can be found [here](https://github.com/Beleg-6-EAP/Belegarbeit).

## Get running

Either run the docker image via plain docker:
```bash
bash> sudo docker build -t demo-soa-ecommerce .
bash> sudo docker run -p 8080:8080 demo-soa-ecommerce  
```
or with the given `docker-compose`:
```bash
bash> sudo docker-compose up
```

Either will start a web-server running on `http://localhost:8080` with the following endpoints:

- CreateOrder: `POST /api/orders`
- AllOrders: `GET /api/orders`
- AllPayments: `GET /api/payments`
- AllShipments: `GET /api/shipments`

We start with en empty database.
To create an order `POST` below request to `http://localhost:8080/api/orders`: 

```json
{
    "user_id": "1234-5678-8765-4321",
    "amount": 42.0,
}
```

This will initiate payment as well as shipment.

It's success can be checked by requesting the other endpoints via `GET`.

## Troubleshooting

If there is any trouble or if you have any questions, feel free to open an issue!

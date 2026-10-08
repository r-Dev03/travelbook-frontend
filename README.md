# TravelBook Frontend

**Angular client for the TravelBook vacation booking platform.**

[![Angular](https://img.shields.io/badge/Angular-14-red.svg)](https://angular.io/)
[![TypeScript](https://img.shields.io/badge/TypeScript-4.7-blue.svg)](https://www.typescriptlang.org/)

Customers browse vacation packages, pick excursions, build a cart, and check out. All data and order processing come from the [TravelBook Backend](https://github.com/r-Dev03/travelbook-backend), a Spring Boot REST API.

**Built on:** an Angular starter template. The backend this client talks to (data model, repositories, and transactional checkout) lives in the [backend repository](https://github.com/r-Dev03/travelbook-backend).

## Pages

| View | What it does |
|------|--------------|
| `vacation`, `vacation-detail` | Browse packages and view one in detail |
| `excursion`, `excursion-detail` | Browse a vacation's excursions and add them to the cart |
| `cart`, `cart-summary` | Review the order and submit it |
| `add-customer`, `edit-customer`, `view-customer` | Customer details, with country and division lookups |
| `order-confirmation` | Shows the tracking number returned by checkout |

## Getting Started

**Prerequisites:** Node.js 16+, and the [backend](https://github.com/r-Dev03/travelbook-backend) running on `http://localhost:8080`.

```bash
git clone https://github.com/r-Dev03/travelbook-frontend.git
cd travelbook-frontend
npm install
npm start
```

Open `http://localhost:4200`.

The API address (`http://localhost:8080/api/...`) is set directly in each component under `src/app/views/`, so the backend needs to run on port 8080.

## Tech Stack

Angular 14 · TypeScript · RxJS · Angular Material

## Known Limitations

- **Hard-coded API URLs.** Each component points at `localhost:8080`, so the backend must run there.
- **Single demo customer.** The cart and checkout views look up customer `1` rather than the customer created in `add-customer`.

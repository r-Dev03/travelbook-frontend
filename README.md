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
| `cart` | Side panel inside the vacation and excursion views, showing the current cart |
| `cart-summary` | Review the order before checking out |
| `order-confirmation` | Submits the order to `/api/checkout/purchase` and shows the returned tracking number |
| `add-customer`, `edit-customer`, `view-customer` | Customer details, with country and division lookups |

## Getting Started

**Prerequisites:** Node.js 16.10+, and the [backend](https://github.com/r-Dev03/travelbook-backend) running on `http://localhost:8080`.

```bash
git clone https://github.com/r-Dev03/travelbook-frontend.git
cd travelbook-frontend
npm install
npm start
```

Open `http://localhost:4200`.

With Nix, run `nix develop` first to get Node 22 and the project's Angular CLI.

The API address (`http://localhost:8080/api/...`) is set directly in each component under `src/app/views/`, so the backend needs to run on port 8080.

## Tech Stack

Angular 14 · TypeScript · RxJS · Angular Material

## Known Limitations

- **Hard-coded API URLs.** Each component points at `localhost:8080`, so the backend must run there.
- **Orders go to the newest customer.** Each order is placed for the most recently created customer in the database, rather than one the user selects.

# TravelBook Frontend

**Angular 14 Frontend for Vacation Booking Platform**

[![Angular](https://img.shields.io/badge/Angular-14.2-red.svg)](https://angular.io/)
[![TypeScript](https://img.shields.io/badge/TypeScript-4.7-blue.svg)](https://www.typescriptlang.org/)
[![RxJS](https://img.shields.io/badge/RxJS-7.5-purple.svg)](https://rxjs.dev/)

## Overview

TravelBook Frontend is an Angular 14 application that provides the user interface for a vacation booking platform. It offers customers an intuitive experience for browsing vacation packages, selecting excursions, managing shopping carts, and completing bookings.

**Key Features:**
- Browse vacation packages with detailed information
- View and select excursions for each vacation
- Shopping cart management
- Customer information and checkout flow
- Responsive UI components

This frontend integrates with the [TravelBook Backend](https://github.com/r-Dev03/travelbook-backend) REST API.

## Tech Stack

**Framework:**
- Angular 14.2
- TypeScript 4.7
- RxJS 7.5

**Build Tools:**
- Angular CLI 14.2
- npm

## Prerequisites

- Node.js 16+ (LTS recommended)
- npm 8+
- Angular CLI 14.2

## Installation

### 1. Clone the repository
```bash
git clone https://github.com/r-Dev03/travelbook-frontend.git
cd travelbook-frontend
```

### 2. Install dependencies
```bash
npm install
```

**Note:** This may take a few minutes as it installs Angular 14 and all required packages.

### 3. Verify Angular CLI
```bash
ng version
```

You should see Angular CLI version 14.2.x.

## Configuration

### Backend API Endpoint

The application is configured to connect to the backend API at `http://localhost:8080/api`.

If your backend runs on a different host or port, update the API base URL in the environment files:

**`src/environments/environment.ts` (development):**
```typescript
export const environment = {
  production: false,
  apiUrl: 'http://localhost:8080/api'
};
```

**`src/environments/environment.prod.ts` (production):**
```typescript
export const environment = {
  production: true,
  apiUrl: 'https://your-backend-api.com/api'
};
```

## Running the Application

### Development Server
```bash
npm start
# or
ng serve
```

Navigate to `http://localhost:4200/`. The application will automatically reload if you change any source files.

**Note:** Make sure the [backend](https://github.com/r-Dev03/travelbook-backend) is running on `http://localhost:8080` before starting the frontend.

### Production Build
```bash
ng build --configuration production
```

The build artifacts will be stored in the `dist/` directory.

## Project Structure
```
travelbook-frontend/
├── src/
│   ├── app/
│   │   ├── model/                    # TypeScript models and DTOs
│   │   │   ├── cart.ts
│   │   │   ├── cart-item.ts
│   │   │   ├── customer.ts
│   │   │   ├── vacation.ts
│   │   │   ├── excursion.ts
│   │   │   ├── country.ts
│   │   │   ├── division.ts
│   │   │   ├── StatusType.ts
│   │   │   └── dto/                  # Data transfer objects
│   │   ├── services/
│   │   │   └── purchase-data.service.ts  # Shared purchase data service
│   │   ├── views/                    # Angular components
│   │   │   ├── vacation/             # Vacation list view
│   │   │   ├── vacation-detail/      # Vacation details
│   │   │   ├── excursion/            # Excursion list
│   │   │   ├── excursion-detail/     # Excursion details
│   │   │   ├── cart/                 # Shopping cart
│   │   │   ├── cart-summary/         # Cart summary
│   │   │   ├── add-customer/         # Customer registration
│   │   │   ├── edit-customer/        # Edit customer info
│   │   │   ├── view-customer/        # View customer info
│   │   │   └── order-confirmation/   # Order confirmation
│   │   ├── app.component.ts          # Root component
│   │   ├── app.module.ts             # Main module
│   │   └── app-routing.module.ts     # Routing configuration
│   ├── assets/                       # Static assets
│   ├── environments/                 # Environment configs
│   │   ├── environment.ts
│   │   └── environment.prod.ts
│   ├── index.html
│   ├── main.ts
│   └── styles.css                    # Global styles
├── angular.json                      # Angular workspace config
├── package.json                      # npm dependencies
├── tsconfig.json                     # TypeScript config
└── README.md
```

## Application Flow

### 1. Browse Vacations
Users can browse available vacation packages with destination details, pricing, and dates.

### 2. View Excursions
Each vacation displays associated excursions (activities, tours) that can be added to the booking.

### 3. Add to Cart
Users select a vacation and optional excursions, adding them to their shopping cart.

### 4. Enter Customer Information
During checkout, users provide their contact and address information.

### 5. Complete Purchase
The application submits the booking to the backend API and displays an order confirmation with a tracking number.

## Key Components

### Vacation Views
- **vacation/** - Lists all available vacation packages
- **vacation-detail/** - Shows detailed information for a selected vacation

### Excursion Views
- **excursion/** - Lists available excursions
- **excursion-detail/** - Shows detailed information for a selected excursion

### Cart Management
- **cart/** - Displays items in the shopping cart
- **cart-summary/** - Shows cart totals and checkout options

### Customer Management
- **add-customer/** - Customer registration form
- **edit-customer/** - Edit existing customer information
- **view-customer/** - Display customer details

### Checkout
- **order-confirmation/** - Displays successful booking confirmation

## Data Models

### Core Entities

**Vacation:**
```typescript
{
  id: number;
  vacationTitle: string;
  description: string;
  travelPrice: number;
  imageURL: string;
}
```

**Excursion:**
```typescript
{
  id: number;
  excursionTitle: string;
  excursionPrice: number;
  imageURL: string;
  vacationId: number;
}
```

**Customer:**
```typescript
{
  id: number;
  firstName: string;
  lastName: string;
  address: string;
  postal_code: string;
  phone: string;
}
```

**Cart:**
```typescript
{
  id: number;
  packagePrice: number;
  partySize: number;
  status: StatusType;
  customer: Customer;
}
```

## Backend Integration

This frontend requires the [TravelBook Backend](https://github.com/r-Dev03/travelbook-backend) to be running.

**Backend Endpoints Used:**
- `GET /api/vacations` - Fetch vacation packages
- `GET /api/excursions` - Fetch excursions
- `GET /api/customers` - Fetch customer data
- `POST /api/checkout/purchase` - Submit booking

**Full Stack Setup:**

1. **Start Backend:**
```bash
cd travelbook-backend
mvn spring-boot:run
# Backend runs on http://localhost:8080
```

2. **Start Frontend:**
```bash
cd travelbook-frontend
ng serve
# Frontend runs on http://localhost:4200
```

3. **Access Application:**
Open `http://localhost:4200` in your browser

## Development

### Running Tests
```bash
# Run unit tests
ng test

# Run tests with code coverage
ng test --code-coverage
```

### Code Scaffolding
```bash
# Generate a new component
ng generate component components/component-name

# Generate a new service
ng generate service services/service-name
```

### Linting
```bash
ng lint
```

## Deployment

### Build for Production
```bash
ng build --configuration production
```

The optimized build will be in the `dist/` directory and can be deployed to any static hosting service:

- **Netlify:** Drag and drop `dist/` folder
- **Vercel:** Connect GitHub repo for automatic deployments
- **AWS S3:** Upload `dist/` contents to S3 bucket with static hosting
- **GitHub Pages:** Use `ng deploy` with `angular-cli-ghpages`

### Environment Configuration

Update `src/environments/environment.prod.ts` for production API endpoints:
```typescript
export const environment = {
  production: true,
  apiUrl: 'https://your-backend-api.com/api'
};
```

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## License

MIT License - see LICENSE file for details

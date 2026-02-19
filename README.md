# TravelBook Frontend

**Angular Application for Vacation Booking Platform**

[![Angular](https://img.shields.io/badge/Angular-14.2-red.svg)](https://angular.io/)
[![TypeScript](https://img.shields.io/badge/TypeScript-4.7-blue.svg)](https://www.typescriptlang.org/)
[![Angular Material](https://img.shields.io/badge/Material-14.2-purple.svg)](https://material.angular.io/)

## Overview

TravelBook Frontend is an Angular 14 application that provides the user interface for a vacation booking platform. Built with Angular Material for responsive design, it offers customers an intuitive experience for browsing vacation packages, selecting excursions, and completing bookings.

**Key Features:**
- Browse vacation packages with detailed information
- Search and filter available excursions
- Add vacations and excursions to shopping cart
- Complete checkout process with customer information
- Responsive design with Angular Material

This frontend integrates with the [TravelBook Backend](https://github.com/yourusername/travelbook-backend) REST API.

## Tech Stack

**Framework:**
- Angular 14.2
- TypeScript 4.7
- RxJS 7.5

**UI Library:**
- Angular Material 14.2
- Angular Flex Layout 14.0

**Build Tools:**
- Angular CLI 14.2
- Karma/Jasmine (testing)

## Prerequisites

- Node.js 16+ (LTS recommended)
- npm 8+
- Angular CLI 14.2

## Installation

### 1. Clone the repository
```bash
git clone https://github.com/yourusername/travelbook-frontend.git
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

If your backend runs on a different host or port, update the API base URL in the service files located in `src/app/services/`.

**Example service configuration:**
```typescript
// src/app/services/vacation.service.ts
private baseUrl = 'http://localhost:8080/api/vacations';
```

## Running the Application

### Development Server
```bash
npm start
# or
ng serve
```

Navigate to `http://localhost:4200/`. The application will automatically reload if you change any source files.

**Note:** Make sure the [backend](https://github.com/yourusername/travelbook-backend) is running on `http://localhost:8080` before starting the frontend.

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
│   │   ├── components/           # UI components
│   │   │   ├── vacation-list/
│   │   │   ├── excursion-list/
│   │   │   ├── cart/
│   │   │   └── checkout/
│   │   ├── services/             # API services
│   │   │   ├── vacation.service.ts
│   │   │   ├── excursion.service.ts
│   │   │   ├── cart.service.ts
│   │   │   └── checkout.service.ts
│   │   ├── models/               # TypeScript interfaces
│   │   │   ├── vacation.ts
│   │   │   ├── excursion.ts
│   │   │   ├── customer.ts
│   │   │   └── cart.ts
│   │   ├── app.component.ts      # Root component
│   │   ├── app.module.ts         # Main module
│   │   └── app-routing.module.ts # Routing configuration
│   ├── assets/                   # Static assets
│   ├── environments/             # Environment configs
│   │   ├── environment.ts
│   │   └── environment.prod.ts
│   ├── index.html
│   ├── main.ts
│   └── styles.css               # Global styles
├── angular.json                 # Angular workspace config
├── package.json                 # npm dependencies
├── tsconfig.json                # TypeScript config
└── README.md
```

## Key Features

### Vacation Browsing
- Browse all available vacation packages
- View detailed information (destination, price, dates, description)
- Filter by destination or price range

### Excursion Selection
- View excursions associated with each vacation
- Add multiple excursions to a booking
- See excursion details (activity name, price, dates)

### Shopping Cart
- Add vacations with selected excursions
- Review items before checkout
- Remove items from cart
- See total price calculation

### Checkout Process
- Enter customer information (name, address, phone)
- Form validation for all required fields
- Submit booking to backend API
- Receive order confirmation with tracking number

### Responsive Design
- Mobile-friendly layout using Angular Flex Layout
- Material Design components for consistent UI
- Accessible form controls

## API Integration

### Services

The application uses Angular services to communicate with the backend REST API:

**VacationService**
```typescript
getVacations(): Observable<Vacation[]>
getVacation(id: number): Observable<Vacation>
searchVacations(title: string): Observable<Vacation[]>
```

**ExcursionService**
```typescript
getExcursions(): Observable<Excursion[]>
getExcursion(id: number): Observable<Excursion>
getExcursionsByVacation(vacationId: number): Observable<Excursion[]>
```

**CartService**
```typescript
addToCart(vacation: Vacation, excursions: Excursion[]): void
getCartItems(): Observable<CartItem[]>
removeFromCart(itemId: number): void
getTotalPrice(): number
```

**CheckoutService**
```typescript
purchase(customer: Customer, cartItems: CartItem[]): Observable<PurchaseResponse>
```

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

# Generate a new model
ng generate interface models/model-name
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

- **GitHub Pages:** Use `ng deploy` with `angular-cli-ghpages`
- **Netlify:** Drag and drop `dist/` folder
- **AWS S3:** Upload `dist/` contents to S3 bucket with static hosting
- **Vercel:** Connect GitHub repo for automatic deployments

### Environment Configuration

Update `src/environments/environment.prod.ts` for production API endpoints:
```typescript
export const environment = {
  production: true,
  apiUrl: 'https://your-backend-api.com/api'
};
```

## Backend Integration

This frontend requires the [TravelBook Backend](https://github.com/yourusername/travelbook-backend) to be running.

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

## Troubleshooting

**Issue: npm install fails**
- Solution: Clear npm cache: `npm cache clean --force`
- Try deleting `node_modules` and `package-lock.json`, then run `npm install` again

**Issue: Cannot connect to backend API**
- Solution: Verify backend is running on `http://localhost:8080`
- Check CORS configuration in backend allows `http://localhost:4200`
- Check browser console for specific error messages

**Issue: Port 4200 already in use**
- Solution: Kill the process using port 4200 or run on different port:
```bash
  ng serve --port 4300
```

**Issue: Angular Material styles not loading**
- Solution: Verify `@angular/material` styles are imported in `styles.css`:
```css
  @import '~@angular/material/prebuilt-themes/indigo-pink.css';
```

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## Future Enhancements

**User Experience:**
- User authentication and accounts
- Booking history and management
- Favorite/wishlist functionality
- Reviews and ratings system
- Advanced search and filtering

**Technical Improvements:**
- Upgrade to latest Angular version
- State management (NgRx or Akita)
- Progressive Web App (PWA) capabilities
- Internationalization (i18n)
- E2E testing with Cypress
- Performance optimization (lazy loading, OnPush change detection)

**Features:**
- Real-time availability checking
- Payment integration
- Email confirmation
- Social sharing
- Interactive maps for destinations

## Contributing

Contributions welcome! Please open an issue or submit a pull request.

## License

MIT License - see LICENSE file for details

---

*Angular frontend application demonstrating modern web development with Material Design, RESTful API integration, and responsive UI patterns.*

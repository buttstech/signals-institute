# Anne Huntington Laboratory - Corporate Website

Official corporate website for Anne Huntington Laboratory, showcasing our mission, research portfolio, and services.

## Quick Start

### Development

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Server will be available at http://localhost:3021
```

### Production

```bash
# Start production server
npm start

# Or using Docker
docker build -t annehuntingtonlaboratory:latest .
docker run -p 3021:3021 annehuntingtonlaboratory:latest
```

### Using Makefile

```bash
# Install dependencies
make install

# Start development server
make dev

# Build Docker image
make docker-build

# Start production with Docker
make up

# Stop Docker container
make down

# Check service health
make health

# View logs
make logs
```

## Project Structure

```
frontend/
├── index.html              # Home page
├── mission.html            # Mission page
├── community.html          # Community integration page
├── contracting.html        # Consulting services page
├── lab.html                # Huntington Applied overview
├── research.html           # Research portfolio (22 projects)
├── contact.html            # Contact form
├── css/
│   ├── ahl-custom.css      # AHL branding and inverted layout
│   ├── ahl-template.css    # Base template styles
│   ├── normalize.css       # CSS normalization
│   └── webflow.css         # Webflow framework
├── js/
│   └── webflow.js          # Webflow interactions
├── images/
│   ├── ahl-logo-landscape.png       # AHL landscape logo (home page)
│   ├── ahl-icon.png                 # AHL icon (non-home pages)
│   ├── huntington-applied-logo.png  # Huntington Applied logo
│   └── projects/                    # 22 project logos
├── server.js               # Express server
├── package.json            # Node.js dependencies
├── Dockerfile              # Docker configuration
└── README.md               # This file
```

## Pages

### Home Page
- 25% left sidepanel with AHL landscape logo
- "Mission Steady" tagline
- Navigation to all pages
- fullPage.js smooth scrolling

### Non-Home Pages
- 75% RIGHT sidepanel with AHL icon logo
- 25% LEFT scrollable content area
- Consistent navigation

### Research Page (Special)
- Huntington Applied logo in sidepanel
- Dual navigation (site + 22 projects)
- Project cards organized by category
- 16 projects with logos, 6 with placeholders

## Port Configuration

- **Development**: 3021
- **Production**: 3021 (configurable via PORT env var)

## Environment Variables

```bash
PORT=3021                    # Server port
HOST=0.0.0.0                 # Server host
NODE_ENV=production          # Environment mode
```

## Health Check

```bash
curl http://localhost:3021/health
```

Response:
```json
{
  "status": "healthy",
  "service": "annehuntingtonlaboratory",
  "timestamp": "2025-11-11T17:00:00.000Z"
}
```

## Docker

### Build
```bash
docker build -t annehuntingtonlaboratory:latest .
```

### Run
```bash
docker run -d -p 3021:3021 --name ahl annehuntingtonlaboratory:latest
```

### Health Check
```bash
docker exec ahl curl -f http://localhost:3021/health
```

## Dependencies

- **express**: Web server framework
- **compression**: Gzip compression middleware

## Development Dependencies

- **nodemon**: Auto-restart on file changes

## AHL Color Scheme & Typography

**Source**: `~/ahl/docs/design/assets/AHL_PROJECT_AESTHETICS_REFERENCE_SIMPLE.csv`

### Anne Huntington Laboratory (AHL)
Defined in `css/ahl-custom.css`:
- **Primary Font**: Playfair Display
- **Secondary Font**: Inter
- **Colors**:
  - Primary: #c27b7f (Rose/Mauve)
  - Secondary: #8fa890 (Sage Green)
  - Dark: #1a1a1a (Near Black)
  - Light: #f5f5f5 (Off White)
  - Accent: #6b8db5 (Steel Blue)
- **Tone**: scientific · sophisticated · measured · authoritative

### Huntington Applied LLC (Huntington)
Used on lab.html and research.html:
- **Primary Font**: Playfair Display
- **Secondary Font**: Work Sans
- **Colors**:
  - Dark: #222324 (Charcoal)
  - Primary: #CC7351 (Terracotta)
  - Light: #F5F4EF (Cream)
  - Secondary: #B6C2AE (Sage)
  - Accent: #5B7DA3 (Blue)
- **Tone**: Professional · Institutional · Corporate · Excellence

## Recent Changes

### 2025-11-11: Layout System & Branding Updates

**Alt Layout System (Non-Home Pages)**
- Created `.side-panel-alt` and `.content-wrap-alt` classes in `ahl-template.css`
- Flipped layout: 30% right panel + 70% left content (mirrors home page positioning)
- Only swapped left↔right positioning, maintained original widths (30%/70%)
- Added responsive media queries for alt classes:
  - 991px: Adjusted to 40% panel / 60% content with swapped margins
  - 767px: Full-width responsive behavior with padding adjustments

**Icon & Branding Fixes**
- Fixed primary icon: Updated to correct A symbol (4168x4168 source)
- Renamed text-based logo to `anne_huntington-logo-secondary-593x595.png`
- Generated favicon.ico (32x32) and webclip.png (180x180) from primary icon
- Created reusable favicon generation script: `~/ahl/spro/chamber/scripts/generate-favicon.js`
- Updated `images/ahl-icon-primary.png` with correct A symbol (104K vs 38K)

**CSS Architecture**
- `ahl-template.css`: Base template styles + alt layout classes
- `ahl-custom.css`: AHL/Huntington branding, colors, typography
- Both CSS files now loaded in HTML pages for complete styling

**Test Pages**
- Created `mission-test.html` as proof-of-concept for alt layout
- Applied alt classes throughout (19 content sections)
- Maintained fullPage.js section structure
- Ready for validation before applying to production pages

**Files Modified**
```
css/ahl-template.css          [Alt classes + media queries added]
css/ahl-custom.css            [Referenced in HTML]
images/ahl-icon-primary.png   [Replaced with correct file]
images/favicon.ico            [Generated from primary icon]
images/webclip.png            [Generated from primary icon]
mission-test.html             [Created as layout proof-of-concept]
```

**Asset Management**
- Chamber script: `~/ahl/spro/chamber/scripts/generate-favicon.js`
- Source assets: `~/ahl/spro/chamber/intake/logos/masters-square/`
- Naming convention: primary (A symbol) vs secondary (text-based logo)

## Documentation

### Implementation Guides
- **[FULLPAGE_SECTION_STRUCTURE.md](docs/FULLPAGE_SECTION_STRUCTURE.md)** - ⭐ Complete guide for fullPage.js section structure on non-home pages
- **[WEBSITE_COPY_DRAFT.md](docs/WEBSITE_COPY_DRAFT.md)** - All page content and copy
- **[CSS_CONFLICT_ANALYSIS.md](docs/CSS_CONFLICT_ANALYSIS.md)** - Layout system analysis

### Page Structure Reference
All non-home pages (Mission, Community, Contracting, Lab, Research, Contact) should follow the fullPage.js structure:
- Outer `fullpage-wrap` container
- Multiple `section` divs (one per content block)
- Each section with `content-wrap-alt` > `c-block-alt` + `text-wrap`
- Animations controlled by Webflow.js via `data-w-id` attributes

See `FULLPAGE_SECTION_STRUCTURE.md` for complete implementation details and examples.

## License

PROPRIETARY - Anne Huntington Laboratory

---

**Built with Mission Steady**

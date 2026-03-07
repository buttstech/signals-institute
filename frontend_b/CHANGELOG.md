# Changelog
All notable changes to the Anne Huntington Laboratory website will be documented in this file.

## [2025-11-11] - Layout System & Branding Updates

### Added
- **Alt Layout Classes**: Created `.side-panel-alt` and `.content-wrap-alt` in `ahl-template.css`
  - Flipped layout: 30% right panel + 70% left content (mirrors home page positioning)
  - Only swapped left↔right positioning, maintained original widths (30%/70%)
  - Properly uses margin-right: 30vw instead of margin-left
- **Responsive Media Queries**: Added breakpoints for alt classes
  - @991px: 40% panel / 60% content with swapped margins
  - @767px: Full-width responsive with padding adjustments
- **Favicon Generation Script**: Created reusable script at `~/ahl/spro/chamber/scripts/generate-favicon.js`
  - Generates favicon.ico (32x32) from high-res source
  - Generates webclip.png (180x180) for Apple devices
  - Command-line interface for easy reuse across projects
- **Test Page**: Created `mission-test.html` as proof-of-concept for alt layout
  - Applied alt classes throughout all 19 content sections
  - Maintains fullPage.js section structure
  - Ready for validation before production deployment

### Fixed
- **Primary Icon**: Updated `images/ahl-icon-primary.png` to correct A symbol
  - Source: `anne_huntington-icon-primary-4168x4168.png` (104K)
  - Previously was using wrong file (38K)
- **Favicon & Webclip**: Generated from correct primary icon
  - favicon.ico: 32x32 PNG format
  - webclip.png: 180x180 for Apple touch icon
- **Asset Naming**: Renamed text-based logo correctly
  - Old: `anne_huntington-icon-primary-593x595.png`
  - New: `anne_huntington-logo-secondary-593x595.png`
  - Correctly distinguishes icon (A symbol) vs logo (text-based)

### Changed
- **CSS Architecture**: Clarified separation of concerns
  - `ahl-template.css`: Base template styles + alt layout classes (shared structure)
  - `ahl-custom.css`: AHL/Huntington branding, colors, typography (customization)
  - Both files now properly referenced in HTML pages
- **HTML Structure**: Updated mission-test.html with proper class application
  - All `side-panel` → `side-panel-alt`
  - All `content-wrap` → `content-wrap-alt` (19 instances)
  - All `content-wrap ext-wrapper` → `content-wrap-alt ext-wrapper` (9 instances)

### Technical Details
- **Layout Swap Logic**: Only positioning changes, no width modifications
  - Original (home): left: 0%, right: auto, margin-left: 30vw
  - Alt (non-home): left: auto, right: 0%, margin-right: 30vw
- **Maintained Values**: width: 30%/70%, all flex properties, perspective settings
- **fullPage.js Integration**: Preserved section-based structure for smooth scrolling

### Files Modified
```
css/ahl-template.css           - Added alt classes + responsive media queries
css/ahl-custom.css             - Now properly referenced in HTML
images/ahl-icon-primary.png    - Replaced with correct A symbol (104K)
images/favicon.ico             - Generated from primary icon (32x32)
images/webclip.png             - Generated from primary icon (180x180)
mission-test.html              - Created as layout proof-of-concept
README.md                      - Added Recent Changes section
CHANGELOG.md                   - Created this file
```

### Asset Management
- **Chamber Integration**: Favicon generation script added to chamber scripts
- **Source Assets**: Located in `~/ahl/spro/chamber/intake/logos/masters-square/`
- **Naming Convention**: Established primary (symbol) vs secondary (text) distinction

### Next Steps
1. Validate mission-test.html layout at http://localhost:3021/mission-test.html
2. Test responsive behavior at breakpoints (991px, 767px, 479px)
3. Apply alt classes to production pages (mission.html, community.html, contracting.html, lab.html, research.html, contact.html)
4. Verify Webflow animations work with alt layout
5. Replace legacy portfolio content on home page with AHL content

---

## Archive

### Prior to 2025-11-11
- Initial website setup with Webflow template
- Home page with 25% left panel layout
- Six main pages created (mission, community, contracting, lab, research, contact)
- AHL and Huntington Applied branding established
- fullPage.js smooth scrolling implemented
- Express server with health check endpoint
- Docker containerization setup

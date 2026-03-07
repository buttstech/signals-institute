# The Signals Institute Website Conversion - Working Document

## Goal

Convert The Signals Institute website from a failed custom build to a clean, working site based on Anne Huntington Laboratory's proven template, with proper branding, colors, and content structure.

## Instructions

- **DO NOT modify CSS files** except for color variables in `ahl-colors.css`
- **DO NOT modify page layouts** or column structures
- **DO NOT create new pages** - duplicate existing pages if needed
- Use the **Exposure → Transition → Engagement** framework (natural evolution model)
- All content updates must reference `/Users/latarencebutts/ahl/thesignalsinstitute/docs/The_Signals_Institute_Proposal.docx.md`
- Keep animated heading letters to **8 characters maximum**
- The Signals Institute serves three audiences (Youth, Veterans, Community) across three phases (Exposure, Transition, Engagement)

## Discoveries

1. **Color Palette (Official from `spro/chamber/lookup_tables/primary-colors.json`):**
   - Primary: `#00A8E8` (Electric Blue - Youth/Pillar 1)
   - Secondary: `#22C55E` (Green - Veterans/Pillar 2)
   - Accent: `#F59E0B` (Amber - Community/Pillar 3)

2. **Required Navigation Order (Latest from user):**
   - About
   - Engagement
   - Exposure
   - Transition
   - Events
   - Team

3. **Current Pages Available:**
   - index.html (Home - not in nav)
   - about.html
   - programs.html
   - integration.html
   - riviera27.html
   - contact.html

4. **Page Mapping (NEEDS CONFIRMATION):**
   - about.html = About ✅
   - riviera27.html = Engagement ✅
   - programs.html = Exposure ✅
   - integration.html = Transition ✅
   - ??? = Events ❓ (NEW PAGE NEEDED?)
   - ??? = Team ❓ (NEW PAGE NEEDED?)
   - contact.html = Contact (separate from nav or replace Events/Team?)

## Issues Found

1. **"NVTURE" bug on about.html** - User reports animated heading shows "NVTURE" instead of proper text
2. **Navigation not updated** - Still shows old labels (Programs, Integration, Riviera 27)
3. **Missing pages** - Need Events and Team pages OR need to repurpose existing pages

## Accomplished So Far

### ✅ **Completed:**
1. Backed up failed frontend to `frontend_failed/`
2. Fresh copy of AHL frontend to `frontend/`
3. Created CSS colors in `ahl-colors.css`:
   - Primary: #00A8E8
   - Secondary: #22C55E
   - Accent: #F59E0B
4. Copied Signals Institute assets:
   - `thesignalsinstitute-icon-light.png`
   - `thesignalsinstitute-landscape-light.png`
5. **Created favicon files:**
   - `favicon.ico` (32x32) ✅
   - `webclip.png` (180x180) ✅
6. Global updates on pages:
   - Title: "The Signals Institute"
   - Tagline (sidebar): "Strength Through" / "Connection"
   - Description: Mission statement about strengthening research ecosystems
   - Logo references updated

### ⏸️ **Blocked - Need Clarification:**
1. **Page mapping** - Which existing page should be:
   - Events?
   - Team?
   - Or should we create new pages by duplicating existing ones?
2. **Contact page** - Should it stay as Contact or become Events/Team?

### 🐛 **Critical Bugs to Fix:**
1. Fix "NVTURE" on about.html animated heading
2. Update navigation on ALL pages to new order

### 🔄 **Still To Do (Once Unblocked):**
1. Update navigation labels and order on all 6 pages
2. Fix animated heading letters on all pages
3. Update page content per proposal document
4. Verify/fix any remaining issues

## Relevant Files & Directories

### Working Directory:
- `/Users/latarencebutts/ahl/thesignalsinstitute/frontend/` - Current working site

### HTML Pages:
- `/Users/latarencebutts/ahl/thesignalsinstitute/frontend/index.html`
- `/Users/latarencebutts/ahl/thesignalsinstitute/frontend/about.html`
- `/Users/latarencebutts/ahl/thesignalsinstitute/frontend/programs.html`
- `/Users/latarencebutts/ahl/thesignalsinstitute/frontend/integration.html`
- `/Users/latarencebutts/ahl/thesignalsinstitute/frontend/riviera27.html`
- `/Users/latarencebutts/ahl/thesignalsinstitute/frontend/contact.html`

### CSS Files (ONLY ahl-colors.css should be modified):
- `/Users/latarencebutts/ahl/thesignalsinstitute/frontend/css/ahl-colors.css` - ✅ Colors updated
- `/Users/latarencebutts/ahl/thesignalsinstitute/frontend/css/ahl-custom.css` - DO NOT TOUCH
- `/Users/latarencebutts/ahl/thesignalsinstitute/frontend/css/ahl-template.css` - DO NOT TOUCH

### Reference:
- `/Users/latarencebutts/ahl/thesignalsinstitute/docs/The_Signals_Institute_Proposal.docx.md` - Content source

### Images:
- `/Users/latarencebutts/ahl/thesignalsinstitute/frontend/images/` - ✅ Logos and favicons in place

### Git Status:
- Last commit: "Add favicon and Apple touch icon files" (400b2d485)

---

## Questions for User

1. **Events page**: Should `contact.html` become the Events page, or should we create a new page by duplicating an existing one?
2. **Team page**: Which existing page should become Team, or should we create a new page?
3. **Contact**: If contact.html becomes something else, do we need a separate Contact page or can it be integrated into another page?

---

**NEXT STEP**: Waiting for user clarification on page mapping before proceeding with navigation updates.

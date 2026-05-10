---
name: Proxima Health Intel
colors:
  surface: '#141218'
  surface-dim: '#141218'
  surface-bright: '#3b383e'
  surface-container-lowest: '#0f0d13'
  surface-container-low: '#1d1b20'
  surface-container: '#211f24'
  surface-container-high: '#2b292f'
  surface-container-highest: '#36343a'
  on-surface: '#e6e0e9'
  on-surface-variant: '#cbc4d2'
  inverse-surface: '#e6e0e9'
  inverse-on-surface: '#322f35'
  outline: '#948e9c'
  outline-variant: '#494551'
  surface-tint: '#cfbcff'
  primary: '#cfbcff'
  on-primary: '#381e72'
  primary-container: '#6750a4'
  on-primary-container: '#e0d2ff'
  inverse-primary: '#6750a4'
  secondary: '#cdc0e9'
  on-secondary: '#342b4b'
  secondary-container: '#4d4465'
  on-secondary-container: '#bfb2da'
  tertiary: '#e7c365'
  on-tertiary: '#3e2e00'
  tertiary-container: '#c9a74d'
  on-tertiary-container: '#503d00'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#e9ddff'
  primary-fixed-dim: '#cfbcff'
  on-primary-fixed: '#22005d'
  on-primary-fixed-variant: '#4f378a'
  secondary-fixed: '#e9ddff'
  secondary-fixed-dim: '#cdc0e9'
  on-secondary-fixed: '#1f1635'
  on-secondary-fixed-variant: '#4b4263'
  tertiary-fixed: '#ffdf93'
  tertiary-fixed-dim: '#e7c365'
  on-tertiary-fixed: '#241a00'
  on-tertiary-fixed-variant: '#594400'
  background: '#141218'
  on-background: '#e6e0e9'
  surface-variant: '#36343a'
typography:
  display-xl:
    fontFamily: Manrope
    fontSize: 48px
    fontWeight: '800'
    lineHeight: '1.1'
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Manrope
    fontSize: 32px
    fontWeight: '700'
    lineHeight: '1.2'
    letterSpacing: -0.01em
  headline-lg-mobile:
    fontFamily: Manrope
    fontSize: 28px
    fontWeight: '700'
    lineHeight: '1.2'
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: '1.6'
  label-mono:
    fontFamily: Space Grotesk
    fontSize: 12px
    fontWeight: '600'
    lineHeight: '1'
    letterSpacing: 0.05em
  data-point:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '600'
    lineHeight: '1'
    letterSpacing: -0.01em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 4px
  xs: 0.5rem
  sm: 1rem
  md: 1.5rem
  lg: 2.5rem
  xl: 4rem
  gutter: 1.5rem
  container_max: 1440px
---

## Brand & Style
The design system is engineered for high-performance health monitoring. It blends the density and authority of a financial terminal with the fluid, ethereal aesthetics of modern productivity software. The personality is "Clinical Avant-Garde"—merging medical-grade reliability with a cutting-edge startup feel.

The visual language relies on depth, transparency, and motion. By using dark-mode by default, we reduce eye strain and allow the high-saturation accent colors to function as critical data indicators. The style utilizes **Glassmorphism** to create a sense of layered information architecture, suggesting a sophisticated, multi-dimensional view of patient health.

## Colors
This design system utilizes a "Deep Space" foundation to maximize the luminosity of data visualizations. 

- **Foundation:** The deep dark navy (#0a0c10) acts as the canvas. Use it for the base background layer and full-bleed surfaces.
- **Accents:** The Orange-Red (#ff5f45) is the primary call-to-action and primary brand signal. The Cyan/Blue (#38bdf8) is used for secondary interactive elements, active states, and informative data trends.
- **Severity Palette:** These colors are reserved strictly for status indicators and medical alerts. They must never be used for decorative purposes to maintain the integrity of clinical communication.
- **Typography:** Use pure white (#ffffff) for maximum legibility in headings and soft gray (#94a3b8) for meta-data and secondary labels to establish clear hierarchy.

## Typography
The typography strategy balances human-centric readability with a technical, data-heavy aesthetic.

- **Headlines:** Uses **Manrope** for its modern, balanced proportions. Large headlines should use tight letter spacing and high weight to evoke a premium feel.
- **Body Text:** Uses **Inter** for its unparalleled legibility in digital interfaces and complex dashboards.
- **Data & Labels:** Uses **Space Grotesk** for technical labels and monospaced-style data points. This creates a "scientific instrument" feel, making data density feel organized and intentional.

## Layout & Spacing
The design system employs a **Fluid-Grid hybrid** model. While the layout adapts to screen width, the content is organized into "bento-box" modules that maintain strict structural integrity.

- **Desktop:** 12-column grid with a 24px gutter. Content is housed in floating glass cards that can span 3, 4, 6, or 12 columns.
- **Mobile:** 4-column grid with 16px margins. Cards stack vertically, maintaining a 16px bottom margin.
- **Rhythm:** A strict 4px/8px baseline rhythm is used for all internal component padding to ensure data density remains clean and scannable.

## Elevation & Depth
This design system uses depth to simulate physical layers of glass panels floating over a digital grid.

- **Level 0 (Background):** Solid #0a0c10 with a subtle animated SVG grid pattern in 2% opacity white.
- **Level 1 (Glass Cards):** Semi-transparent background (70% opacity) with a 20px-40px backdrop blur. Use a 1px inner border (stroke) with a linear gradient (white at 15% to white at 5%) to simulate a "glass edge."
- **Level 2 (Popovers/Tooltips):** Higher transparency (90% opacity), 60px backdrop blur, and a soft, expansive shadow (0px 20px 50px rgba(0,0,0,0.5)) to create distinct separation.
- **Shadows:** Avoid heavy black shadows. Use colored "glow" shadows for active or critical elements using the primary or severity palette colors at 20% opacity.

## Shapes
Shapes are "Rounded-Technical." We avoid organic or overly bubbly shapes to maintain a professional medical aesthetic.

- **Standard Cards:** 1rem (16px) corner radius.
- **Buttons & Controls:** 0.5rem (8px) corner radius for a sharp, precise appearance.
- **Indicators:** Circular (pill-shaped) for status pulses and notification badges to draw the eye through contrast with the rectangular grid.

## Components
- **Floating Glass Cards:** The core container. Must include a subtle top-down gradient and a 1px border. No solid fills.
- **Buttons:** 
  - *Primary:* Solid #ff5f45 with white text. 
  - *Ghost:* Transparent with the cyan border and text. 
  - *Glass:* Blurred background with a subtle white border.
- **Animated Pulse Indicators:** Small circular badges used for real-time monitoring. For "Critical" status, add a radial outer glow that pulses from 0.4 to 1.0 opacity.
- **Sleek Charts:** Line charts should use 2px stroke widths with "area" gradients that fade to transparent. Use Cyan (#38bdf8) for normal trends and Orange-Red (#ff5f45) for anomalies.
- **Inputs:** Dark backgrounds (#000000) with a 1px subtle border. On focus, the border transitions to Cyan with a 4px soft outer glow.
- **Navigation:** Vertical sidebar with minimalist line-art icons. Active states should be indicated by a vertical Orange-Red line on the leading edge and a subtle glass-highlight background.
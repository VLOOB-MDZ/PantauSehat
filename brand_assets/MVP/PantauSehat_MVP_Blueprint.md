# PantauSehat — MVP Blueprint for Claude Code

## Product Overview
PantauSehat is an Indonesia-focused outbreak and public health monitoring website.

The MVP goal:
- Display outbreak-related health news in Indonesia
- Automatically categorize disease names and locations
- Visualize spread on an interactive Indonesia map
- Provide a clean mobile-first dashboard
- Support monetization through ads later

Tone:
- Professional
- Trustworthy
- Fast and modern
- NOT fearmongering

---

# Core MVP Features

## 1. Homepage Dashboard
Sections:
- Hero section
- Indonesia outbreak map
- Latest outbreak alerts
- Trending diseases
- Province risk rankings
- Recent news feed

---

## 2. Interactive Indonesia Map
Requirements:
- Use Mapbox or Leaflet
- Province coloring based on severity
- Click province to open detail panel
- Marker clustering support
- Mobile optimized

Province data example:

```json
{
  "province": "Jawa Barat",
  "risk_level": "medium",
  "cases": 24,
  "diseases": ["DBD", "Hantavirus"]
}
```

---

## 3. AI News Processing
Input:
- News articles from trusted Indonesian sources

Sources:
- https://www.kemkes.go.id
- https://health.detik.com
- https://health.kompas.com
- https://www.antaranews.com/kesehatan
- https://www.who.int/indonesia

AI tasks:
- Extract disease name
- Extract province/city
- Summarize article
- Determine severity level
- Save structured outbreak data

Example structured result:

```json
{
  "title": "Kasus DBD meningkat di Bandung",
  "disease": "DBD",
  "province": "Jawa Barat",
  "city": "Bandung",
  "severity": "medium",
  "summary": "Kasus DBD meningkat 32% dalam dua minggu terakhir.",
  "source": "Detik Health"
}
```

---

# Recommended Stack

## Frontend
- Next.js 15
- TypeScript
- TailwindCSS
- shadcn/ui
- Framer Motion

## Backend
- Next.js API routes
- Supabase PostgreSQL

## AI
- OpenAI API

## Deployment
- Vercel

---

# Database Schema

## outbreaks table

```sql
create table outbreaks (
  id uuid primary key default gen_random_uuid(),
  disease text,
  province text,
  city text,
  severity text,
  summary text,
  source_url text,
  source_name text,
  reported_at timestamp,
  created_at timestamp default now()
);
```

## diseases table

```sql
create table diseases (
  id uuid primary key default gen_random_uuid(),
  slug text unique,
  name text,
  description text,
  symptoms text,
  prevention text
);
```

---

# UI Design Direction

Style:
- Dark mode default
- Minimalist
- Modern dashboard aesthetic
- Red/orange accent for outbreak severity
- Glassmorphism cards
- Smooth animations

Inspirations:
- Apple Weather
- Arc Browser
- Bloomberg Terminal (simplified)
- COVID dashboards

---

# Homepage Layout

```txt
------------------------------------------------
Navbar
------------------------------------------------
Hero Section
------------------------------------------------
Live Indonesia Outbreak Map
------------------------------------------------
Trending Diseases
------------------------------------------------
Latest Alerts
------------------------------------------------
Province Rankings
------------------------------------------------
Recent News Feed
------------------------------------------------
Footer
------------------------------------------------
```

---

# Severity Logic

Simple MVP logic:

```txt
LOW:
1-5 reports

MEDIUM:
6-20 reports

HIGH:
21-50 reports

CRITICAL:
50+ reports
```

---

# API Endpoints

## GET /api/outbreaks
Return all outbreaks

## GET /api/province/[name]
Return province outbreak data

## GET /api/disease/[slug]
Return disease information

## POST /api/process-news
AI processing endpoint

---

# Example Claude Code Prompt

Use this prompt inside Claude Code:

```txt
Build a production-ready MVP for PantauSehat.

Tech stack:
- Next.js 15 App Router
- TypeScript
- TailwindCSS
- shadcn/ui
- Framer Motion
- Supabase
- Mapbox

Requirements:
- Dark modern UI
- Mobile-first responsive design
- Interactive Indonesia map
- Province severity coloring
- Dashboard cards
- News feed cards
- Mock outbreak data
- API route structure
- Clean reusable components
- Animated transitions
- SEO optimized
- Fast loading

Pages:
- /
- /province/[slug]
- /disease/[slug]

Create:
- Complete folder structure
- Components
- Mock data
- Tailwind styling
- Map implementation
- Dashboard layout
- Navigation
- Loading skeletons

Do not use placeholder ugly styling.
Make it look like a premium modern startup dashboard.
```

---

# Monetization Strategy

## Phase 1
Google AdSense:
- Sidebar ads
- Feed ads
- Sticky mobile banner

DO NOT overuse ads.

---

## Future Monetization
- Premium outbreak alerts
- Telegram notifications
- API access
- Research dashboard
- Sponsored health insights

---

# SEO Strategy

Target keywords:
- wabah terbaru Indonesia
- virus terbaru Indonesia
- persebaran DBD Indonesia
- outbreak Indonesia
- peta wabah Indonesia
- kasus virus Indonesia

Create dynamic pages for:
- diseases
- provinces
- outbreaks

---

# Future Features

## Phase 2
- AI outbreak prediction
- Real-time alerts
- Push notifications
- Heatmaps
- Search functionality

## Phase 3
- Global outbreak tracking
- User accounts
- Saved alerts
- Premium analytics
- Public API

---

# Branding

Name:
PantauSehat

Tagline ideas:
- Pantau Wabah Secara Real-Time
- Indonesia Public Health Monitor
- Data Wabah Indonesia dalam Satu Dashboard

Primary vibe:
- Modern
- Credible
- Calm
- Informative

Avoid:
- Fear-based language
- Clickbait
- Sensational headlines

---

# MVP Priority Order

Build in this order:

1. Homepage UI
2. Indonesia map
3. Mock outbreak data
4. Province pages
5. News feed
6. AI processing
7. Database integration
8. SEO
9. Monetization
10. Notifications

---

# Final Goal

PantauSehat should feel like:
- Google Trends + Health Intelligence
- Modern public health dashboard
- Indonesia outbreak command center

The experience should make users feel:
- informed
- calm
- updated
- in control

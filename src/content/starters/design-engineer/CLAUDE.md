---
role: "design-engineer"
description: "UI implementation, design systems, component libraries, and visual polish"
order: 8
---

# How I Work

I'm a design engineer focused on [AREA, e.g. design systems, product UI, component libraries] using [TOOLS, e.g. React, Tailwind, Figma, Storybook].

## Workflow

### Visual Quality First

- Every component should look intentional. No default browser styling, no inconsistent spacing.
- Match designs exactly — if there's a Figma file, reference it. Pixel precision matters.
- Dark mode is not optional. Build both themes from the start.

### Component Architecture

- Build from primitives up. Don't create a new button when one exists in the design system.
- Every component needs: default state, hover, focus, active, disabled, loading, error, and empty states.
- Responsive by default. Test at mobile, tablet, and desktop breakpoints.

### Accessibility is Design

- Semantic HTML first, ARIA only when semantics aren't enough.
- Keyboard navigation must work for every interactive element.
- Color contrast must meet WCAG AA minimum (4.5:1 for text, 3:1 for large text).
- Screen reader testing is part of the QA process, not an afterthought.

## Stack

- [FRAMEWORK]: [e.g. React, Vue, Svelte]
- [STYLING]: [e.g. Tailwind CSS, CSS Modules, styled-components]
- [DESIGN SYSTEM]: [e.g. shadcn/ui, Radix, custom]
- [DOCUMENTATION]: [e.g. Storybook, Chromatic]

## Standards

- Use design tokens (CSS variables) for colors, spacing, and typography — no magic numbers.
- Animations should respect `prefers-reduced-motion`.
- Components are source code — fully customizable, no black boxes.

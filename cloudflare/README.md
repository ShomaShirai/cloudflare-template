# Welcome to React Router and Hono!

A modern, production-ready template for building full-stack React applications using React Router and Hono.

The difference from the official template is that it uses `rolldown-vite` and employs `wrangler dev` for preview instead of `vite preview`.

## Features

- 🚀 Server-side rendering
- ⚡️ Hot Module Replacement (HMR)
- 📦 Asset bundling and optimization
- 🔄 Data loading and mutations
- 🔒 TypeScript by default
- 🎉 TailwindCSS for styling
- 📖 [React Router docs](https://reactrouter.com/)

## Getting Started

### Installation

Install the dependencies:

```bash
make install
```

### Development

Start the development server with HMR:

```bash
make dev
```

Your application will be available at `http://localhost:5173`.

## Previewing the Production Build

Preview the production build locally:

```bash
make preview
```

If startup fails, delete `.wrangler/deploy/config.json`.

## Previewing the Production Build(Remote of Cloudflare)

Preview the production build remote:

```bash
make preview-remote
```

## Building for Production

Create a production build:

```bash
make build
```

## Deployment

Deployment is done using the Wrangler CLI.

To build and deploy directly to production:

```sh
make deploy
```

check deployment size without deploying

```sh
make dry-run
```

## Database (Drizzle + D1)

Generate migration SQL from schema changes:

```bash
make db-generate
```

Apply migrations to local D1:

```bash
make db-migrate-local
```

Apply migrations to remote D1:

```bash
make db-migrate-remote
```

Run type checks (including `wrangler types`):

```bash
make typecheck
```

To deploy a preview URL:

```sh
npx wrangler versions upload
```

You can then promote a version to production after verification or roll it out progressively.

```sh
npx wrangler versions deploy
```

## Styling

This template comes with [Tailwind CSS](https://tailwindcss.com/) already configured for a simple default starting experience. You can use whatever CSS framework you prefer.

---

Built with ❤️ using React Router.

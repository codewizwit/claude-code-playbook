import { defineCollection, z } from "astro:content";
import { glob } from "astro/loaders";

const agents = defineCollection({
  loader: glob({ pattern: "**/*.md", base: "./src/content/agents" }),
  schema: z.object({
    name: z.string(),
    type: z.enum(["work", "meta", "utility", "project", "fun"]),
    model: z.string(),
    tools: z.string().optional(),
    tagline: z.string(),
    trigger: z.string().optional(),
  }),
});

const docs = defineCollection({
  loader: glob({ pattern: "**/*.md", base: "./src/content/docs" }),
  schema: z.object({
    title: z.string(),
    order: z.number(),
  }),
});

const starters = defineCollection({
  loader: glob({
    pattern: "**/CLAUDE.md",
    base: "./src/content/starters",
  }),
  schema: z.object({
    role: z.string(),
    description: z.string(),
    order: z.number(),
  }),
});

export const collections = { agents, docs, starters };

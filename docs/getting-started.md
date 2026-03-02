# Getting Started (No Code Required)

This guide walks you through setting up Claude Code using this playbook. No terminal experience needed — Claude handles the technical parts for you.

## What You'll Need

- A computer (Mac, Windows, or Linux)
- NodeJS
- Antrhopic Claude Code 
- About 10 minutes

## Step 1: Install VS Code and Node.JS

If you already have VS Code installed, skip to Step 2.

1. Download and install Visual Studio Code
2. Downlaod and install Node.JS - verify installation in new Terminal `node --version`
2. Launch VS Code when it's done

## Step 2: Install the Claude Code Extension  (0ptional)

1. Open VS Code
2. Click the **Extensions** icon in the left sidebar (it looks like four small squares)
3. Type **Claude Code** in the search bar
4. Find the extension by **Anthropic** and click **Install**
5. After it installs, you may be prompted to sign in — follow the prompts to connect your Anthropic account

**Note**: Optionally, you can use the terminal. **Terminal --> New Terminal** and type `claude`, enter to start up Claude

## Step 3: Download This Playbook

1. In VS Code, press `Ctrl+Shift+P` (Windows/Linux) or `Cmd+Shift+P` (Mac) to open the command palette
2. Type **Git: Clone** and select it
3. Paste the repository URL and press Enter
4. Choose a folder on your computer to save it (your Documents folder works fine)
5. When VS Code asks "Would you like to open the cloned repository?", click **Open**

You should now see the playbook files in the left sidebar — folders like `starters/`, `docs/`, and `.claude/`.

> **Don't see the `.claude` folder?** Files starting with a dot are hidden by default. To show them: in VS Code's file explorer, click the `...` menu at the top of the sidebar and check **Show Hidden Files**. You'll want this visible — it contains the settings and skills that are part of this playbook.

> **Tip: Preview markdown files.** The playbook is all markdown (`.md` files). To read them formatted instead of as raw text, open any `.md` file in VS Code and click the **preview icon** in the top-right corner of the editor (it looks like a split pane with a magnifying glass). Or press `Ctrl+Shift+V` (Windows/Linux) or `Cmd+Shift+V` (Mac). This makes the docs, starters, and skills much easier to read.

## Step 4: Open the Terminal

1. In VS Code, go to the menu bar and click **Terminal** then **New Terminal**
2. A panel will open at the bottom of the screen — this is your terminal
3. Type `claude` and press Enter

Claude Code should start up. If it asks you to sign in, follow the prompts.

## Step 5: Let Claude Set You Up

Now the fun part. In the Claude Code prompt, describe your role and ask Claude to configure everything for you. Use the `@` symbol to point Claude at the README so it knows what's available.

Here are some examples you can copy and paste. Each one asks Claude to set everything up *and* explain what it did in plain language:

**If you're a product owner:**
> I'm a product owner working on a B2B SaaS platform. Read @README.md and set me up with the right starter, settings, and skills for my role. My team uses Teams for communication and Confluence for documentation.
>
> When you're done, give me a plain-language summary: what you installed, what each piece does for me specifically, and why it benefits someone in my role. Then ask me if I'm ready to walk through customizing it together — things like my team's tools, my preferences, and anything the starter assumed that might not fit how I actually work.

**If you're a manager:**
> I'm an engineering manager with a team of 6. Read @README.md and set me up — install the starter for my role, the settings, and the hook. Replace the placeholders with my details.
>
> After setup, explain in non-technical terms: what changed and why each piece benefits someone in my role. Then ask if I want to customize it together — walk me through the choices the starter made and help me adjust anything that doesn't match how my team actually operates.

**If you're a developer:**
> I'm a frontend developer working in TypeScript and React. Read @README.md and set me up with everything — the developer starter, settings, hooks, and skills. Replace the placeholders with my stack.
>
> After setup, summarize what you configured and why each setting matters for my workflow. Then ask if I want to customize it together — go through the defaults and help me adjust anything based on my actual stack, team conventions, or preferences.

**If you're not sure which role fits:**
> Read @README.md and help me pick the right starter. I'm a [describe what you do day-to-day]. Once we pick one, set everything up for me, explain what you did and why in plain language, and then walk me through customizing it for how I actually work.

Claude will read the README, pick the right files, copy them into place, fill in what it can, and then explain what it did and why — in plain language, not technical jargon.

## Step 6: Customize Together

After the initial setup, Claude will ask if you're ready to customize. This is a conversation, not a checklist — Claude walks you through the choices the starter made and helps you adjust them. Just answer naturally:

- *"I actually use Jira, not Confluence"*
- *"My team does two-week sprints"*
- *"I never want Claude to push code without asking me first"*
- *"I don't do code reviews — that's my tech lead"*
- *"We use Python and Django, not TypeScript"*

Claude updates the files for you as you go. You don't need to know where things live or how to edit them — just describe how you work and Claude handles the rest.

If you want to skip customization for now, that's fine too. The starters work out of the box. You can always come back and say *"Let's customize my CLAUDE.md"* in any future session.

## What Just Happened?

Claude copied and configured three things for you:

1. **A CLAUDE.md** — your personal working agreement with Claude. It now knows your role, your preferences, and your guardrails. This is loaded every time you use Claude Code.

2. **A settings.json** — permission rules that control what Claude can and can't do. For example, it's blocked from reading your `.env` files (where secrets live) and it will always ask before pushing code.

3. **Skills** — reusable prompts, written as detailed instructions in markdown, that Claude follows on command. For example, `/skill-scout` analyzes a codebase and suggests more automations.

## Next Steps

- **Use Claude Code normally.** Your configuration is active — just work. Claude will follow your preferences automatically.
- **Iterate.** If Claude does something you don't like, tell it to add a rule. Over time your CLAUDE.md gets sharper.
- **Explore the docs** if you're curious about how things work:
  - [What is a CLAUDE.md?](what-is-a-claude-md.md)
  - [What is a skill?](what-is-a-skill.md)
  - [settings.json tips](settings-json-tips.md)

---
slug : getting_started
title: Getting Started
description: "How to functionally develop a blog? We hope this template is a good option. Please find how to try this template."
tags:
    - tutorial
date : 2023-03-25
---

# Q. What's this?

A. A blog template with

- [NextJS](https://nextjs.org/): static site generater with [ReactJS](https://github.com/facebook/react/)
- [ReScript](https://rescript-lang.org/): functional programming language compiled to JavaScript
- [Bootstrap](https://getbootstrap.com/): empowers CSS
- [RemarkJS](https://github.com/remarkjs): compiles Markdown to HTML

# Getting Started

As the same as the other NextJS templates, `git clone`, `npm install` and ready.

```sh
git clone https://github.com/yaufai/rescript-next-blog-template.git
npm install
rm -rf .git
```

You can launch DEV environments with two terminals:

```sh
# auto compilation of ReScript
npm run res:dev
```

```sh
# auto compilation of NextJS
npm run dev
```

How to write your blog?

- `posts/*.md`: add articles
    - all the files have to follow the same frontmatter format
    - See [How To Markdown](how_to_markdown) for more details
- `site.config.mjs`: site and author profile
    - See [Site Config](site_config) for more details
- `public/favicon.png`: set a favicon image for tabs opening your blog
- `src/components/SocialButton.res`: decide which social links are available
- See [details](analytics) if you need to enable Google Analytics

To compile Markdown files:

```sh
npm run markdown
```

Once you delete the sample Markdown files, update `pages/404.res` as this page tries to load articles by their `slug` in the frontmatters.

```res
"props": list{
    Post.loadBySlug("getting_started"),
    Post.loadBySlug("customize_markdown_and_frontmatter"),
}
```

# Features

- sitemap generation
- `meta` tag generation
- social buttons
- google analytics

# Commands

- `npm run res:dev`: auto compilation of ReScript
- `npm run dev`: DEV server for NextJS
- `npm run markdown`: preprocess Markdown files
- `npm run build`: build a static site
    - Compilation/preprocessing of ReScript and Markdown are included
- `npm start`: start a NextJS server

# Customization

- [Directory Structure](directory_structure) to understand the template overview
- [Markdown Syntax & Frontmatter](customize_markdown_and_frontmatter)
- [Analytics](analytics)

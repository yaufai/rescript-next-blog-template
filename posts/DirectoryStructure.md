---
slug : directory_structure
title: Directory Structure of Blog Template with ReScript & NextJS
description: "This is a template, which means you have to fill your contents in a way that the compiler can handle. You can find which folder stores what, and what to edit to create your contents."
tags:
    - tutorial
    - customization
date : 2023-03-28
---

The directory structure you have to know looks like below. This `tree`-like diagram does not include auto-generated folders like `node_moduels`, `.git` etc.

```
.
├── posts
├── pages
|   ├── about.res
|   ├── index.res
│   ├── blog
|   |   └── [slug].res
│   └── tag
|       └── [tag].res
├── public
├── scripts
├── src
│   ├── components
│   └── utils
└ ... some other config files
```

# `posts`: your blog contents

Markdown files under `posts` will be converted to blog articles by running

```sh
npm run markdown
```

Please refer to [How To Markdown] for more details.

# `pages` (NextJS): to define directory structure your blog

This directory corresponds to your blog URL structure. For example, assuming you are running `npm run dev`

- `pages/about.res` :arrow_right: http://localhost:3000/about
- `pages/index.res` :arrow_right: http://localhost:3000
- `pages/blog/index.res` :arrow_right: http://localhost:3000/blog

Some are generated from your markdown contents, more specifically frontmatter which is enclosed by `---`.

- `slug` generates blog articles
- `tags` generates tag pages

(e.g.) This page is generated from `posts/DirectoryStructure.md` with frontmatter

```yaml
slug: directory_structure
tags:
    - tutorial
    - customization
```

- `slug` value is `directory_structure`, which means the markdown file generates http://localhost:3000/blog/directory_structure
- `tags` value forms an array of `tutorial` and `customization`. This will generate http://localhost:3000/tag/tutorial and http://localhost:3000/tag/customization respectively.

# `public` (NextJS): to distribute files

Files under `public` can be accessed by readers by the file names. For example, `public/profile.png` is accessed via http://localhost:3000/profile.png.

If you want to embed images, music, videos and any other files in your blog articles, `public` is the right place to locate them.

# `scripts` - store command line tools

This is a directory to keep command line tools you need in your development. For example, the program invoked by `npm run markdown` is stored at `scripts/convertMd.mjs`.

# `src` - source files

ReScript source files except `pages` are stored here.

- `src/components`: ReactJS components
- `src/utils`: tools to process data

# Configuration files

- `next.config.js`
- `site.config.mjs`: Configuration of your blog like blog name, author information, copyright statement, ...
    - See [Site Config](site_config)
- `bsconfig.js`: ReScript configuration
    - `bs-dependencies` to include third-party libraries for ReScript
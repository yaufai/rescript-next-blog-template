---
slug : site_config
title: Site Config
description: "explains how to edit site.config.mjs and how it affects the view of the blog."
tags:
    - tutorial
    - customization
date : 2023-03-27
---

# `title`: your blog title

- displayed at the header of each page

# `description`: your blog description

- displayed at the header of each page

# `author`: about you

- displayed at the profile card

The value has to be set as `Object` with

- `name` (`string`)
- `description` (`string`)


# `copyright`: copyright statement

- displayed at the footer of each page

The value has to be set as `Object` with

- `from` (`int`)
- `till` (`null` or `int`)

# `domain`: meta 

- used to set OGP tag for URL of each article

(e.g.) `sample.com`

- This section does not need the protocol prefix `https://`

# `locale`: website-wide locale config

- used to set OCP tag for locale of each article

(e.g.) `en_US`

---
slug : how_to_markdown
title: How To Markdown
description: "In this template, most of your contents can be written in Markdown format. But, Markdown has numbers of dialects. Which should you follow?"
tags:
    - tutorial
date : 2023-03-26
---

# Markdown Syntax

Markdown has numbers of dialects and extensions. We use RemarkJS to parse markdown and the detailed syntax can be found on its [README](https://github.com/remarkjs/remark#syntax).

This template by default include the following extensions:

## Math formulas

(e.g.)

```md
$\{a_n\}$ converges to $a$ if and only if for any $\epsilon > 0$ there some $n_0 \in \mathbb{N}$ exists such that

$$
|a - a_n| < \epsilon
$$

for any $n > n_0$
```

$\{a_n\}$ converges to $a$ if and only if for any $\epsilon > 0$ there some $n_0 \in \mathbb{N}$ exists such that

$$
|a - a_n| < \epsilon
$$

for any $n > n_0$

## Syntax highlight

[PrismJS](https://github.com/PrismJS/prism) empowers code blocks

(e.g.)

```res
let rec factorial = (n: int) => {
    if n <= 0  {
        1
    } else {
        n * factorial(n-1)
    }
}
```

## Emoji

Emoji names enclosed with `:` will be converted to corresponding emojis. Plese see [reamrk-emoji](https://www.npmjs.com/package/remark-emoji).

(e.g.) `:+1` will be :+1:


# Frontmatter

Frontmatter is a storage of metadata of the markdown file. The article title, description, tags and others can be stored in YAML format enclosed by `---` at the top of each markdown file.

```yaml
---
slug : how_to_markdown
title: How To Markdown
description: "How to develop Markdown blog with ReScript?"
tags:
    - tutorial
date : 2023-03-26
---
```

- `slug`is used to decide the article URL
    - (e.g.) `slug: how_to_markdown` :arrow_right: http://localhost:3000/blog/how_to_markdown
- `title` is the article title
- `description` is the article description. This is used in the article card.
- `tags` is used to tag the article. This is an `array` of `string`
    - (e.g.) If `tutorial` is included in the field, the article is filed at http://localhost:3000/tag/tutorial
- `date` is the date of publishment of the article. This is used to sort articles.


If you want to customize the metadata schema, you can check [Customize Markdown Syntax & Frontmatter](customize_markdown_and_frontmatter#frontmatter) for more details.

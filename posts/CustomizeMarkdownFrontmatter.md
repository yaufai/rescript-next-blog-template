---
slug : customize_markdown_and_frontmatter
title: Customize Markdown Syntax & Frontmatter
description: "This template has some convenient Markdown extensions and schema of frontmatter. But how can we go beyond? This page explains to extend Markdown syntax and edit frontmatter schema."
tags:
    - customization
date : 2023-03-29
---

# Markdown Extension

We use [RemarkJS](https://github.com/remarkjs) to parse markdown contents. The parse and compilation script is `script/convertMd.mjs`, and you can add RemarkJS plugins if you want to add markdown extensions.

# Frontmatter

[Frontmatter](how_to_markdown#frontmatter) stores metadata of each markdown file. You can change its schema by editing a type definition and a decoder defined at `src/Post.res`.

```res
type frontmatter = {
    slug : string,
    title: string,
    description: string,
    tags : array<string>,
    date : string,
}
```

The type alias of frontmatter is defined as `frontmatter`. It enables you to access each field in the other part of the blog by editing this type definition.

`decodeString` is a function to decode JSON in string format into ReScript record, and `frontmatterDecoder` defined in its definition is the one responsible to decode frontmatter.

```res
D.map5(
    D.field("frontmatter", D.field("slug" , D.string)),
    D.field("frontmatter", D.field("title", D.string)),
    D.field("frontmatter", D.field("description", D.string)),
    D.field("frontmatter", D.field("tags" ,  D.array(D.string))),
    D.field("frontmatter", D.field("date" ,  D.string)),
    ~f=(slug, title, description, tags, date) => {
        slug : slug ,
        title: title,
        description: description,
        tags : tags ,
        date : date },
)
```

For example, the below defines `frontmatter.tags` can be decoded as `array` of `string`

```res
D.field("frontmatter", D.field("tags", D.array(D.string))),
```

By adding a new decoder and using a proper `map` function, you can construct a decoder for your schema.

If an article breaks the schema, the decoder will raise an exception.

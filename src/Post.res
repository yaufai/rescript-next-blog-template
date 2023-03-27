open Belt.List
module D = Json.Decode

type frontmatter = {
    slug : string,
    title: string,
    description: string,
    tags : array<string>,
    date : string,
}

type body = {
    raw : string,
    html: string,
}

type t = {
    frontmatter: frontmatter,
    body       : body,
}

let decodeString: string => option<t> = (content) => {
    let frontmatterDecoder: D.t<frontmatter> = 
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
    
    let bodyDecoder: D.t<body> =
        D.map2(
            D.field("body", D.field("raw" , D.string)),
            D.field("body", D.field("html", D.string)),
            ~f=(raw, html) => { raw: raw, html: html },
        )

    let decoder = D.map2(
        frontmatterDecoder,
        bodyDecoder,
        ~f=(frontmatter, body) => { frontmatter: frontmatter, body: body }
    )

    let result = D.decodeString(content, decoder)

    switch(result) {
        | Ok(data) => Some(data)
        | Error(_) => None
    }
}

let loadAll: () => list<t> = () => {
    let dirName = ".setten/posts"
    Node.Fs.readdirSync(dirName)
        ->fromArray
        ->map(fname => {
            let fpath   = `${dirName}/${fname}`
            let content = Node.Fs.readFileSync(fpath, #utf8)
            decodeString(content)
        })
        ->map(x => switch(x) {
            | Some(data) => data
            | None       => raise(Invalid_argument("Failure in loading the directory"))
        })
}

let loadBySlug: string => t = (slug) => {
    let result = loadAll()->getBy(p => p.frontmatter.slug == slug)
    switch(result) {
        | Some(post) => post
        | None       => raise(Invalid_argument(`No post with slug ${slug}`))
    }
}

let loadByTagName: string => list<t> = tag => {
    loadAll()
        ->filter(post => post.frontmatter.tags
            ->fromArray
            ->has(tag, (a, b) => a == b)
        )
}

let loadByTagNames: list<string> => list<t> = tags => {
    tags->map(loadByTagName)
        ->reduce(list{}, (accPosts, lst) => {
            let rec addIfNew = (acc, posts) => {
                switch(posts) {
                    | list{}        => acc
                    | list{h, ...t} => addIfNew(list{h,...acc}, t)
                }
            }
            addIfNew(accPosts, lst)
        })
}
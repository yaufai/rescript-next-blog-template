module D = Json.Decode
@module("../site.config") external siteConfig: Js.Json.t = "default";

type author = {
    name: string,
    description: string,
}

type copyright = {
    from: int,
    till: option<int>,
}

type t = {
    title      : string,
    domain     : string,
    locale     : string,
    description: string,
    author     : author,
    copyright  : copyright,
}

let _decode: Js.Json.t => t = (config) => {
    let authorDecoder = D.map2(
        D.field("author", D.field("name"       , D.string)),
        D.field("author", D.field("description", D.string)),
        ~f=(name, description) => {
            name       : name,
            description: description
        }
    )

    let copyrightDecoder = D.map2(
        D.field("copyright", D.field("from", D.int)),
        D.field("copyright", D.field("till", D.nullable(D.int))),
        ~f=(from, till) => { from: from, till: till }
    )

    let decoder = D.map6(
        D.field("title" , D.string),
        D.field("domain", D.string),
        D.field("locale", D.string),
        D.field("description", D.string),
        authorDecoder,
        copyrightDecoder,
        ~f=(title, domain, locale, description, author, copyright) => {
            title      : title,
            domain     : domain,
            locale     : locale,
            description: description,
            author     : author,
            copyright  : copyright,
        }
    )

    let result = D.decodeValue(config, decoder)
    switch (result) {
        | Ok(data) => data
        | Error(_) => raise(Invalid_argument("Something went wrong."))
    }
}

let make = () => _decode(siteConfig)
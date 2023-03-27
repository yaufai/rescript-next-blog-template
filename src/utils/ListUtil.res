open Belt.List

let dedupe = (lst) => {
    let rec _dedupe = (acc, remains) => switch(remains) {
        | list{}        => acc
        | list{h, ...t} => {
            if has(acc, h, (a, b) => a == b) {
                _dedupe(acc, t)
            } else {
                _dedupe(add(acc, h), t)
            }
        }
    }
    _dedupe(list{}, lst)
}

let mergeToUniqueList: list<list<'a>> => list<'a> = lists => dedupe(flatten(lists))

let sortByPostDate: list<Post.t> => list<Post.t> = lst => lst
    ->sort((a, b) => {
        let parseDateToComparable = (post: Post.t) => post.frontmatter.date
            ->Js.Date.fromString
            ->Js.Date.getTime
        if (parseDateToComparable(a) > parseDateToComparable(b)) {
            1
        } else {
            -1
        }
        
    }
)
import fs from "fs"
import { matter } from "vfile-matter"
import { remark } from "remark"
import remarkFrontmatter from "remark-frontmatter"
import remarkPrism from "remark-prism"
import remarkEmoji from "remark-emoji"
import remarkMath from "remark-math"
import remarkRehype from "remark-rehype"
import rehypeStringify from "rehype-stringify"
import rehypeMathJaxSvg from "rehype-mathjax"
import rehypeToc from "rehype-toc"
import rehypeSlug from "rehype-slug"

const DIR_POST  = "posts"
const DIR_OUT   = ".setten/posts"
const FORMAT_FM = "yaml"

if (fs.existsSync(DIR_OUT)) {
    fs.readdirSync(DIR_OUT)
        .forEach(fname => fs.rmSync(`${DIR_OUT}/${fname}`))
} else {
    fs.mkdirSync(DIR_OUT, {
        recursive: true
    })
}

fs.readdirSync(DIR_POST)
    .map(fname => {
        let loc = `${DIR_POST}/${fname}`
        return {
            path    : loc,
            fileName: fname,
            rawBody : fs.readFileSync(loc).toString(),
        }
    })
    // get frontmatter and html
    .map(fileProfile => {
        let processed = remark()
            .use(remarkMath)
            .use(remarkEmoji)
            .use(remarkPrism)
            .use(remarkFrontmatter, [FORMAT_FM])
            .use(() => (_, file) => {
                matter(file)
            })
            .use(remarkRehype, { sanitize: false })
            .use(rehypeMathJaxSvg)
            .use(rehypeSlug)
            .use(rehypeToc)
            .use(rehypeStringify)
            .processSync(fileProfile.rawBody)
        
        return {
            ...fileProfile,
            frontmatter: processed.data.matter,
            html: processed.value,
        }
    })
    // save
    .forEach(f => {
        const obj = {
            title: f .frontmatter.title,
            body : {
                html: f.html,
                raw : f.rawBody,
            },
            frontmatter: f.frontmatter,
        }

        fs.writeFile(
            `${DIR_OUT}/${f.fileName}`,
            JSON.stringify(obj, undefined, 4),
            () => {}
        )
        
    })


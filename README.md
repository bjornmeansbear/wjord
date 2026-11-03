# Wjord

Markdown in, InDesign out.

Part of the Wjerk Software and Utilities Bundle.

## Why

I write in Markdown. I set books in InDesign. For years the trip between them went Markdown to HTML to XML to InDesign, by hand, one conversion at a time. It worked once. It never worked twice.

Wjord makes it one step. Save the text file. InDesign updates.

## How it works

Markdown says what a thing is. A `#` is a heading. A `*word*` is emphasis. It says nothing about how anything looks.

[Pandoc](https://pandoc.org) turns that structure into ICML, the InCopy story format. InDesign places ICML as a linked story. Every paragraph arrives tagged with a style name: `Header1`, `Paragraph`, `Blockquote`. Every bold or italic arrives as a character style: `Bold`, `Italic`, `Bold Italic`. No local overrides.

Your InDesign template holds the look. When a name in the story matches a style in the document, the document wins. The words live in Markdown. The form lives in the style sheet. The name is the joint between them.

Wjord is the glue Pandoc leaves out:

- **A watcher.** Save a `.md`, and its `.icml` rebuilds.
- **Your own styles.** Mark a block `::: pullquote` and it lands in a paragraph style called `Pullquote`.
- **Clean names.** Pandoc writes `Blockquote > Paragraph`. Wjord writes `Blockquote`.
- **A specimen.** One story that holds every style, for building your template.

## Install

You need [Pandoc](https://pandoc.org/installing.html). The installer will add it with Homebrew if it's missing.

```sh
git clone https://github.com/bjornmeansbear/wjord.git
cd wjord
./install.sh
```

## Use

**1. Build a template, once.**

```sh
wjord specimen
```

Place `wjord-specimen.icml` in a new InDesign document. Every Wjord style now sits in your Styles panels. Design each one. Delete the story. Save the file as a template (`.indt`).

**2. Write.** One Markdown file per chapter, in one folder.

**3. Watch.**

```sh
cd ~/my-book
wjord watch
```

Leave Terminal open. Each save rebuilds that chapter's `.icml`.

**4. Place.** In InDesign, File → Place the `.icml` and flow it into your frames.

**5. Update.** After you edit the Markdown, the Links panel flags the story. Update it. The text reflows.

## One rule

Never format the text in InDesign. An update replaces the whole story, and any local change goes with it. Every decision belongs in a paragraph or character style.

## Commands

```
wjord build [file.md ...]   Convert files (default: every .md here)
wjord watch [folder]        Rebuild each .icml whenever its .md is saved
wjord specimen [file.icml]  Write a story that holds every style
wjord styles                List the style names
wjord help

-o, --out DIR   Write .icml files into DIR
--raw           Keep Pandoc's nested names
```

## Your own styles

```markdown
::: pullquote
The pile knows what to do.
:::

The trip ran through [Ely, Nevada]{.place} on day four.
```

`pullquote` becomes the paragraph style `Pullquote`. `place` becomes the character style `Place`. Hyphens make capitals: `chapter-opener` becomes `ChapterOpener`. To name a style exactly, write `::: {custom-style="Pull Quote Large"}`.

## Style names

See [STYLES.md](STYLES.md), or run `wjord styles`.

## Notes

- **Images** come in as linked graphics, with paths relative to the Markdown file. Keep them beside the chapter.
- **Footnotes** become real InDesign footnotes.
- **Tables** become real InDesign tables, styled with `TablePar` and `TableHeader`.
- **The watcher** checks once a second and needs nothing beyond Bash and Pandoc. It runs on macOS and Linux.

## Credit

Pandoc does the hard part. John MacFarlane and its contributors built it. Wjord only joins it to InDesign.

## License

[MPL-2.0](LICENSE). Change it, share it, build on it. Changes to these files stay open.

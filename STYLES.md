# Style names

Every name Wjord writes into an `.icml` file. Build styles with these exact names in your InDesign template. Names are case-sensitive.

Run `wjord specimen` to get a story that uses all of them at once.

## Paragraph styles

| Markdown | Style |
|---|---|
| Plain paragraph | `Paragraph` |
| `#` to `######` | `Header1` to `Header6` |
| `> quote` | `Blockquote` |
| `- item`, first | `BulList > first` |
| `- item`, rest | `BulList` |
| Nested bullet, first | `BulList > BulList > first` |
| Nested bullet, rest | `BulList > BulList` |
| `1. item`, first | `NumList > first` |
| `1. item`, rest | `NumList` |
| Fenced code | `CodeBlock` |
| Footnote text | `Footnote` |
| Image | `Figure` |
| Image caption | `Caption` |
| Table cell | `TablePar` |
| Table header cell | `TablePar > TableHeader` |
| Table caption | `TableCaption` |
| Definition term | `DefListTerm` |
| Definition text | `DefListDef` |
| `::: name` | `Name` (your own) |

The `> first` styles exist so the first item of a list can carry extra space above it. Base them on the plain list style and change only that.

## Character styles

| Markdown | Style |
|---|---|
| `*text*` | `Italic` |
| `**text**` | `Bold` |
| `***text***` | `Bold Italic` |
| `` `text` `` | `Code` |
| `[text](url)` | `Link` |
| `^text^` | `Superscript` |
| `~text~` | `Subscript` |
| `~~text~~` | `Strikeout` |
| `[text]{.smallcaps}` | `SmallCaps` |
| `[text]{.name}` | `Name` (your own) |

For `Italic`, `Bold`, and `Bold Italic`, set only the font style and leave the font family blank. The style then inherits the typeface of whatever paragraph it sits in.

## Nested names

Pandoc names a paragraph by its container: `Blockquote > Paragraph`. Wjord trims the trailing `> Paragraph`, so you get `Blockquote`. List and table names keep their nesting, because it carries real information. Pass `--raw` to keep every name exactly as Pandoc wrote it.

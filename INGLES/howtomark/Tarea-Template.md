---
title: "THE DEFINITIVE GUIDE TO GENERATING SUPER COOL PDFs WITH MARKDOWN"
author: ShikaTheRock!
date: "24.9.2025"
subject: "ShikaTutorials"

titlepage: true
titlepage-rule-height: 0
titlepage-background: ./portada.jpg
toc: true
toc-own-page: true
titlepage-text-color: ffffff
page-background: ./watermark.jpg
---

# What is Markdown???

- Markdown is a lightweight markup language, created by John Gruber in 2004, that uses plain text to easily and quickly add formatting (bold, italic, lists, etc.). It also accepts tags from more complex languages like HTML or CSS styles.

# How to use Markdown???

- Markdown, even without using HTML or CSS features, is an extremely powerful tool, and its learning curve is much easier to master than Writer or Word.  

The basic commands are very simple, and some have already been adopted by WhatsApp — without realizing it, we’ve already gotten used to them.

- **But, what program do I need to install for Markdown???**

**NONE!!** Markdown is plain text!!! So you can use any plain text editor to write it. To start, I highly recommend Codium, VScode, or similar. If you’re feeling brave, you can try nvim + nvchad, but that’s another topic. And if you don’t have any of those, you always have vim or nano.

**I strongly recommend starting with this website to learn the basics:**

[Click here to learn Markdown](https://www.markdowntutorial.com/)

But if you don’t have time or the will, here are the basics:

## Headers

These replace `<h1>, <h2>`...

```markdown
# Title 1
## Title 2
### Title 3
#### Title 4
##### Title 5
###### Title 6
```

## Text

```markdown
*Italic text*  
**Bold text**  
***Bold and italic***  
~~Strikethrough~~  
`Inline text (code)`
```

## Lists

### Unordered list

```markdown
- Item 1
- Item 2
  - Sub-item
    - Sub-sub-item
```

### Ordered list

```markdown
1. First item
2. Second item
3. Third item
```

## Links

```markdown
[Link text](https://example.com)
```

## Images

```markdown
![Alt text](https://path/image.jpg)
```

## Quotes

```markdown
> This is a quote
>> This is a nested quote
```

## Code blocks

## Tables

```markdown
| Column 1 | Column 2 |
|----------|----------|
| Data 1   | Data 2   |
| Data 3   | Data 4   |
```

## Separators

```markdown
---
```

# METADATA, THE MAGIC

Metadata is what will give us the style so that pandoc can read it later. Here’s an example you can use to start styling your PDFs right away:

```markdown
---
title: "HOW TO GENERATE SUPER COOL PDFs WITH MARKDOWN"
author: ShikaTheRock!
date: "24.9.2025"
subject: "ShikaTutorials"

titlepage: true
titlepage-rule-height: 0
titlepage-background: ./cover.jpg
toc: true
toc-own-page: true
titlepage-text-color: ffffff
page-background: ./watermark.jpg
---
```

For `cover.jpg` and `watermark.jpg` you can choose any image, place it in the same folder as your `.md`, and rename them.

# EISVOGEL, A MUST-HAVE

Eisvogel, together with Markdown, is what makes our PDF possible. To install it:

Download the latest version of EISVOGEL:

https://github.com/Wandmalfarbe/pandoc-latex-template/releases/

Create the template directory:
```bash 
mkdir -p $HOME/.pandoc/templates
```

Unzip the template file and copy `eisvogel.latex` into the directory you just created:
```bash
unzip Eisvogel*
```

```bash
cp eisvogel.latex $HOME/.pandoc/templates/
```

# Transforming your .md into a .PDF

- Okay, we already have our `.md` file created… Now what???

At this point, we’ll need two key packages. If you can’t install programs on your machine, call your sysadmin to do it, or set up a virtual machine.

## Pandoc

Pandoc is the tool that allows us to convert one document format into another. It supports thousands of formats and is definitely worth exploring.

```bash
sudo apt install pandoc
```

## LaTeX

And then, to give our documents that nice professional format, we’ll need LaTeX:

```bash
# Install pipx environment
sudo apt install pipx

# Install for pandoc to use LaTeX (NOTE: without sudo)
pipx install pandoc-latex-environment

# Install LaTeX resources
sudo apt install texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra
```

Alternatively, you could install `texlive-full`, but it’s very heavy.

## The Command

Inside the same folder as your `.md`, run this command:

```bash
pandoc document.md -o document.pdf --template eisvogel.latex
```


## How to work together?

We can you this awesome VS Code extension: [Live Share](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare).

## How to compile Typst?

Typst is a markdown-like language that can be easily compiled to PDF files. For more information, please refer to the [Typst documentation](https://typst.app/docs/).

### 1. Using VS Code (recommended)

Install this extension for VS Code: [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist). You can enable auto-compile in the extension settings.

### 2. Using command line

Compile single file:

```bash
typst compile <input_file>
```

Auto-compile:

```bash
typst watch <input_file>
```

## 3. Using web app (not recommended)

Go to the [typst.app](https://typst.app/) and paste your code in the editor. 

## How to build mermaid diagrams?

### 1. Using web app

Go to the [mermaid.live](https://mermaid.live) and paste your code in the editor.

### 2. Using CLI

Install mermaid.cli:

```bash
npm install -g @mermaid-js/mermaid-cli
```

Compile mermaid code:

```bash
mmdc -i <input_file> -o <output_file>
# For example:
mmdc -i diagram.mmd -o diagram.svg -b transparent
```

> [!TIP]
> You can use this [extension](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid) to preview mermaid diagrams in VS Code.

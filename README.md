# nvim-tree-sitter-tpp

[Português](#português) | [English](#english)

---

## Português

Plugin de integração para o Neovim que registra a linguagem [TPP](https://github.com/Itiro-P/tree-sitter-tpp) (pseudocódigo educacional em português) no [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter), associa a extensão `.tpp` e ativa automaticamente highlight e fold ao abrir esses arquivos.

### O que o plugin faz

- Registra `.tpp` como filetype `tpp`.
- Registra a gramática [`tree-sitter-tpp`](https://github.com/Itiro-P/tree-sitter-tpp) no `nvim-treesitter`, para que ela possa ser instalada com `:TSInstall tpp`.
- Ativa `vim.treesitter.start()` e o fold baseado em tree-sitter automaticamente em qualquer buffer `.tpp`.

### Requisitos

- Neovim 0.12 ou mais recente (nightly)
- [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) (branch `main`) — **obrigatório**. Este plugin só registra a linguagem; quem baixa, compila o parser e instala as queries é o `nvim-treesitter`.
- [`tree-sitter-cli`](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md) instalado no sistema (pelo gerenciador de pacotes do seu SO, não via npm), usado pelo `nvim-treesitter` para compilar o parser
- `tar`, `curl` e um compilador C no `PATH`

### Instalação (lazy.nvim)

```lua
{
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
},
{
  "Itiro-P/nvim-tree-sitter-tpp",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {},
},
```

Depois de sincronizar os plugins (`:Lazy sync`), rode uma vez:

```vim
:TSInstall tpp
```

Isso baixa o `tree-sitter-tpp`, compila o parser e instala as queries de highlight, locals e fold.

> Não precisa rodar `:TSUpdate` antes — `:TSInstall` já dispara sozinho o evento que registra a linguagem `tpp` (é o mesmo evento que este plugin escuta no `setup()`), então funciona mesmo na primeira vez.

### Uso

Nenhuma configuração extra é necessária. Basta abrir um arquivo `.tpp` — highlight e fold já ficam ativos.

### Solução de problemas

Se ao abrir um arquivo `.tpp` aparecer o erro:

```
Parser could not be created for buffer 1 and language "tpp": No parser for language "tpp"
```

significa que o parser ainda não foi instalado pelo `nvim-treesitter`. Confirme que ele está na lista de plugins e rode `:TSInstall tpp` manualmente.

---

## English

Neovim integration plugin that registers the [TPP](https://github.com/Itiro-P/tree-sitter-tpp) language (an educational Portuguese-syntax pseudocode) with [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter), associates the `.tpp` extension, and automatically enables highlighting and folding when opening these files.

### What the plugin does

- Registers `.tpp` as the `tpp` filetype.
- Registers the [`tree-sitter-tpp`](https://github.com/Itiro-P/tree-sitter-tpp) grammar with `nvim-treesitter`, so it can be installed with `:TSInstall tpp`.
- Automatically calls `vim.treesitter.start()` and enables tree-sitter-based folding on any `.tpp` buffer.

### Requirements

- Neovim 0.12 or newer (nightly)
- [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) (`main` branch) — **required**. This plugin only registers the language; `nvim-treesitter` is what downloads and compiles the parser and installs the queries.
- [`tree-sitter-cli`](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md) installed on your system (via your OS package manager, not npm), used by `nvim-treesitter` to compile the parser
- `tar`, `curl`, and a C compiler on your `PATH`

### Setup (lazy.nvim)

```lua
{
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
},
{
  "Itiro-P/nvim-tree-sitter-tpp",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {},
},
```

After syncing your plugins (`:Lazy sync`), run once:

```vim
:TSInstall tpp
```

This downloads `tree-sitter-tpp`, compiles the parser, and installs the highlight, locals, and fold queries.

> You don't need to run `:TSUpdate` first — `:TSInstall` fires the same event on its own (the one this plugin listens for in `setup()`) that registers the `tpp` language, so it works even the first time.

### Usage

No extra configuration needed. Just open a `.tpp` file — highlighting and folding are already active.

### Troubleshooting

If opening a `.tpp` file shows the error:

```
Parser could not be created for buffer 1 and language "tpp": No parser for language "tpp"
```

it means the parser hasn't been installed by `nvim-treesitter` yet. Make sure it's in your plugin list and run `:TSInstall tpp` manually.

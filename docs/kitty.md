## Kitty Initial Configuration



### Nerd Fonts

> [kitty is not able to use my favorite font?](https://sw.kovidgoyal.net/kitty/faq/#kitty-is-not-able-to-use-my-favorite-font) 
>
> If you are trying to use a font patched with [Nerd Fonts](https://nerdfonts.com/) symbols, don’t do that as patching destroys fonts. There is no need, simply install the standalone `Symbols Nerd Font Mono` (the file `NerdFontsSymbolsOnly.zip` from the [Nerd Fonts releases page](https://github.com/ryanoasis/nerd-fonts/releases)). **kitty should pick up symbols from it automatically**, and you can tell it to do so explicitly in case it doesn’t with the [`symbol_map`](https://sw.kovidgoyal.net/kitty/conf/#opt-kitty.symbol_map) directive:
>
> ```shell
> # Nerd Fonts v2.2.2
> 
> symbol_map U+23FB-U+23FE,U+2665,U+26A1,U+2B58,U+E000-U+E00A,U+E0A0-U+E0A3,U+E0B0-U+E0C8,U+E0CA,U+E0CC-U+E0D2,U+E0D4,U+E200-U+E2A9,U+E300-U+E3E3,U+E5FA-U+E634,U+E700-U+E7C5,U+EA60-U+EBEB,U+F000-U+F2E0,U+F300-U+F32F,U+F400-U+F4A9,U+F500-U+F8FF Symbols Nerd Font Mono
> ```








![version](https://img.shields.io/badge/version-21.1%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)

# HDI_4DWP_InsertDoc

A 4D **HDI** (How Do I) example demonstrating programmatic 4D Write Pro document creation: inserting one Write Pro document's content into another, and inserting page/section/line breaks, both driven entirely by a user's text selection range. Originally published by 4D as a binary `.4DB` example for **4D v16**; converted to the modern `.4DProject` architecture so it runs on current 4D releases.

## Origin

This project started as a binary `.4DB` example database originally distributed with 4D v16. It was converted to the modern project architecture (`.4DProject`) using 4D 21's built-in binary-to-project conversion tool, then modernised (syntax, localisation, dark mode) with the help of **GitHub Copilot**.

- **Blog post:** https://blog.4d.com/4d-write-pro-document-creation-by-programming/
- **Original download:** https://download.4d.com/Demos/4D_v16/HDI_4DWP_InsertDoc.zip

## What it demonstrates

- `WP Insert document body`, inserting the content of a `[Countries].Description` (4D Write Pro `blob`) field into the current selection of another Write Pro document.
- `WP Insert break`, inserting a line, section, or page break at the current selection.
- Three **insertion modes** — `wk replace`, `wk append`, `wk prepend` — and two **range-extension modes** — `wk include in range` / `wk exclude from range` — selectable via radio buttons and applied identically to both commands.
- `WP Selection range` / `WP SELECT`, capturing the user's current selection before the insert and re-selecting it afterwards so the effect of each mode/extension combination is immediately visible.
- `WP New` built from a selection range (`Button1`), producing a second, independent Write Pro document (`wpDoc2`) from whatever text the user has selected.
- A 5-page tab control on `HDI2` covering: the "insert document" demo, the "insert break" demo, a `Countries` record browser (`NEXT RECORD`/`PREVIOUS RECORD`) supplying the source document, a live page/character count (`WP Get page count`, `WP Selection range`), and a document built from a selection range.

## Key commands

| Command | Used for |
|---|---|
| `WP Insert document body` | Inserting a Write Pro `blob` field's content into a document range (`Button2.4dm`) |
| `WP Insert break` | Inserting a line/section/page break into a document range (`Button.4dm`) |
| `WP Selection range` / `WP SELECT` | Reading and restoring the user's current text selection around each insert |
| `WP New` | Creating a fresh in-memory Write Pro document, optionally from a selection range (`Button1.4dm`) |
| `WP Import document` | Loading the bundled `doc.4wp`/`doc2.4wp` sample documents as the insertion source |
| `WP Get page count` | Live page/character counter shown at the bottom of the form (`mUpdateDocumentBottomText.4dm`) |
| `GOTO OBJECT` | Returning keyboard focus to the Write Pro area after each programmatic insert |

## How it works

`00_Start` opens the `HDI` splash form; its `BtnDemo` object method opens the demo form `HDI2`. `HDI2/method.4dm` handles `On Load` (loads the tab page descriptions via `init_HDI`, creates an empty `wpDoc2`) and `On Page Change` (imports `doc.4wp`/`doc2.4wp` as needed for the active page and refreshes the bottom status text).

Each demo button (`Button.4dm` insert break, `Button2.4dm` insert document) follows the same shape: capture `WP Selection range`, resolve the mode/break-type/extension-range from the page's radio buttons, call the Write Pro command, then reselect the range and refocus the Write Pro area so the result is visible without hunting for it.

## Points of interest

- The insertion **mode** (`replace`/`append`/`prepend`) and **range extension** (`include`/`exclude`) radio buttons are shared, module-level variables (`bReplace`, `bAppend`, `bPrepend`, `bInclude`, `bExclude`) bound directly as form `dataSource`s — there is no explicit "read the radio buttons" step in the button methods, the values are just already there.
- `Button1.4dm` (`WP New` from a selection range) is a one-liner and easy to miss, but it is the only place in the project showing that a *new* document can be seeded directly from an existing selection, as opposed to importing a file.
- The bottom-of-form page/character counter (`mUpdateDocumentBottomText`) is recalculated after every insert and on `On Page Change`, so it doubles as a quick way to confirm an insert actually happened.
- Startup uses the modern splash pattern: window-reuse detection, `CALL WORKER`, non-blocking `DIALOG(...;*)`, and `Form.quit`/`BtnDemo` object method instead of interprocess variables and `QUIT 4D`.
- Full XLIFF localisation (English + Japanese) covers the menu and both forms' text/labels, including the radio button labels for each mode/extension pair.
- The macOS buttons are sized via `form-theme` CSS media queries (27px Liquid Glass / 23px classic) rather than a hardcoded `height`, so they stay correctly rounded under macOS Tahoe.
- No listboxes are used anywhere in this project, so the usual `truncateMode`/`resizingMode` listbox defaults don't apply here.

## Project structure

```
Project/Sources/
  Forms/HDI/              Splash/startup form and its BtnDemo object method
  Forms/HDI2/              Main demo form: 5-page tab control, Write Pro areas, controls
  Methods/                 Startup, compiler declarations, shared helpers (init_HDI, mUpdateDocumentBottomText)
  styleSheets*.css         Dark mode + Liquid Glass button sizing
Resources/
  doc.4wp, doc2.4wp        Sample 4D Write Pro documents used as insertion sources
  init_Table-en/ja.json    Localized tab-page descriptions
  en.lproj/, ja.lproj/     XLIFF localisation (English source, Japanese target)
```

## Requirements

- 4D 21.1 or later (project `compatibilityVersion: 2101`)

## Modernisation notes

| Branch | Description | Instructions |
|--------|-------------|--------------|
| [`miyako-modernize-4d-hdi-project`](../../tree/miyako-modernize-4d-hdi-project) | Full modernisation: XLIFF localisation, `var`/`#DECLARE` syntax, standard menu actions, method visibility, a rebuilt startup dialog (window reuse, `CALL WORKER`, `BtnDemo` object method), and dark mode/Liquid Glass CSS. No listboxes exist in this project, so the listbox-defaults task was not applicable. | [localisation.instructions.md](.github/instructions/localisation.instructions.md), [variable.declarations.instructions.md](.github/instructions/variable.declarations.instructions.md), [menu.instructions.md](.github/instructions/menu.instructions.md), [method.visibility.instructions.md](.github/instructions/method.visibility.instructions.md), [startup.instructions.md](.github/instructions/startup.instructions.md), [css.instructions.md](.github/instructions/css.instructions.md), [tahoe.css.instructions.md](.github/instructions/tahoe.css.instructions.md), [listbox.instructions.md](.github/instructions/listbox.instructions.md) |

## References

- [4D blog: 4D Write Pro document creation by programming](https://blog.4d.com/4d-write-pro-document-creation-by-programming/)
- [`WP Insert document body`](https://developer.4d.com/docs/commands/wp-insert-document-body)
- [`WP Insert break`](https://developer.4d.com/docs/commands/wp-insert-break)
- [`WP Selection range`](https://developer.4d.com/docs/commands/wp-selection-range)
- [`WP New`](https://developer.4d.com/docs/commands/wp-new)
- [4D CSS stylesheets (dark mode, Liquid Glass)](https://developer.4d.com/docs/FormEditor/stylesheets)
- [Original download](https://download.4d.com/Demos/4D_v16/HDI_4DWP_InsertDoc.zip)

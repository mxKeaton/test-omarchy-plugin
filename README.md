# Test Omarchy Plugin

A deliberately minimal [Omarchy](https://omarchy.org/) shell plugin: a bar button
that opens a panel showing lorem ipsum text. Nothing else.

It exists as a safe, disposable target for exercising plugin-patching workflows
(for example, [PlugPatcher](https://github.com/mxKeaton/PlugPatcher)) end to end:
patch it, update it from origin, send a PR, and revert it — all without risking a
real plugin.

## What it does

- Adds a bar widget (a file icon).
- Clicking it opens a panel with a heading and two paragraphs of lorem ipsum.

## Install

```bash
omarchy plugin add https://github.com/mxKeaton/test-omarchy-plugin --enable
```

Or clone it into your plugin directory:

```bash
git clone https://github.com/mxKeaton/test-omarchy-plugin \
  ~/.config/omarchy/plugins/io.github.mxkeaton.test-omarchy-plugin
omarchy plugin enable io.github.mxkeaton.test-omarchy-plugin
```

## Remove

```bash
omarchy plugin remove io.github.mxkeaton.test-omarchy-plugin
```

## License

MIT

# Black Red Cyber Firefox Theme

This repository contains a clean-room Firefox static theme inspired by the public look and behavior of the `black21` AMO theme.

It does not include copied source files, assets, or metadata from `black21`. Instead, it recreates the same general direction from public-facing information: a true-black browser chrome, improved inactive-tab readability, and a brighter address bar field.

## Files

- `manifest.json` defines the Firefox static theme.
- `scripts/package.ps1` builds a distributable `.xpi` archive into `dist/`.

## Local development

To test the theme in Firefox:

1. Open `about:debugging#/runtime/this-firefox`.
2. Click `Load Temporary Add-on...`.
3. Select [`manifest.json`](/C:/Users/foo/projects/black-red-cyber-firefox-theme/manifest.json).

## Packaging

Run this from the repository root:

```powershell
.\scripts\package.ps1
```

The packaged add-on will be written to `dist/black-red-cyber-firefox-theme-<version>.xpi`.

## Notes

- Firefox static themes must be signed for normal installation outside temporary loading.
- If you want, the next step can be tuning this base toward a stronger red/cyber visual identity.

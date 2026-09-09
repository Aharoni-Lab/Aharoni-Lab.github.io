# aharoni-lab.com

Source for the Aharoni Lab website, built with [Jekyll](https://jekyllrb.com) and the [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/) theme, deployed to GitHub Pages on every push to `master`.

## Updating content

| What | Where |
|------|-------|
| Lab members | `_data/people.yml` (entries) and `People/index.md` (which entries appear in which section). Photos go in `People/`; keep them under ~700 px. |
| Publications | `_data/publications.yml` — add an entry at the top of its `type` group. |
| News | `_data/news.yml` — newest first. Shows on the home page (latest 5) and `/News/`. |
| Research, Join, Philosophy | Markdown pages in `Research/`, `Join/`, `Philosophy/`. |
| Papers citing our tools (Impact) | Pulled nightly from the lab Zotero group by `.github/workflows/update_citing_papers.yaml`, which opens a PR — merge it to publish. |
| Navigation | `_data/navigation.yml` |
| Site-wide settings | `_config.yml` |

## Local preview

```sh
bundle install
bundle exec jekyll serve
```

Requires Ruby (see `.ruby-version`). Pull requests trigger a build-only check in GitHub Actions.

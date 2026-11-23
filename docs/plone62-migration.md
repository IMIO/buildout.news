# Migrating News to Plone 6.2.3

Tracks the move of News (branch `plone62`, WEB-4533) to Plone 6.2.3 and
Python 3.14. Most of the work is shared with SmartWeb: this buildout extends
the `plone62` pins and sources of buildout.smartweb, and the packages leave
old-style namespace packages (PEP 420) the way the
[SmartWeb migration guide](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-migration.md)
describes. This page covers only what is specific to News: the packages it
checks out, what changed in this repository, and what's left before `plone62`
can be merged into `main`.

Last updated: 2026-11-20.

## Status

**16 packages**: **10 done** (released, pinned, the image installs the
release) · **3 merged**, not released · **3 branches pushed**, no PR yet

✅ done · ⬜ to do · ➖ not applicable · 🚧 its pinned release calls
`pkg_resources` and fails on Plone 6.2.3

| Package | Checked out by | Branch | PR | Merged | Released | Pinned |
|---|:-:|:-:|:-:|:-:|:-:|:-:|
| [imio.omnia.core](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imioomniacore) | prod | `plone62` | ⬜ | ⬜ | ⬜ | ⬜ |
| [imio.omnia.tinymce](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imioomniatinymce) | prod | `plone62` | ⬜ | ⬜ | ⬜ | ⬜ |
| [imio.helpers](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imiohelpers) 🚧 | dev, prod | `plone62` | ⬜ | ⬜ | ⬜ | ⬜ |
| [imio.pyutils](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imiopyutils) | dev, prod | `master` | [#4](https://github.com/IMIO/imio.pyutils/pull/4) | ✅ | ⬜ | ⬜ |
| [collective.autopublishing](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectiveautopublishing) | dev, prod | `master` | [#12](https://github.com/collective/collective.autopublishing/pull/12) | ✅ | ⬜ | ⬜ |
| [collective.upgrade](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectiveupgrade) | dev, prod | `master` | [#20](https://github.com/collective/collective.upgrade/pull/20) | ✅ | ⬜ | ➖ |
| [collective.behavior.talcondition](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectivebehaviortalcondition) | ➖ | ➖ | [#17](https://github.com/collective/collective.behavior.talcondition/pull/17) | ✅ | 2.0.0 | ✅ |
| [collective.fingerpointing](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectivefingerpointing) | ➖ | ➖ | [#110](https://github.com/collective/collective.fingerpointing/pull/110) | ✅ | 2.0.0 | ✅ |
| [collective.messagesviewlet](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectivemessagesviewlet) | ➖ | ➖ | [#24](https://github.com/collective/collective.messagesviewlet/pull/24) | ✅ | 2.0.0 | ✅ |
| [collective.privacy](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectiveprivacy) | ➖ | ➖ | [#22](https://github.com/collective/collective.privacy/pull/22) | ✅ | 2.0.0 | ✅ |
| [collective.timedevents](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectivetimedevents) | ➖ | ➖ | [#13](https://github.com/collective/collective.timedevents/pull/13) | ✅ | 2.0.0 | ✅ |
| [imio.gdpr](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imiogdpr) | ➖ | ➖ | [#5](https://github.com/IMIO/imio.gdpr/pull/5) | ✅ | 2.0.0 | ✅ |
| [imio.news.core](#imionewscore-and-imionewspolicy) | dev | `main` | [#15](https://github.com/IMIO/imio.news.core/pull/15) | ✅ | 2.0.0 | ✅ |
| [imio.news.policy](#imionewscore-and-imionewspolicy) | dev | `main` | [#12](https://github.com/IMIO/imio.news.policy/pull/12) | ✅ | 2.0.0 | ✅ |
| [imio.smartweb.common](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imiosmartwebcommon-core-locales-policy) | dev | `main` | [#37](https://github.com/IMIO/imio.smartweb.common/pull/37) | ✅ | 2.0.0 | ✅ |
| [imio.smartweb.locales](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#imiosmartwebcommon-core-locales-policy) | ➖ | ➖ | [#4](https://github.com/IMIO/imio.smartweb.locales/pull/4) | ✅ | 2.0.0 | ✅ |

Columns:

- **Checked out by**: the `auto-checkout` of `dev.cfg` (dev) and `prod.cfg`
  (prod, so the Docker image). A package checked out by prod only runs as a
  release on a dev instance, and one checked out by dev only
  (imio.news.core, imio.news.policy, imio.smartweb.common) runs as its
  pinned release in the image. ➖: no
  longer checked out, the pinned release is used.
- **Branch**: the branch mr.developer checks out. It comes from this
  repository's `sources.cfg` for imio.news.core and imio.news.policy, and
  from buildout.smartweb's `sources.cfg` for the others.
- **PR**: the pull request that merges the native branch. ⬜: none opened yet.
- **Released**: the native version on PyPI. **Pinned**: a `versions.cfg`
  (this one or buildout.smartweb's) pins it. ➖: collective.upgrade is never
  pinned, every config checks it out.

Each row links to the package's details in the SmartWeb guide, except the two
News packages, [described below](#imionewscore-and-imionewspolicy).

## What's left

### Open pull requests

- [x] imio.news.core [#15](https://github.com/IMIO/imio.news.core/pull/15)
  and imio.news.policy [#12](https://github.com/IMIO/imio.news.policy/pull/12):
  merged and released as 2.0.0.
- [ ] imio.news.policy's `base.cfg` (still in 2.0.0) checks out
  imio.news.core from its `plone62` branch, in a `[sources]` section of its
  own. imio.news.core 2.0.0 is released now: drop that checkout and use the
  release.

The PRs of the shared packages are tracked in the
[SmartWeb guide](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-migration.md#open-pull-requests).

### Clean up the checkouts

- [x] collective.messagesviewlet: dropped from `prod.cfg` (2026-11-19).
  `prod.cfg` checked it out from `plone62`, the branch buildout.smartweb's
  `sources.cfg` names, which was deleted once
  [#24](https://github.com/collective/collective.messagesviewlet/pull/24) was
  merged. mr.developer couldn't clone it, so the image no longer built. The
  image now installs the native 2.0.0 that buildout.smartweb pins.
- [x] imio.smartweb.locales: dropped from `auto-checkout`, and
  `imio.smartweb.locales = 1.1.51` removed from `versions.cfg`, in the same
  change (2026-11-19). `versions.cfg` is extended last, so its 1.1.51
  (old-style) overrode the 2.0.0 that buildout.smartweb pins: the checkout
  only hid it.
- [x] collective.timedevents and imio.gdpr: dropped from `auto-checkout`
  (2026-11-19). buildout.smartweb pins their native 2.0.0.
- [x] imio.smartweb.common: dropped from `prod.cfg` and from this
  repository's `sources.cfg` (2026-11-19). Its `plone62` branch was deleted
  once [#37](https://github.com/IMIO/imio.smartweb.common/pull/37) was
  merged. `versions.cfg` pins 2.0.0 in place of 1.2.65, so the image
  installs the release. `dev.cfg` still checks it out, from `main` now (the
  branch buildout.smartweb's `sources.cfg` names), as on this repository's
  `main`.
- [x] imio.news.policy: dropped from `prod.cfg` (2026-11-19). Its `plone62`
  branch was deleted once
  [#12](https://github.com/IMIO/imio.news.policy/pull/12) was merged.
  `versions.cfg` pins 2.0.0 in place of 1.1.11, so the image installs the
  release. `dev.cfg` still checks it out, from `main` now (this repository's
  `sources.cfg`).
- [x] collective.fingerpointing and collective.privacy: dropped from
  `auto-checkout` (2026-11-20). buildout.smartweb pins their native 2.0.0,
  which no longer calls `pkg_resources`.
- [x] imio.news.core: dropped from `prod.cfg` (2026-11-20). `versions.cfg`
  pins 2.0.0 in place of 1.2.30, so the image installs the release.
  `dev.cfg` still checks it out, from `main` now (this repository's
  `sources.cfg`).
- [x] collective.behavior.talcondition: dropped from `auto-checkout`
  (2026-11-20). [#17](https://github.com/collective/collective.behavior.talcondition/pull/17)
  is merged (its `plone62` branch deleted), and buildout.smartweb pins the
  native 2.0.0.
- [x] collective.upgrade: this repository's `sources.cfg` no longer sets its
  branch (2026-11-20). `dev.cfg` and `prod.cfg` check out `master`, the
  branch buildout.smartweb's `sources.cfg` names, into which
  [#20](https://github.com/collective/collective.upgrade/pull/20) merged the
  native namespace and the Plone 6.2 support. `plone61` is 34 commits behind
  `master` and lacks the Plone 6.2 support. Still checked out: not released.
- [ ] `sources.cfg` has a pas.plugins.kimug line that no config checks out:
  delete it. buildout.smartweb pins 2.0.0.
- [ ] Make `dev.cfg` and `prod.cfg` check out the same packages. Today only
  prod checks out imio.omnia.core and imio.omnia.tinymce, so a dev instance
  doesn't run the code of the image. imio.news.core, imio.news.policy and
  imio.smartweb.common, checked out by dev only, are intended.

### Release

When the Plone 6.2 stack goes to production. A PyPI release can't depend on a
git branch, so the order matters:

- [ ] The shared packages first, in the order of the
  [SmartWeb guide](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-migration.md#release).
  imio.smartweb.common is done: 2.0.0 is released and pinned in
  `versions.cfg`.
- [x] imio.news.core and imio.news.policy: 2.0.0 released and pinned in
  `versions.cfg` (they drop Plone 6.1). `dev.cfg` still checks them out,
  from `main`.

### Check by hand on a News site

- [ ] Search and indexing. A fresh site leaves collective.solr inactive (the
  profile installs it, doesn't turn it on), so the image tests search with
  the catalog. Where Solr is turned on, check search and indexing with
  collective.solr 11.0.0.dev0
  ([details](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-packages.md#collectivesolr))
  and the `news` core.
- [ ] The faceted views of the news folders.
- [ ] The news item add and edit forms: lead image cropping, topics and
  "I am" taxonomies, autopublishing dates.
- [ ] `make upgrade-steps` on a copy of the production database: no step left
  pending.
- [ ] Health probes on port 8081 (`/live`, `/ready`, `/startup`) and
  `@@metrics`.

### When `plone62` is merged into `main`

- [ ] `base.cfg`: extend buildout.smartweb's `main` again (once its own
  `plone62` is merged).
- [x] `sources.cfg`: back to `main`/`master`, or the lines dropped once the
  packages are released. Every line names `main` (2026-11-20), the
  collective.upgrade one is gone.
- [ ] Delete `.github/workflows/plone62.yml` and its section in
  `.github/workflows/README.md`.
- [ ] `dev.yml` and `staging.yml`: test the image before tagging it, as
  `plone62.yml` does, so a failing image never gets the `:dev` or `:staging`
  tag.

## What changed in buildout.news

### Plone 6.2.3 (`8cdacbf`)

- `base.cfg` extends the Plone 6.2.3 pins, and buildout.smartweb's `plone62`
  `sources.cfg` and `versions.cfg`. Products.PloneHotfix20261110 is no longer
  installed.
- `requirements.txt` only includes Plone 6.2.3's requirements: the security
  advisory pins (plone.autoform, plone.restapi, plone.app.content, pip,
  certifi) are gone.
- `sources.cfg` checks out imio.news.core, imio.news.policy and
  imio.smartweb.common from their `plone62` branch (imio.smartweb.common was
  on `WEB-4404-ban-after-commit`).
- `dev.cfg` and `prod.cfg` check out the packages whose releases still call
  `pkg_resources` ([Status](#status)).
- Dockerfile: base image `plone-base:6.2.3` with Python 3.14, pip 26.3,
  zc.buildout 6.0.2, setuptools 84.2.1 and wheel 0.48.0. Debian packages
  renamed in the new base image: `libpcre3-dev` → `libpcre2-dev`,
  `libmemcached11` → `libmemcached11t64`, `libxml2` → `libxml2-16`.

### plone.observability (`247de6e`)

The same WSGI pipeline as buildout.smartweb: health probes on port 8081
(`/live`, `/ready`, `/startup`), the `@@metrics` endpoint and OpenTelemetry
tracing, inactive until `OTEL_EXPORTER_OTLP_ENDPOINT` is set.

### Image tests and CI

As in buildout.smartweb and buildout.events: `make test`, `tests/`, and the
`tests.yml` and `plone62.yml` workflows ([Testing](#testing)).

### Checkouts dropped

collective.messagesviewlet (its branch was gone, so the image no longer
built), imio.smartweb.locales with its 1.1.51 pin, collective.timedevents and
imio.gdpr. All four now come from the native 2.0.0 releases that
buildout.smartweb pins.

imio.smartweb.common, from `prod.cfg` only: its `plone62` branch was gone
too. The image installs the native 2.0.0, which `versions.cfg` pins in place
of 1.2.65. A dev instance checks out `main`
([details](#clean-up-the-checkouts)).

imio.news.policy, from `prod.cfg` only, for the same reason: the image
installs the native 2.0.0, which `versions.cfg` pins in place of 1.1.11. A
dev instance checks out `main`. Same for imio.news.core (2.0.0 in place of
1.2.30).

collective.fingerpointing and collective.privacy: both now come from the
native 2.0.0 releases that buildout.smartweb pins. Same for
collective.behavior.talcondition.

collective.upgrade is still checked out, from `master` now instead of
`plone61`: this repository's `sources.cfg` no longer overrides
buildout.smartweb's.

## imio.news.core and imio.news.policy

**Namespaces** `imio`, `imio.news` · **Repositories**
[IMIO/imio.news.core](https://github.com/IMIO/imio.news.core) and
[IMIO/imio.news.policy](https://github.com/IMIO/imio.news.policy), branch
`main` · **Variant**
[setup.py](https://github.com/IMIO/buildout.smartweb/blob/plone62/docs/native-namespaces-migration.md#the-migration-recipe)
· **Checked out by** `dev.cfg` ·
**Older stacks** (Plone 6.1) stay on 1.2.x and 1.1.x

Migrated by a colleague on 2026-11-18. Each branch is 3 commits ahead of
`main`:

- PEP 420: `namespace_packages` and the namespace declarations are gone.
  setuptools finds the packages itself, and they no longer depend on
  setuptools.
- Their `base.cfg` extends Plone 6.2.3 and buildout.smartweb's `plone62`, and
  checks out the packages whose releases call `pkg_resources` (imio.helpers,
  collective.behavior.talcondition, collective.privacy, plus
  collective.autopublishing and collective.timedevents for the policy).
  imio.news.core's `base.cfg` no longer loads horse-with-no-namespace.
- Classifiers: Plone 6.2 only, and Python 3.14, which the CI matrix now tests.

imio.news.policy is merged into `main`
([#12](https://github.com/IMIO/imio.news.policy/pull/12)) and released as
**2.0.0** on 2026-11-19 (Python 3.12+, Plone 6.2 only). imio.news.core is
merged into `main` ([#15](https://github.com/IMIO/imio.news.core/pull/15))
and released as **2.0.0** on 2026-11-20. `versions.cfg` pins both, so the
image installs the releases.

## Testing

**Locally**: `make test` builds the production image from this checkout
(`prod.cfg`). It boots the image with Postgres 17 and memcached, and
collective.big.bang creates the site with `imio.news.policy`. Then it runs:

- the generic checks of
  [IMIO/gha `plone-image-test-notify`](https://github.com/IMIO/gha/tree/v8/plone-image-test-notify);
- `tests/test_news.py`: create an entity, a news folder, a folder and a news
  item, and render them.

There is no Solr in the test stack: imio.news.policy installs collective.solr
but leaves it inactive. `tests/log_allowlist.txt` lists the log records that
are expected, and why.

Last run 2026-11-20, with collective.behavior.talcondition no longer checked
out (the image installs its 2.0.0) and collective.upgrade checked out from
`master`: 12 passed (the 11 generic checks, no pending upgrade step
included, and the News test).

**On CI**: each push to `plone62` runs `plone62.yml`. It builds the image
once as `:{short_sha}`, tests it with `tests.yml`, scans it with trivy, and
tags it `:plone62` only if the tests pass. Nothing is deployed. See
[the CI/CD workflows](../.github/workflows/README.md#plone62yml--publish-and-test-plone62-image).

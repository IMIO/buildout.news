1.4.3 (2025-01-09)
------------------

- imio.news.core 1.2.14

    - WEB-4153 : Add a new cacheRuleset to use with our custom rest endpoints
      [remdub]

- imio.news.policy 1.1.5

    - WEB-4153: Set moderateCaching for imio.news.core.rest
      [remdub]


1.4.2 (2024-10-14)
------------------

- Sync gunicorn version with Plone 6.0.9
  [remdub]


1.4.1 (2024-07-31)
------------------

- WEB-3995 : Bump RelStorage to 4.0.0
  [remdub]

- WEB-3995 : Bump psycopg2 to 2.9.9
  [remdub]

- Upgrade to Zope 5.9
  [remdub]


1.4 (2024-07-02)
----------------

- Upgrade docker image to Ubuntu 22.04
  [remdub]


1.3.10-quick (2024-06-21)
-------------------------

- imio.news.core 1.2.13

    - WEB-4088 : Use one state workflow for imio.news.NewsFolder / imio.news.Folder
      [boulch]

- imio.news.core 1.2.12

    - Add news lead image (preview scale) for odwb
      [boulch]


1.3.9 (2024-06-10)
------------------

- imio.news.core 1.2.11

    - WEB-4113 : Use `TranslatedAjaxSelectWidget` to fix select2 values translation
      [laulaz]

- imio.smartweb.common 1.2.17

    - WEB-4113 : Add `TranslatedAjaxSelectFieldWidget` to fix translations of initial
      values in select2 fields
      [laulaz]

- imio.smartweb.common 1.2.16

    - WEB-4107 : Update resource registries modification time (used as ETag) at Zope startup
      [laulaz]


1.3.8-quick (2024-05-31)
------------------------

- imio.news.core 1.2.10

    - WEB-4088 : Fix missing include in zcml for ODWB endpoints
      [laulaz]


1.3.7 (2024-05-30)
------------------

- imio.smartweb.common 1.2.15

    - Fix missing ZCML dependency
      [laulaz]

- imio.news.core 1.2.9

    - WEB-4101 : Add index for local category search
      [laulaz]

    - Fix bad permission name
      [laulaz]

    - WEB-4088 : Cover use case for sending data in odwb for a staging environment
      [boulch]

    - WEB-4088 : Add some odwb endpoints (for news , for entities)
      [boulch]

- imio.smartweb.locales 1.1.18

    - Add missing FR translations
      [laulaz]

- imio.smartweb.locales 1.1.17

    - Add missing fr/de/nl translations for Skip to content/navigation/footer
      [boulch]

    - Update translations
      [boulch]

- imio.smartweb.locales 1.1.16

    - Add missing French translations for `Carre` & categories / topics display on items
      [laulaz]

    - Add missing fr, nl, de translations
      [boulch]

    - Update translations
      [boulch]

- imio.smartweb.locales 1.1.15

    - Add missing fr, nl, de translations
      [boulch]

- imio.smartweb.locales 1.1.14

    - Add missing fr, nl, de translations
      [boulch]

    - Update translations
      [boulch]

- imio.smartweb.common 1.2.14

    - Fix bundles: Remove obsolete patterns bundle and fix a previous upgrade for
      eea.facetednavigation
      [laulaz]

    - Fix translate call (was causing incorrect string in .po file)
      [laulaz]

    - Fix translation message string
      [laulaz]

- imio.smartweb.common 1.2.13

    - WEB-4088 : Cover use case for sending data in odwb for a staging environment
      [boulch]

    - Ensure translation of vocabularies when used with `AjaxSelectFieldWidget`
      [laulaz]

    - Remove useless `container_uid` from `search-filters` results
      [laulaz]

    - WEB-3864 : Ensure that a taxonomy term that is deleted is not used anywhere
      [boulch]

    - WEB-3862 : Unpatch (restore original) eea.facetednavigation jquery
      [laulaz]

- imio.smartweb.common 1.2.12

    - WEB-4102 : Add second skip to footer
      [thomlamb]

- Migrate buildout to Plone 6.0.9 (was already partly done)
  [laulaz]

- imio.smartweb.common 1.2.11

    - WEB-4101 : Fix vocabulary terms translation (for Topics only - for the moment)
      when used with `AjaxSelectFieldWidget`
      [laulaz]

- imio.smartweb.common 1.2.10

    - WEB-4101 : Change Topics field widget to keep value ordering
      [laulaz]

    - WEB-4088 : Implement some odwb utils and generic classes
      [boulch]

- imio.news.core 1.2.8

    - WEB-4101 : Use local category (if any) instead of category in `category_title` indexer
      [laulaz]


1.3.6 (2024-04-04)
------------------

- imio.news.core 1.2.7

    - Fix : serializer and message "At least one of these parameters must be supplied: path, UID"
      [boulch]

- imio.news.core 1.2.6

    - MWEBPM-9 : Add container_uid as metadata_field to retrieve news folder id/title in news serializer and set it in our json dataset
      [boulch]


1.3.5 (2024-03-25)
------------------

- imio.news.core 1.2.5

    - Fix template for translations
      [boulch]

- imio.smartweb.locales 1.1.13

    - Add missing fr, nl, de translations
      [boulch]

    - Update translations
      [boulch]

- imio.news.core 1.2.4

    - WEB-4068 : Add field to limit the new feature "adding news in any news folders" to some entities
      [boulch]

- imio.news.core 1.2.3

    - WEB-4068 : Adding news in any news folders where user have rights
      [boulch]


1.3.4 (2024-03-05)
------------------

- imio.news.core 1.2.2

    - WEB-4072, WEB-4073 : Enable solr.fields behavior on some content types
      [remdub]

    - WEB-4006 : Exclude some content types from search results
      [remdub]

    - MWEBRCHA-13 : Add versioning on imio.news.NewsItem
      [boulch]

- collective.solr 9.3.0

    - Add support of https connections
      [remdub]

    - Add french locales
      [remdub]

- collective.solr 9.2.3

    - Add upgrade step for missing stopwords registry entries
      [remdub]


1.3.3 (2024-02-12)
------------------

- imio.smartweb.common 1.2.9

    - WEB-4064 : Reindex SolR because of changes in schema
      [remdub]

- imio.smartweb.common 1.2.8

    - Fix skip content sr-only
      [thomlamb]

- imio.smartweb.common 1.2.7

    - WEB-4046 : Add css for "Skip to content"
      [thomlamb]

    - WEB-4046 : Add "Skip to content" link for a11y
      [laulaz]

    - WEB-4048 : Put focus on cookies accept button for a11y
      [laulaz]


1.3.2 (2024-01-29)
------------------

- imio.news.core 1.2.1

    - WEB-4041 : Handle new "carre" scale
      [boulch]

- imio.smartweb.common 1.2.6

    - WEB-4041 : Add new "carre" scale
      [boulch]

- imio.smartweb.common 1.2.5

    - WEB-4007 : Get ContactProperties out of imio.smartweb.core to also use it in imio.directory.core and simplifying formated schedule displaying in REACT directory view
      [boulch]

    - WEB-4029 : File and Image content types don't have WF so we set effective date equal to created date
      [boulch]

- imio.smartweb.common 1.2.4
    - WEB-3783 : Rebuild url with request.form datas (usefull with react views)
      [boulch]


1.3.1-quick (2023-11-23)
------------------------

- Release to force new docker tag / deploy after incomplete build
  [laulaz]


1.3 (2023-11-22)
----------------

- imio.smartweb.common 1.2.3

    - Improve image compression quality
      [laulaz]
  
    - Change portrait scales dimensions
      [laulaz]

- imio.smartweb.common 1.2.2

    - Fix missing values for facilities lists (causing None in REST views filters) See collective/collective.solr#366
      [laulaz]

    - Fix last upgrade steps: when run from command line, we need to adopt admin user to find private objects
      [laulaz]

    - WEB-4003 : Fix missing TextField mimetypes
      [laulaz]

- imio.smartweb.common 1.2.1

    - SUP-33128 : Fix eea.facetednavigation : Hide items with 0 results
      [boulch, laz]

    - Refactor less and js compilation + Add compilations files
      [boulch]

- imio.smartweb.locales 1.1.9

    - WEB-4018 : Add missing French translations (new termes in directory vocabulary)
      [boulch]
  
- imio.smartweb.locales 1.1.8

    - Add missing French translations
      [laulaz]

- imio.smartweb.locales 1.1.7

    - Add missing French translations
      [boulch]

    - Update translations
      [boulch]

- imio.smartweb.locales 1.1.6

    - Add missing French translations (external content section and contact section)
      [boulch]

- imio.smartweb.locales 1.1.5

    - Add missing translations
      [boulch]

- imio.smartweb.locales 1.1.4

    - Add missing French translation (folder_contents properties)
      [laulaz]

    - Migrate to Plone 6.0.4
      [boulch]

- Develop collective.solr to implement https connection DEVOPS-3
  [remdub]

- imio.news.core 1.2

    - WEB-3985 : Use new portrait / paysage scales & logic
      [boulch, laulaz]

    - WEB-3985 : Remove old cropping information when image changes
      [boulch, laulaz]

- imio.smartweb.common 1.2

    - WEB-3985 : New portrait / paysage scales & logic.
      We have re-defined the scales & sizes used in smartweb.
      We let the user crop only 2 big portrait / paysage scales and make the calculation behind the scenes for all
      other smaller scales.
      We also fixed the cropping information clearing on images changes.
      [boulch, laulaz]


1.2.5 (2023-10-09)
------------------

- imio.news.policy 1.1.4

    - WEB-3954 : Hide cropping action on Image type
      [boulch]
    - Migrate to Plone 6.0.4
      [boulch]

- imio.news.core 1.1.4

    - WEB-3989 : Fix infinite loop on object deletion
      [laulaz]

    - Migrate to Plone 6.0.4
      [boulch]

- Get pas.plugins.imio 2.0.9 from buildout.smartweb

    - Fix login could be id of user.
      [bsuttor]

    - Fix byte convertion error on python3.
      [bsuttor]

- imio.smartweb.common 1.1.8

    - WEB-3960 : Clean unhautorized xml chars out of text when added or modified contents Temporary patch.
      Waiting for this fix : plone/plone.app.z3cform#167
      [boulch]

    - WEB-3955 : Authentic sources : Crop view on Image type should not return scales
      [boulch]

- imio.smartweb.common 1.1.7

    - Change banner scale to have infinite height
      [laulaz]

    - Migrate to Plone 6.0.4
      [boulch]

- Rollback to Zope 5.8 for now because of a bug in POST requests with gunicorn
  [boulch]

- WEB-3781 : Add autopublish script
  [remdub]
  
- Migrate to Plone 6.0.4
  [boulch]


1.2.4 (2023-04-25)
------------------

- imio.smartweb.common 1.1.6

    - Don't use image_scales metadata anymore (Fix faceted)
      [boulch, laulaz]

    - Update object modification date if cropping was removed/updated
      [boulch, laulaz]

- imio.news.policy 1.1.3

    - Add module : collective.messagesviewlet
      [boulch]

    - Migrate to Plone 6.0.2
      [boulch]


1.2.3-quick (2023-03-20)
------------------------

- Push images to prod registry.
  [bsuttor]


1.2.2 (2023-03-19)
------------------

- imio.smartweb.common 1.1.5

    - WEB-3862 : Patch (Remove select2) eea.facetednavigation jquery
      [laulaz, boulch]

- Get collective.solr = 9.1.1 from buildout.smartweb/versions.cfg
  [boulch]

- imio.smartweb.locales 1.1.3

    - Add missing French translations (Cirkwi & image dimensions warning)
      [laulaz]

    - Migrate to Plone 6.0.2
      [boulch]

- imio.news.core 1.1.3

    - Add warning message if images are too small to be cropped
      [laulaz]

    - Migrate to Plone 6.0.2
      [boulch]

    - Fix reindex after cut / copy / paste in some cases
      [laulaz]

- imio.smartweb.common 1.1.4

    - Allow to add portal messages when content images are too small for cropping. This can be done dynamically on a view call with a single line of code: show_warning_for_scales(self.context, self.request)
      [laulaz]

    - Migrate to Plone 6.0.2
      [boulch]


1.2.1-quick (2023-03-08)
------------------------

- Develop collective.solr to fix an issue with image_scales metadata
  [mpeeters]


1.2.0 (2023-03-07)
------------------

- Migrate to Plone 6.0.2
  [boulch]

- imio.smartweb.locales 1.1.2

    - WEB-3848 : Add missing translations
      [boulch]

- imio.smartweb.common 1.1.3

    - WEB-3852 : Fix atom/syndication registry keys
      [boulch]


1.2 (2023-02-20)
----------------

- imio.news.core 1.1.2

    - Remove unused title_fr and description_fr metadatas
      [laulaz]

    - Remove SearchableText_fr (Solr will use SearchableText for FR)
      [laulaz]

- imio.smartweb.common 1.1.2

    - Call @@consent-json view on navigation root (instead of context)
      [laulaz]

    - Ensure Ajax requests are always uncached
      [laulaz]

- Update to Plone 6.0.0.2
  [laulaz]

- imio.smartweb.common 1.1.1

    - Allow to choose language for vocabulary term translation
      [laulaz]

    - Use bootstrap dropdown-toggle for fieldsets collapse icon on edit forms
      [laulaz]

    - Fix TinyMCE menu bar and format menu
      [laulaz]

    - Update widget.pt override from plone.app.z3cform.templates
      [laulaz]

    - Improve monkeypatch to fix TTW resource calling
      [laulaz]

    - Update buildout to get Plone 6.0.0 final
      [laulaz]

- imio.smartweb.locales 1.1

    - Add DE translations (with copied French sentences for now)
      [laulaz]

    - Update buildout to Plone 6.0.0 final
      [laulaz]

- imio.news.core 1.1.1
    
    - Add new descriptions metadatas and SearchableText indexes for multilingual
      [laulaz]

- imio.news.policy 1.1.2

    - Install and configure autopublishing (with 15 min tick subscriber)
      [boulch]

    - Remove obsolete TinyMCE override
      [laulaz]

    - Remove available languages (we don't need them anymore)
      [laulaz]

- imio.news.policy 1.1.1

    - Fix ugly/deprecated browserlayer Interface
      [boulch]

- imio.smartweb.common 1.1

    - Add monkeypatch to fix TTW resource calling See plone/Products.CMFPlone#3705
      [laulaz]

    - Uninstall collective.js.jqueryui
      [boulch]

    - Remove faceted deprecated bundles
      [boulch]

    - Migrate to Plone 6 : remove dexteritytextindexer, use new simplified resources registry, fix TinyMCE configuration and images scales, manual minimized js
      [laulaz, boulch]

- imio.news.policy 1.1

    - Update to Plone 6.0.0 final
      [boulch]

- imio.news.core 1.1

    - Update to Plone 6.0.0 final
      [boulch]


1.1 (2022-11-24)
----------------

- imio.news.core 1.0.1

    - Fix SearchableText index for multilingual
      [laulaz]

- imio.news.core 1.0

    - Add multilingual features: New fields, vocabularies translations, restapi serializer
      [laulaz]

- imio.news.policy 1.0

    - Add available languages to prepare for multilingual
      [laulaz]

    - Use collective.z3cform.select2 for taxonomy widget
      [laulaz]

    - Update buildout to use Plone 6.0.0a3 packages versions
      [boulch]

    - Add GenericSetup caching profile
      [sverbois]

- imio.smartweb.locales 1.0.8

    - Add missing French translations (Sendinblue, multilingual)
      [laulaz]

- imio.smartweb.locales 1.0.7

    - Add some directory fields translations
      [boulch]

    - Exclude profiles.zcml from translations
      [laulaz]

- imio.smartweb.common 1.0.10

    - Ignore batch related query parameters for search-filters endpoint
      [laulaz]

- imio.directory.common 1.0.9

    - Add helper method to get language from smartweb REST requests This is needed for multilingual authentic sources
      [laulaz]

    - Allow to translate vocabulary terms titles in search-filters endpoint This is needed for multilingual authentic sources
      [laulaz]

- imio.directory.common 1.0.8

    - MWEB-54 : Update TinyMCE : Add non breaking space option
      [boulch]

- imio.news.core 1.0a5

    - WEB-3757 : Automaticaly create some defaults newsfolders (with newsfolder subscription) when creating a new entity
      [boulch]

    - Add eea.faceted.navigable behavior on Entity & NewsFolder types
      [laulaz]


1.0.7 (2022-09-06)
------------------

- Blobs are now on filesystem.
  [bsuttor]

- imio.news.core 1.0a4

    - WEB-3726 : Add subjects (keyword) in SearchableText
      [boulch]


1.0.6-quick (2022-07-18)
------------------------

- Update pas.plugins.imio 2.0.6.
  [bsuttor]


1.0.5-quick (2022-07-14)
------------------------

- imio.news.core 1.0a3

    - Ensure objects are marked as modified after appending to a list attribute
      [laulaz]

    - Fix selected_news_folders on newsitems after creating a "linked" newsfolder
      [boulch]

- imio.smartweb.common 1.0.7

    - Add connection link in colophon
      [laulaz]

- imio.smartweb.common 1.0.6

    - Add ban_physicalpath method (taken from policy)
      [boulch, laulaz]

- imio.smartweb.common 1.0.5

    - Refactor rich description to retrieve html on a any description
      (from context or from other ways)
      [boulch]

- imio.smartweb.locales 1.0.6

    - Add Dutch translations files
      [laulaz]

    - Add faceted map translation
      [laulaz]

    - Add propose URLs translations
      [laulaz]

- imio.smartweb.locales 1.0.5

    - Add translation for Agent connection
      [laulaz]

- imio.smartweb.locales 1.0.4

    - Add translations for contact gallery
      [laulaz]

    - Add translations for post-it section
      [laulaz]


1.0.4 (2022-07-13)
------------------

- Update pas.plugins.imio 2.0.5, see https://github.com/IMIO/pas.plugins.imio/blob/2.0.5/CHANGES.rst
  [bsuttor]


1.0.3 (2022-05-03)
------------------

- imio.smartweb.locales 1.0.3

    - Add translation for image upload
      [laulaz]

    - Add translations for new icons
      [laulaz]

- imio.smartweb.locales 1.0.2

    - Add Hero banner related translations
      [laulaz]

- imio.smartweb.locales 1.0.1

    - Add missing translation for Local Manager & lead image portrait mode
      [laulaz]

- imio.smartweb.locales 1.0

    - Change 'minisite' to 'site partenaire' in French
      [laulaz]

    - Add icon field related translations
      [laulaz]

- imio.smartweb.locales 1.0a16

    - Fix translation
      [laulaz]

- imio.smartweb.locales 1.0a15

    - Add new icons translations (e-guichet & shopping)
      [laulaz]

- imio.smartweb.locales 1.0a14

    - Add social network translation
      [laulaz]

- imio.smartweb.locales 1.0a13

    - Add event dates related translations
      [laulaz]

- imio.smartweb.locales 1.0a12

    - Add e_guichet view and taxonomies instance behaviors translations
      [laulaz]

- imio.news.core 1.0a2

    - Use unique urls for images scales to ease caching
      [boulch]

    - Use common.interfaces.ILocalManagerAware to mark a locally manageable content
      [boulch]

    - Update buildout to use Plone 6.0.0a3 packages versions
      [boulch]

- imio.smartweb.common 1.0.4

    - Limit uploaded files sizes to 20Mo with JS (without reaching the server)
      [laulaz]

    - Add help text on lead image field also on edit forms
      [laulaz]

- imio.smartweb.common 1.0.3

    - Hide faceted actions
      [boulch]

- imio.smartweb.common 1.0.2

    - Hide unwanted upgrades from site-creation and quickinstaller
      [boulch]

    - Add local manager role and sharing permissions rolemap
      [boulch]

    - Add help text on lead image fields
      [boulch]

    - Fix privacy views JS calls (sometimes called on Zope root instead of Plone root)
      [laulaz]

    - Add Subject keywords to SearchableText index
      [laulaz]


1.0.2 (2022-03-29)
------------------

- Remove gunicorn timeout to allow long requests
  [laulaz]

- Switch collective.solr from auto-checkout to 9.0.0a6 pinned buildout.smartweb version
  [boulch]


1.0.1-quick (2022-03-17)
------------------------

- imio.smartweb.common 1.0.1

    - Allow readers, editors and reviewers to see inactive (expired) contents
      [laulaz]

- imio.smartweb.common 1.0.

    - Avoid traceback if @@get_analytics is called outside Plone site
      [laulaz]

- imio.smartweb.common 1.0a11

    - Load Analytics via JS call to avoid non-privacy aware caching
      [laulaz]

    - Change privacy views permissions to zope.Public
      [laulaz]

- imio.smartweb.common 1.0a10

    - Hide ical import related actions
      [laulaz]

- imio.smartweb.common 1.0a9

    - Update buildout to use Plone 6.0.0a3 packages versions
      [boulch]

    - Remove unneeded override: it has been included in plone.app.z3c.form
      See https://github.com/plone/plone.app.z3cform/issues/138
      [laulaz]

- Use https:// instead of git:// protocol
  See https://github.blog/2021-09-01-improving-git-protocol-security-github/
  [laulaz]


1.0 (2022-03-01)
----------------

- Use Gunicorn instead of Waitress.
  [bsuttor]

- Add py-spy for debugging.
  [bsuttor]

- Update buildout to use Plone 6.0.0a3 packages versions
  [boulch]


1.0a1 (2022-01-26)
------------------

- Initial release
  [boulch]

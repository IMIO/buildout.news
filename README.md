# buildout.news

This repository contains the Buildout configuration for **News**, the centralized news source platform used by Walloon local authorities (pouvoirs locaux). It is part of the broader Smartweb ecosystem and integrates seamlessly with Plone 6-based Smartweb sites.

## Overview

The **News** platform provides a shared environment where multiple local authorities can create, manage, and publish news articles. These articles can then be synchronized and displayed on Smartweb websites.

This `buildout.news` repository contains the complete Buildout setup to install, configure, and deploy the centralized Plone 6 instance used to manage news content.

## Purpose

- Provide a central point of truth for news data.
- Allow reuse of news content across multiple local authority sites.
- Enable integration with Smartweb via Solr or REST APIs.

## Integration with Smartweb

Smartweb websites fetch news data from this centralized instance, enabling:

- Cross-site news publication
- Syndication by theme, location, or audience
- Better performance and consistency through external Solr indexing or REST API usage

## Contributing

Feel free to open issues or submit pull requests if you find bugs or want to improve the setup.

## Maintainers

- iMio

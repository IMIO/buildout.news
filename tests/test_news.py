"""News checks, run by `make test` after the generic image checks.

The fixtures (`site_url`, `admin`) come from the pytest plugin of
IMIO/gha plone-image-test-notify.
"""

TIMEOUT = 60
HTML = {"Accept": "text/html"}


def create(admin, container_url, portal_type, title, **fields):
    response = admin.post(
        container_url,
        json={"@type": portal_type, "title": title, **fields},
        timeout=TIMEOUT,
    )
    assert response.status_code == 201, response.text
    return response.json()["@id"]


def test_create_and_render(admin, site_url):
    # zip_codes is required: a token of the imio.smartweb.vocabulary.Cities vocabulary.
    entity = create(
        admin, site_url, "imio.news.Entity", "Test entity", zip_codes=["5000"]
    )
    news_folder = create(admin, entity, "imio.news.NewsFolder", "Test news folder")
    folder = create(admin, news_folder, "imio.news.Folder", "Test folder")
    news_item = create(admin, folder, "imio.news.NewsItem", "Test news item")
    for url in (entity, news_folder, folder, news_item):
        response = admin.get(url, headers=HTML, timeout=TIMEOUT)
        assert response.status_code == 200, url

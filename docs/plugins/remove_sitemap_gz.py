import os

from mkdocs.config.base import Config


def main(config: Config):
    os.remove(os.path.join(config.site_dir, "sitemap.xml.gz"))

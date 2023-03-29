import os
import re

from ruamel.yaml import YAML
from mkdocs.config.base import Config
from mkdocs.structure.files import Files
from mkdocs.structure.pages import Page


yaml = YAML()


def main(markdown: str, page: Page, config: Config, files: Files):
    if page.title == "Charts":
        return filter_repo_readme(markdown, page, config)
    elif page.url.startswith("charts"):
        return filter_chart_readme(markdown, page, config)


def filter_repo_readme(markdown: str, page: Page, config: Config):
    # Update page title
    page.title = "Introduction"
    markdown = markdown.split("\n", 1)[-1]
    markdown = "# Introduction\n" + markdown

    # Exclude chart overview from search
    overview_re = re.compile(r"^(## Chart Overview)", re.MULTILINE)
    markdown = overview_re.sub(r"\1 { data-search-exclude }", markdown)

    # Hide navigation
    page.meta["hide"] = ["navigation"]

    return markdown


def filter_chart_readme(markdown: str, page: Page, config: Config):
    # Remove homepage section
    homepage_re = re.compile(r"^\*\*Homepage:\*\*.*$", re.MULTILINE)
    markdown = homepage_re.sub("", markdown)

    # Change YAML link targets to point to the repo
    yaml_re = re.compile(r"\(\./(.*\.yaml)\)")
    markdown = yaml_re.sub(f"({config.repo_url}/blob/main/{page.url}\\1)", markdown)

    # Set metadata from Chart.yaml
    yaml_file = os.path.join(os.path.dirname(page.file.abs_src_path), "Chart.yaml")
    with open(yaml_file) as f:
        contents = yaml.load(f)
        if "description" in contents:
            page.meta["description"] = contents["description"]
        if "keywords" in contents:
            page.meta["tags"] = contents["keywords"]

    return markdown

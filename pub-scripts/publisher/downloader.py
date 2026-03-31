"""Helpers to discover and download external tooling jars.

This module fetches Maven metadata and resolves the latest available
`tooling-cli` jar used for CQF tooling. It intentionally stays small and
depends only on `xmltodict` and the stdlib network helpers.
"""

from urllib.request import urlopen
import xmltodict
from .config import (
    CQF_TOOLING_MANIFEST,
    CQF_TOOLING_REPO,
    CQF_TOOLING_JAR_PREFIX,
    DEFAULT_CQF_VERSION,
)


def get_latest_cqf_tooling_url() -> str:
    """Return a URL pointing at the latest CQF tooling jar.

    The function reads the Maven `maven-metadata.xml` file and prioritizes
    `latest`, then `release`, and falls back to `DEFAULT_CQF_VERSION`.

    Returns:
        A complete HTTP URL to the tooling-cli jar.
    """
    cqf_url = CQF_TOOLING_REPO
    file = urlopen(CQF_TOOLING_MANIFEST)
    data = file.read()
    file.close()

    cqf_data = xmltodict.parse(data)

    # Prefer 'latest' then 'release' metadata keys, fall back to default
    if (
        'metadata' in cqf_data
        and 'versioning' in cqf_data['metadata']
        and 'latest' in cqf_data['metadata']['versioning']
    ):
        ver = cqf_data['metadata']['versioning']['latest']
        cqf_url = f"{cqf_url}/{ver}/{CQF_TOOLING_JAR_PREFIX}{ver}.jar"
    elif (
        'metadata' in cqf_data
        and 'versioning' in cqf_data['metadata']
        and 'release' in cqf_data['metadata']['versioning']
    ):
        ver = cqf_data['metadata']['versioning']['release']
        cqf_url = f"{cqf_url}/{ver}/{CQF_TOOLING_JAR_PREFIX}{ver}.jar"
    else:
        print("Could not find latest version in manifest, defaulting to " + DEFAULT_CQF_VERSION)
        cqf_url = f"{cqf_url}/{DEFAULT_CQF_VERSION}/{CQF_TOOLING_JAR_PREFIX}{DEFAULT_CQF_VERSION}.jar"

    print("Latest CQF Tooling URL: " + cqf_url)
    return cqf_url

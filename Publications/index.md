---
title: "Publications"
---

\* equal contribution · † co-corresponding author. A complete record is on [ORCID](https://orcid.org/0000-0003-4931-8514). For the 200+ papers by other groups that use our tools, see [Impact](/Impact/).

## Peer-reviewed articles

<ul class="publications">
{% assign pubs = site.data.publications | where: "type", "article" %}
{% for pub in pubs %}{% include publication.html pub=pub %}{% endfor %}
</ul>

## Preprints

<ul class="publications">
{% assign pubs = site.data.publications | where: "type", "preprint" %}
{% for pub in pubs %}{% include publication.html pub=pub %}{% endfor %}
</ul>

## Reviews, editorials, and book chapters

<ul class="publications">
{% assign pubs = site.data.publications | where: "type", "review" %}
{% for pub in pubs %}{% include publication.html pub=pub %}{% endfor %}
</ul>

## Conference proceedings

<ul class="publications">
{% assign pubs = site.data.publications | where: "type", "proceedings" %}
{% for pub in pubs %}{% include publication.html pub=pub %}{% endfor %}
</ul>

## Patents

<ul class="publications">
{% assign pubs = site.data.publications | where: "type", "patent" %}
{% for pub in pubs %}{% include publication.html pub=pub %}{% endfor %}
</ul>

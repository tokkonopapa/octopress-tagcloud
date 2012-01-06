Tag Cloud for Octopress
=======================

Description:
------------
Easy output tag cloud and category list.

Files:
------

    .
    ├─ plugins/
    │  └── tag_cloud.rb
    └─ source/
       └─ _includes/
          └─ custom/
             └─ asides/
                ├─ category_list.html
                └─ tag_cloud.html

Syntax:
-------
    {% tag_cloud [counter:true] %}
    {% category_list [counter:true] %}

Example:
--------
In some template files, you can add the following markups.

### source/_includes/custom/asides/tag_cloud.html ###

    <section>
      <h1>Tag Cloud</h1>
        <span id="tag-cloud">{% tag_cloud %}</span>
    </section>

### source/_includes/custom/asides/category_list.html ###

    <section>
      <h1>Categories</h1>
        <ul id="category-list">{% category_list counter:true %}</ul>
    </section>

Notes:
------
Be sure to insert above template files into `default_asides` array in `_config.yml`.
And also you can define styles for 'tag-cloud' or 'category-list' in a `.scss` file.
(ex: `sass/custom/_styles.scss`)

Licence:
--------
Distributed under the [MIT License][MIT].

[MIT]: http://www.opensource.org/licenses/mit-license.php

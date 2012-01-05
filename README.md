Tag Cloud for Octopress
=======================

Description:
------------
Easy output tag cloud and category list.

Syntax:
-------
    {% tag_cloud [counter:true] %}
    {% category_list [counter:true] %}

Example:
--------
In some template files, you can add the following markups.

    <section>
      <h1>Tag Cloud</h1>
        <span id="tag-cloud">{% tag_cloud %}</span>
    </section>

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
Copyright &copy; 2012 [tokkonopapa][AUTHOR].  
Distributed under the [MIT License][MIT].

[AUTHOR]: [tokkonopapa](http://tokkonopapa.github.com)
[MIT]: http://www.opensource.org/licenses/mit-license.php

# Tag Cloud for Octopress
# =======================
# 
# Description:
# ------------
# Easy output tag cloud and category list.
# 
# Syntax:
# -------
#     {% tag_cloud [counter:true] %}
#     {% category_list [counter:true] %}
# 
# Example:
# --------
# In some template files, you can add the following markups.
# 
# ### source/_includes/custom/asides/tag_cloud.html ###
# 
#     <section>
#       <h1>Tag Cloud</h1>
#         <span id="tag-cloud">{% tag_cloud %}</span>
#     </section>
# 
# ### source/_includes/custom/asides/category_list.html ###
# 
#     <section>
#       <h1>Categories</h1>
#         <ul id="category-list">{% category_list counter:true %}</ul>
#     </section>
# 
# Notes:
# ------
# Be sure to insert above template files into `default_asides` array in `_config.yml`.
# And also you can define styles for 'tag-cloud' or 'category-list' in a `.scss` file.
# (ex: `sass/custom/_styles.scss`)
# 
# Licence:
# --------
# Distributed under the [MIT License][MIT].
# 
# [MIT]: http://www.opensource.org/licenses/mit-license.php
# 
module Jekyll

  class TagCloud < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      @opts = nil
      if markup.strip =~ /\s*counter:(\w+)/i
	    puts $1
        @opts = true
        markup = markup.strip.sub(/counter:\w+/i,'')
      end
      super
    end

    def render(context)
      lists = {}
      max, min = 1, 1
      @config = context.registers[:site].config
      @categories = context.registers[:site].categories
      @categories.keys.sort_by{ |str| str.downcase }.each do |category|
        count = @categories[category].count
        lists[category] = count
        max = count if count > max
      end

      html = ''
      lists.each do | category, counter |
        url = get_category_url category
        style = "font-size: #{100 + (60 * Float(counter)/max)}%"
        if @opts
          html << "<a href='#{url}' style='#{style}'>#{category.capitalize}(#{@categories[category].count})</a>"
        else
          html << "<a href='#{url}' style='#{style}'>#{category.capitalize}</a>"
        end
      end
	  html
    end

    private
    def get_category_url(category)
      File.join @config['root'], @config['category_dir'], category.gsub(/_|\P{Word}/, '-').gsub(/-{2,}/, '-').downcase
    end
  end

  class CategoryList < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      @opts = nil
      if markup.strip =~ /\s*counter:(\w+)/i
        @opts = true
        markup = markup.strip.sub(/counter:\w+/i,'')
      end
      super
    end

    def render(context)
      html = ""
      @config = context.registers[:site].config
      @categories = context.registers[:site].categories
      @categories.keys.sort_by{ |str| str.downcase }.each do |category|
        url = get_category_url category
        if @opts
          html << "<li><a href='#{url}'>#{category.capitalize} (#{@categories[category].count})</a></li>"
        else
          html << "<li><a href='#{url}'>#{category.capitalize}</a></li>"
        end
      end
	  html
    end

    private
    def get_category_url(category)
      File.join @config['root'], @config['category_dir'], category.gsub(/_|\P{Word}/, '-').gsub(/-{2,}/, '-').downcase
    end
  end

end

Liquid::Template.register_tag('tag_cloud', Jekyll::TagCloud)
Liquid::Template.register_tag('category_list', Jekyll::CategoryList)

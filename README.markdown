BlogTags
==========
BlogTags is an extension for the [Radiant CMS][1] that provides some useful blogging tags. OK, for now there are just three tags. But they're really useful. Honest!

The latest version is available on [GitHub][6].

        git clone git://github.com/santry/blog_tags.git


`previous` and `next`
=====================
The `previous` and `next` tags get the previous and next siblings of the current page, sorted by the `published_at` date. For example,

	<r:previous><r:link/></r:previous>
	
will get the previous page according to the `published_at` date and output a link to it. You can specify which attribute to use for comparison in the `by` attribute. To get the next page according to the page `title`, use

    <r:next by="title"><r:link/></r:next> 

Inside the `next` and `previous` tags you can use whatever page tags you like and they'll refer to the next or previous page. If your pages have a `summary` part, you could output the summary for the next page like this:

	<r:next><r:content part="summary"/></r:next>
	
Of course I have no idea _why_ you'd want to do that, but you could.

Since this is the BlogTags plugin, the `previous` and `next` tags are designed to be used in a blog. Here's how I use the `previous` and `next` tags on [my site][2] to provide links to the previous and next blog entries:

	<div class="article-nav">
		<p><r:previous><r:link>&laquo;&nbsp;<r:title/></r:link>&nbsp;&nbsp;</r:previous>
		   <r:next><r:link><r:title/>&nbsp;&raquo;</r:link></r:next></p>
	</div>
	
This produces HTML like

	<div class="article-nav">
		<p><a href="/articles/2006/06/06/jimmy-and-ginas-wedding/">&laquo;&nbsp;Jimmy and Gina's Wedding</a>&nbsp;&nbsp;<a 	
		    href="/articles/2006/06/22/railsconf-2006/">RailsConf 2006&nbsp;&raquo;</a></p>
	</div>

When you're viewing the first page in a sequence, the `previous` tag outputs nothing. The `next` tag outputs nothing if you're at the last page in a sequence. Also, virtual pages (like "Archive Day Index" or "Page Not Found") are excluded from the page sequence, since you probably don't want to link to them this way.


`time_ago_in_words`
===================
The `time_ago_in_words` tag outputs the `published_at` date of the page (or, for unpublished pages, `created_at`) in natural language. For example, if it's 4:00pm and the page was published at 1:00pm the tag

	<r:time_ago_in_words/>
	
would output `about 3 hours`. I use it like this in my blog:

	<p class="article-author">Posted by <r:author /> <r:time_ago_in_words /> ago</p>
	
which outputs something like:

	<p class="article-author">Posted by Sean about 3 hours ago</p>
	

Questions?
==========
If you have questions you can find me on the [Radiant mailing lists][3] or you can contact me through [my website][2]. Good luck!


Acknowledgments
===============
Thanks to [John Long][4] for creating Radiant and for providing a starting point for the `previous` and `next` tags. Thanks also to [Sean Cribbs][5] for his suggestion on simplifying my `time_ago_in_words` implementation.



[1]: http://radiantcms.org/
[2]: http://seansantry.com/
[3]: http://radiantcms.org/mailing-list/
[4]: http://wiseheartdesign.com/
[5]: http://seancribbs.com/
[6]: http://github.com/santry/blog_tags/
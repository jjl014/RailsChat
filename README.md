# RailsChat

Page Caching
set config.action.perform_caching to true.
limit the amount of chat messages shown in the chat controller
add caches_page :index, :show
However if any updates are made, page doesn't update cause still displaying
previously cached page
So we need to set an expiration for this cached page
In the post controller add
after_filter :clear_posts_cache,
             :only => [:create, :update, :destroy]

def clear_posts_cache
  expire_page :action => :index &
  expire_page :action => :show, :id => @post
end

Changing cache location in /config/environment.rb
config.action_controller.page_cache_directory = RAILS_ROOT + "/public/cache/"

When to use page caching?
- When every user sees the same content on a page

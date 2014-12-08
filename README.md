RailsProfiler
=============

RailsProfiler adds a toolbar to your Rails apps
revealing useful high level profiling information about every request
that's made as you visit the pages in your app.

Currently shows :

1. Total memory growth caused by the page load (in MBs)
This shows the approximate memory growth of the page. This value is auto
updated to include the growth caused by AJAX requests triggered from the page.
You'll see negative values if a GC was triggered while the page was loading.
You can pass the following URL params in the address bar :

  1. rp-gc=true/false : Turns on/off GC before measuring memsize for this
     and subsequent requests

## Usage

1. Add `rails_profiler` to your Gemfile
2. Add `//= require 'rails_profiler'` to your app's application.js manifest.
3. `bundle install`
4. Run Rails server

You should be able to see a bar on every page which contains profiing info
of that page (and other requests made from the page - auto updated to include
profiling info of AJAX requests too).


## LICENSE
MIT


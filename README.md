dang!
=====

Quick fixes for common frustrations.

Installation
------------

```sh
git clone https://github.com/justinforce/dang
cd dang
make install
```

Usage
-----

```sh
dang help     # Show all commands
dang mysql    # Restart MySQL
dang selenium # Restart Selenium
dang solr     # Re-index solr in apm_bundle directory
dang upgrade  # Upgrade this script in via git
```

apm_bundle directory
--------------------

Your apm_bundle directory is assumed to be `~/code/apm_bundle`. That's probably
not where it is! To fix this, set your apm_bundle directory thusly:

```sh
echo "export APM_BUNDLE=~/src/apm_bundle" >> .dangrc
```

Obviously, substitute the actual path to your repo in there.

More Fun!
---------

It is _highly_ recommended that you symlink this script with a more satisfying
name. If you're a BSG fan, you might try

```sh
ln -s dang ~/bin/frak
```

Use your imagination, and you might just discover the original name of this
script! ;)

License and Copyright
---------------------

This script is copyright AppFolio, Inc. It's licensed under the
[MIT License][mit-license].

[mit-license]: http://www.opensource.org/licenses/MIT

# LoremCasiano

This gem describes the way to build a gem using bundler

## Tutorial

1. $ bundle gem lorem_casiano
      create  lorem_casiano/Gemfile
      create  lorem_casiano/Rakefile
      create  lorem_casiano/LICENSE
      create  lorem_casiano/README.md
      create  lorem_casiano/.gitignore
      create  lorem_casiano/lorem_casiano.gemspec
      create  lorem_casiano/lib/lorem_casiano.rb
      create  lorem_casiano/lib/lorem_casiano/version.rb
    Initializating git repo in /Users/casiano/Dropbox/src/ruby/makingagemwithbundler/lorem_casiano
    makingagemwithbundler$ cd lorem_casiano/

    As it says, it initializes a git repo

2. The lorem_casiano.gemfile file looks like this:

  $ cat lorem_casiano.gemspec 
      # -*- encoding: utf-8 -*-
      require File.expand_path('../lib/lorem_casiano/version', __FILE__)

      Gem::Specification.new do |gem|
        gem.authors       = ["Casiano Rodriguez"]
        gem.email         = ["casiano.rodriguez.leon@gmail.com"]
        gem.description   = %q{TODO: Write a gem description}
        gem.summary       = %q{TODO: Write a gem summary}
        gem.homepage      = ""

        gem.files         = `git ls-files`.split($\)
        gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
        gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
        gem.name          = "lorem_casiano"
        gem.require_paths = ["lib"]
        gem.version       = LoremCasiano::VERSION
      end
3. The version for the project is taken from lib/lorem_casiano/version.rb

            $ cat lib/lorem_casiano/version.rb 
            module LoremCasiano
              VERSION = "0.0.1"
            end

   modify it to "0.0.2"

4. vi lib/lorem_casiano.rb. Introduce method ipsum

5. Fill the TODOs and homepage fields in lorem_casiano.gemspec
         vi lorem_casiano.gemspec

6. Generate the gem:

      $ gem build lorem_casiano.gemspec 
        Successfully built RubyGem
        Name: lorem_casiano
        Version: 0.0.2
        File: lorem_casiano-0.0.2.gem

which generates a file "lorem_casiano-0.0.2.gem"

7. Push the gem to rubygems.org

          $ gem push lorem_casiano-0.0.2.gem 
          Pushing gem to https://rubygems.org...
          Successfully registered gem: lorem_casiano (0.0.2)

Of course you have to have an account in rubygems.org

8. Lead your browser to "https://rubygems.org/gems/lorem_casiano".
   Your gem must be allocated there

9. The "Gemfile" file has this contents:

      $ cat Gemfile 
      source 'https://rubygems.org'

      # Specify your gem's dependencies in lorem_casiano.gemspec
      gemspec

The "gemspec" leads Bundler to use "lorem_casiano.gemspec"
to solve the dependencies. This way, there is no need to specify
dependencies here.

10. $ bundle
  Fetching gem metadata from https://rubygems.org/....
  Installing diff-lcs (1.1.3) 
  Using lorem_casiano (0.0.3) from source at /Users/casiano/Dropbox/src/ruby/makingagemwithbundler/lorem_casiano 
  Installing rspec-core (2.10.1) 
  Installing rspec-expectations (2.10.0) 
  Installing rspec-mocks (2.10.1) 
  Installing rspec (2.10.0) 
  Using bundler (1.1.3) 
  Your bundle is complete! Use `bundle show [gemname]` to see where a bundled gem is installed.

10. A new call to bundle recomputes and install the dependencies:

  $ bundle
    Fetching gem metadata from https://rubygems.org/....
    Installing diff-lcs (1.1.3) 
    Using lorem_casiano (0.0.3) from source at /Users/casiano/Dropbox/src/ruby/makingagemwithbundler/lorem_casiano 
    Installing rspec-core (2.10.1) 
    Installing rspec-expectations (2.10.0) 
    Installing rspec-mocks (2.10.1) 
    Installing rspec (2.10.0) 
    Using bundler (1.1.3) 
    Your bundle is complete! Use `bundle show [gemname]` to see where a bundled gem is installed.

11. The Rakefile contains:

$ cat Rakefile 
  #!/usr/bin/env rake
  require "bundler/gem_tasks"

Thes are the tasks that provides:

  $ rake -T
  rake build    # Build lorem_casiano-0.0.3.gem into the pkg directory
  rake install  # Build and install lorem_casiano-0.0.3.gem into system gems
  rake release  # Create tag v0.0.3 and build and push lorem_casiano-0.0.3.gem to Rubygems

12. Let us see the "build" target:

    $ rake build
    lorem_casiano 0.0.3 built to pkg/lorem_casiano-0.0.3.gem

    Now we have this structure:

      $ tree
      .
      ├── Gemfile
      ├── Gemfile.lock
      ├── LICENSE
      ├── README.md
      ├── Rakefile
      ├── lib
      │   ├── lorem_casiano
      │   │   └── version.rb
      │   └── lorem_casiano.rb
      ├── lorem_casiano-0.0.2.gem
      ├── lorem_casiano.gemspec
      └── pkg
          └── lorem_casiano-0.0.3.gem

13. We can install the gem:

      $ rake install
      lorem_casiano 0.0.3 built to pkg/lorem_casiano-0.0.3.gem
      lorem_casiano (0.0.3) installed

14. 
## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

##See Also

1. http://railscasts.com/episodes/245-new-gem-with-bundler
   "New Gem with Bundler"

2. http://no-fucking-idea.com/blog/2012/04/11/building-gem-with-bundler/ 
   "Building Gem With Bundler"

3. http://pablotron.org/files/signing_gems.txt


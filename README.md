# Rft

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/rft`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rft'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rft

## Usage

### Options Commands with 1 parameter ###
$ rft -help # displays this info <br />
$ rft -folder # displays current working path <br />

### Options Commands with 2 parameters ###
$ rft filename.format -props # displays file properties <br />

### Access Commands with 1 paramater ###
$ rft filename.format # reads filename content <br />
$ rft --All # reads all files contents <br />
$ rft -list # lists all text-like files <br />

### Access Commands with 3 paramaters ###
$ rft filename.format -find phrase # searches for phrase in file and, if spoted, displays the lines <br />
$ rft --All -find phrase # searches for phrase in all textlike files and, if spoted, displays the lines <br />
$ rftfilename.format -uniqs uniqsname.format # creates new file with uniq phrases only <br />

### Mutation Commands with 2 parameters ###
$ rft filename.format -owtxt # overwrites text in file content by user input <br />
$ rft filename.format -apptxt # appends at the end of text in file content with user input <br />
$ rft filename.format -clr # clears the file content, and makes it a blank file <br />
$ rft filename.format -del # deletes the file <br />
$ rft --All -del # deletes all textlike files <br />
$ rft filename.format -new # creates new file by given filename.format <br />

### Mutation Commands with 3 parameters ###
$ rft filename.format -rename renamed.format # renames the file, can also change the format <br />
$ rft filename.format -rename renamed.format # renames the file, can also change the format <br />
$ rft filename.format -remove phrase # removes phrase from file <br />
$ rft --All -remove phrase # removes phrase from textlike files <br />
$ rft filename.format -copy new_file.format # copies all content from file to newly created new_file <br />

### Mutation Commands with 4 parameters ###
$ rft filename.format -rep from_phrase to_phrase # find/replace words in file by provided from_/to_ phrases <br />
$ rft --All -rep from_phrase to_phrase # find/replace words in all textlike files by provided from_/to_ phrases <br />

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rft.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

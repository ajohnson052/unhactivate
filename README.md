## Synopsis

Unhactivate is a website for tracking security breaches and notifying users. Users are able to choose organizations that they would like to watch, and they will receive email notifications if Unhactivate hears about a breach at that organization.

## Installation

Open PostgreSQL if it is not already running on your machine. If you have never downloaded Postgres, installation instructions can be found at http://www.postgresql.org/.

Run the following from the command line:

```
$ bundle
$ rake db:create
$ rake db:migrate
$ rake db:seed
$ rails s
```

The rails server is set up to run from port 3000 in the development environment.

## API Reference

The initial seed file was created from the API at https://haveibeenpwned.com/API/v2.

## Contributors

[mooniker](https://github.com/mooniker)
[KoryJCampbell](https://github.com/KoryJCampbell)
[ajohnson052](https://github.com/ajohnson052)

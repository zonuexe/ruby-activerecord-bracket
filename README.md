# ActiveRecord::Bracket [![Build Status](https://travis-ci.org/zonuexe/ruby-activerecord-bracket.png?branch=develop)](https://travis-ci.org/zonuexe/ruby-activerecord-bracket) [![Code Climate](https://codeclimate.com/github/zonuexe/ruby-activerecord-bracket.png)](https://codeclimate.com/github/zonuexe/ruby-activerecord-bracket) [![Dependency Status](https://gemnasium.com/zonuexe/ruby-activerecord-bracket.png)](https://gemnasium.com/zonuexe/ruby-activerecord-bracket)

Provide bracket-method `[]` to index-like access for ActiveRecord Class. It method is a syntax-sugar of `find_by_slug` (dynamic-finder of ActiveRecord).

## Requirement

 * **Ruby** (1.9+, 2.0)
 * Ruby on Rails (3.x)
   * Not yet supported rails 4

## Installation

Add this line to your application's Gemfile:

    gem 'activerecord-bracket'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-bracket

## Introduction

*(Japanese)*

 * **ID** とは *別の* 唯一の識別子を持つテーブルを前提とします (ex. Twitter)
   * Twitterのアカウントには、作成時に任意で選択する変更可能な **Username** (一般に `@zonu_exe` のようにユーザを識別するために使用される) と、変更不可能でアカウント作成時に自動で付番される(10進整数のみからなる) **ID** が存在します
 * **slug** とは、文字集合が概ねASCIIからなる、平易なURIとして *期待される* 文字列のことです
   * この用語はWordPressから輸入しました。実際にはWordPressではASCIIのみといった制限はありませんし、 `ActiveRecord::Bracket` においてもその制限はModelのvalidationのみに依存します

### Setup

*(Japanese)*

 * ActiveRecordを継承したモデルに `slug` 列を用意します ( **カラム名の制限は撤廃予定です** )
   * この列は **uniqueness** であることが望ましいです (必須ではありませんが、 `find_by_slug` の構文糖でしかないことに留意しないと想定外の挙動をするおそれがある)

## Usage

```ruby
# define system supported language
Language.create(name: 'Japanese', slug: 'ja')
Language.create(name: 'English' , slug: 'en')

# get Language instance object
ja = Language[:ja] #=> #<Language id: 1, name: "Japanese", slug: "ja">
en = Language[:en] #=> #<Language id: 2, name: "English", slug: "en">

# filter non-supported languages
ko = Language[:ko] #=> nil
fr = Language[:fr] #=> nil

# sanitize
errorkeystr = 'kimiha jitsuni baka dana'
_ = Language[errorkeystr] #=> nil
```

*(Japanese)*

 * `Model.[]` の引数は `String`, `Symbol` のどちらでもActiveRecordがよしなに扱ってくれます。たぶん。

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
